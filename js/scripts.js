thirst = { id: "#thirst", clicked: false };
urinating = { id: "#urinating", clicked: false };
itchiness = { id: "#vitchiness", clicked: false };
dysfunction = { id: "#dysfunction", clicked: false };
blurvision = { id: "#blurvision", clicked: false };
fatigue = { id: "#fatigue", clicked: false };
weightloss = { id: "#weightloss", clicked: false };
drymouth = { id: "#drymouth", clicked: false };
abdominalpain = { id: "#abdominalpain", clicked: false };
nausea = { id: "#nausea", clicked: false };
irritability = { id: "#irritability", clicked: false };
yeast = { id: "#yeast", clicked: false };
wounds = { id: "#wounds", clicked: false };
numbness = { id: "#numbness", clicked: false };
teethandgum = { id: "#teethandgum", clicked: false };
hunger = { id: "#hunger", clicked: false };

function clicked(symptom) {

    var id = symptom.id;

    alert(id);
    var results = $.grep(objArray, function (e) {
        return e.id === id;
    });

    alert(id + " " +results[0].length);
/*
	if (!symptom.clicked) {
		$(symptom.id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		symptom.clicked = true;
	}
	else {
		$(symptom.id).css({ "color": "grey", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
		symptom.clicked = false;
	}*/
}

	function initialize()
	{
	$.get('DA', { command: "init" }, function (responseText) {
				setSession(responseText);
				ajaxCall("question", responseText);
				});
	}

function createArray() {
	var submitArray = [thirst,urinating,itchiness,dysfunction,blurvision,fatigue,weightloss,drymouth,abdominalpain,nausea,irritability,yeast,wounds,numbness,teethandgum,hunger];
	return submitArray;
}

function countClicks() {
	var count = 0;
	var array = createArray();
	for (var x=0;x<array.length;x++) {
		if (array[x].clicked) {
			count++;
		}
	}
	return count;
}

function submitSymptoms() {
	var submitArray = createArray();
	var counter = 0;
	var count = countClicks();
	for (var x=0;x<submitArray.length;x++) {
		if (submitArray[x].clicked) {
			var symptomObject = submitArray[x];
			var symptomName = $(symptomObject.id).attr('value'); 
			if (counter == (count - 1)) {
				$.get('servlet',{symptoms:symptomName,process:"complete"});
				x = submitArray.length;
			} else {
				$.get('servlet',{symptoms:symptomName,process:"incomplete"});
			}

			counter++;
		}

}
$("#advisor").animate({ "height": "95%" }, 1000, "easeInOutCirc", function () {
	$("#symptom1,#symptom2").fadeIn();
});
$("#menu").fadeOut();
$("#patient").animate({ "bottom": "-101%" },1000,"easeInOutCirc", function () {
	$("#symptoms").fadeOut(0);
	$("#lifestyle").fadeIn();
});

}

var count = 0;

function revert()
{
	if (count == 1) {
		$("#intro").fadeIn(0);
		count--;
		$("#gender,#profile #male, #profile #female").fadeOut(0);
		$("#button").css({ "margin": "0 0 1.5% 1.5%" });
		$("#backb").fadeOut();
	}
	if (count == 2) {
		count--;
		$("#isDiabetic").fadeOut(0);
		$("#gender,#profile #male, #profile #female").fadeIn(0);
	}
}

var sessionID = 0;

var isFemale = knowsDiabetes = hasDiabetes = false;

	function setSession(ID)
	{
		sessionID = ID;
	}

	function getSession()
	{
		return sessionID;
	}

var theOptions = new Array();
function ajaxCall(command, sessionID)
{

	$.ajax({
		url: 'DA',
		type: 'GET',
		dataType: 'json',
		data: {
			command: command,
			sessionID: sessionID
		},
		contentType: 'application/json',
		mimeType: 'application/json',
		success: function (data) {
			question = data.question;
			id = data.id;
			type = data.type;
			options = data.options;

			$(".profileH1").html(question);
					
			if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
				$(".questions").html('<input id="' + id + '" value="" type="' + id + '" placeholder="Enter Your ' + id + ' Here">');
			}
			else if (type == "MALE-FEMALE") {
				$(".questions").html('<div id="male" onclick="gSpecific(male)"><img src="images/male-sign.jpg"></div><div id="female" onclick="gSpecific(female)"><img src="images/female-sign.jpg"></div>');
			}
			else if (type == "YES-NO") {
				$(".questions").html('<div id="yesbutton" class="yes" value="yes" onclick="yesno(yes)">Yes</div><div id="nobutton" class="no" value="no" onclick="yesno(no)">No</div>');
			} else
				if (type == "OPTIONAL") {
					theOptions = options.split('-');
					$(".questions").html("");
					for (var i = 1; i < theOptions.length; i++) {
					    $(".questions").append('<div class="options" id="' + theOptions[i] + '">' + theOptions[i] + '</div>');
					}

				}
				else {
						profile();
					}

		}
	});

}

var obj = new Object();
var objArray = new Array();
var symptomName = symptomID = symptomExplanation = new Array();
function profile() {
    $.get('DA', { command: "profile", sessionID: sessionID }, function (responseText1) {
        $('#advisorH1').text(responseText1);
        $.get('DA', { command: "getSymptoms", sessionID: sessionID }, function (responseText2) {
            symptomName = responseText2.symptomNames.split("*");
            symptomID = responseText2.symptomIDs.split("*");
            symptomExplanation = responseText2.explanation.split("*");

            $("#symptomsContainer").html("");
            for (var i = 1; i < symptomName.length; i++) {
                $("#symptomsContainer").append('<div class="buttons" id="' + symptomID[i] + '" onclick="clicked(this)">' + symptomName[i] + '</div>');
                obj = { id: "#" + symptomID[i], clicked: false };
                objArray[i - 1] = obj;
                //hunger = { id: "#hunger", clicked: false };
            }
            $("#symptomsContainer").append('<div class="buttons" id="submitB" onclick="submitSymptoms()">Submit</div>');
        });
    });
			                    
			$("#profile").fadeOut();
			$("#choice").fadeOut();
			$("#symptoms").fadeIn(); 

}


function confirm() {
	var proceed = false;
	if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
		var answer = $("#" + id).val();
					        
		if (type == "INPUTN") {
			var intRegex = /^\d+$/;
			if(intRegex.test(answer)) {
				$("#feedback").fadeIn();
					$("#feedback").append("Your "+ id + " is : " + answer + "<br>");
				$.get('DA', { value: answer, answerID: id, sessionID: sessionID });
				proceed = true;
			}
			else {
					alert("Please Enter a valid number in the " + id + " field");
			}
			} else if (type == "INPUTND") {
			var intRegex = /^(\d+\.?\d*|\.\d+)$/;
			if(intRegex.test(answer)) {
				$("#feedback").fadeIn();
					$("#feedback").append("Your "+ id + " is : " + answer + "<br>");
				$.get('DA', { value: answer, answerID: id, sessionID: sessionID });
				proceed = true;
			} else {
					alert("Please Enter a valid number in the " + id + " field");
			}

		}  
		else{
		$("#feedback").fadeIn();
		$("#feedback").append("Your "+ id + " is : " + answer + "<br>");
		$.get('DA', { value: answer, answerID: id, sessionID: sessionID });
		proceed = true;
		}
	}
	else if (type == "YES-NO") {
		$("#feedback").fadeIn();
		$("#feedback").append("Your " + id + ": " + yesOrno + "<br>");
		$.get('DA', { value: yesOrno, answerID: id, sessionID: sessionID });
		proceed = true;
	}
	else if (type == "MALE-FEMALE") {
		$("#feedback").fadeIn();
		$("#feedback").append("Gender: " + gendertype + "<br>");
		$.get('DA', { value: gendertype, answerID: id, sessionID: sessionID });
		proceed = true;
	}
	else if (type == "OPTIONAL") {
		$("#feedback").fadeIn();
		$("#feedback").append(id + ": " + opt + "<br>");
		$.get('DA', { value: opt, answerID: id, sessionID: sessionID });
		proceed = true;
	} 	
	if (proceed) {
		ajaxCall("question", sessionID);
	}
						  
	/*
	switch(count)
	{
		case 6:
			$("#profile").fadeOut();
			$("#choice").fadeOut(0);
			$("#symptoms").fadeIn();
			var oldness = $("#eyj").val();
			$.get('servlet', { pregnant: pregnancy });
			break;
	case 5:   
		if (isFemale) {
			$.get('servlet', {familyH: history});
			$("#pregnancy").fadeIn(0);
			$("#feedback").append("Family History : " + aHistory + "<br>");
			$("#history").fadeOut(0);
			count++;
		}
		else {
			$("#history").fadeOut(0);
			count++;
			confirm();
		}
		break;
	case 4:
		var intRegex = /^\d+$/;
		if(intRegex.test($("#eyj").val())) {
			$.get('servlet', {age: oldness});
			$("#history").fadeIn(0);
			$("#feedback").append("Race : " + humanRace + "<br>");
			$("#feedback").append("Age : " + $("#eyj").val() + "<br>");
			$("#age").fadeOut(0);
			count++;
		} else {
			alert("Please Enter a valid number in the age field");
		}
		break;
	case 3:
		$.get('servlet', {diabetic: isADiabetic});
		if (!hasDiabetes) {
			$("#age").fadeIn(0);
			$("#feedback").append("Diabetic Status : " + dStatus + "<br>");
			$("#isDiabetic").fadeOut(0);
			count++;
		}
		else {
			$("#profile").fadeOut();
			$("#choice").fadeOut();
			$("#lifestyle").fadeIn();
		}
		break;
	case 2:
		$("#isDiabetic").fadeIn(0);
		$("#feedback").append("Familiarity : " + familiar + "<br>");
		$("#knowledge").fadeOut(0);
		$.get('servlet', {diabetesK: knowz});	
		count++;
		break;
	case 1:
		$("#knowledge").fadeIn(0);
		$("#gender,#profile #male, #profile #female").fadeOut(0);
		$("#feedback").append("Gender : " + aGender + "<br>");
		$.get('servlet', { gender: gendertype});	
		count++;
		break;
	case 0:
		$("#intro").fadeOut(0);
		$("#feedback").fadeIn();
		$("#feedback").append("Your Name is : " + $("#name").val() + "<br>");
		$("#gender,#profile #male, #profile #female").fadeIn(0);
		$("#button").css({"margin":"0 0 1.5% 250px"});
		$("#backb").fadeIn();
		count++;
		break;
	}
	*/
}

var yes = "Yes";
var no = "No";
var yesOrno = "";

function yesno(theAnswer) {
	yesOrno = theAnswer;
					        
	if (theAnswer == "Yes") {
		$(".yes").css({ "color": "rgba(0,55,0,0.7)", "border-bottom": "5px solid rgba(0,255,0,0.7)" });
		$(".no").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
	if (theAnswer == "No") {
		yesOrno = "No";
		$(".no").css({ "color": "rgba(55,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$(".yes").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
}

var gendertype = aGender ="";
function gSpecific(gender) {
if (gender.id == "male") {
	gendertype = "Male";
	isFemale = false;
	aGender = "Male";
	$("#gestational").fadeOut();	
	$("#yeast").fadeOut();
	$("#dysfunction").fadeIn();
	$("#" + gender.id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
	$("#female").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
}
if (gender.id == "female") {
	gendertype = "Female";
	isFemale = true;
	aGender = "Female";	
	$("#dysfunction").fadeOut();
	$("#yeast").fadeIn();
	$("#gestational").fadeIn();
	$("#" + gender.id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
	$("#male").css({ "color": "grey", "border-bottom": "0px solid rgba(255,0,0,0.7)" });

	}
}

var knowz = familiar = "";
function knows(answer) {
	if (answer.id == "ido") {
		knowz = "Yes";
		familiar = "Familiar with Diabetes";
		$("#" + answer.id).css({ "color": "green", "border-bottom": "5px solid rgba(0,100,0,0.7)" });
		$("#idont").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
	if (answer.id == "idont") {
		knowz = "No";
		familiar = "Not familiar with Diabetes";
		$("#" + answer.id).css({ "color": "red", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$("#ido").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
}

var isADiabetic = dStatus ="";
function isDiabetic(answer) {
	if (answer.id == "yes") {
		isADiabetic = "Yes";
		hasDiabetes = true;
		dStatus = "Is Diabetic";
	$("#" + answer.id).css({ "color": "green", "border-bottom": "5px solid rgba(0,100,0,0.7)" });
		$("#no").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
	if (answer.id == "no") {
		isADiabetic = "No";
		hasDiabetes = false;
		dStatus = "Is not Diabetic";
		$("#" + answer.id).css({ "color": "red", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$("#yes").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
}

var history = aHistory = "";
function hasHistory(answer) {
	if (answer.id == "yess") {
		history = "Yes";
		aHistory = "Diabetes runs in the family";
		$("#" + answer.id).css({ "color": "green", "border-bottom": "5px solid rgba(0,100,0,0.7)" });
		$("#noo").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
	if (answer.id == "noo") {
		history = "No";
		aHistory = "Diabetes does not run in the family";
		$("#" + answer.id).css({ "color": "red", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$("#yess").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
}

var pregnancy = "";
function isPregnant(answer) {
	if (answer.id == "isPreg") {
		pregnancy = "Yes";
		$("#" + answer.id).css({ "color": "green", "border-bottom": "5px solid rgba(0,100,0,0.7)" });
		$("#isNotPreg").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
	if (answer.id == "isNotPreg") {
		pregnancy = "No";
		$("#" + answer.id).css({ "color": "red", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$("#isPreg").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
}

var humanRace = theAge = "";
function race(answer) {
	if (answer.id == "white") {
		humanRace = "White";
		$("#" + answer.id).css({ "color": "rgb(200,200,200)", "border-bottom": "5px solid rgba(200,200,200,0.7)" });
		$("#black,#asian,#other").css({ "color": "black", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
	if (answer.id == "black") {
		humanRace = "Black";
		$("#" + answer.id).css({ "color": "brown", "border-bottom": "5px solid brown" });
		$("#white,#asian,#other").css({ "color": "black", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
	if (answer.id == "asian") {
		humanRace = "Asian";
		$("#" + answer.id).css({ "color": "orange", "border-bottom": "5px solid orange" });
		$("#black,#white,#other").css({ "color": "black", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
	if (answer.id == "other") {
		humanRace = "Other";
		$("#" + answer.id).css({ "color": "black", "border-bottom": "5px solid black" });
		$("#black,#white,#asian").css({ "color": "black", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
}

var opt = "";
$(function () {
    $(".questions").on('click', '.options', function () {
        opt = $(this).attr("id");

        $(this).css({ "color": "red", "border-bottom": "5px solid red" });
        var temp = opt;
        for (var i = 0; i < theOptions.length; i++) {
            if (temp != theOptions[i]) {
                $("#" + theOptions[i]).css({ "color": "black", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
            }
        }
    });

    $('#symptomsContainer').on('mouseover', '.buttons', function () {
        var symID = $(this).attr("id");

        var index = symptomID.indexOf(symID);
        
        $("#advisorH1").html(symptomExplanation[index]);
    });
});

function splash() {
	$("#splash").delay(2000).effect("puff", 500);
		}