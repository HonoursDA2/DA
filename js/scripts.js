function clicked(i) {
	var j = i - 1;
	if (!submitArray[j].clicked) {
		$(submitArray[j].id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		submitArray[j].clicked = true;
	}
	else {
		$(submitArray[j].id).css({ "color": "grey", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
		submitArray[j].clicked = false;
	}
}

function initialize() {
	$.get('DA', { command: "init" }, function (responseText) {
		setSession(responseText);
		ajaxCall("question", responseText);
	});
}

function countClicks() {
	var count = 0;
	for (var x = 0; x < submitArray.length; x++) {
		if (submitArray[x].clicked) {
		    count++;
		}
	}
	return count;
}

var extraName = extraUrl = extraExp = extraAdd = "";
function submitSymptoms() {
    stage = 2.5;
    active = false;
	$("#advisorH1").html("");
	//$("#advisorH1").fadeOut();
	
	var counter = 0;
	var count = countClicks();
	var processText = "incomplete";
	var clickedSymptoms ="";
	var symptomNames = new Array();
	var symptomURLS = new Array();
	var symptomExp = new Array();
	var symptomAdditional = new Array();
		var clickedSymptoms ="";

	for (var x = 0; x < submitArray.length; x++) {
		    
		if (submitArray[x].clicked) {
		    var symptomObject = submitArray[x];
		    clickedSymptoms = clickedSymptoms + $(symptomObject.id).attr('value')+'*';
		    }

		    }
		        
		    $.get('DA', { symptoms: clickedSymptoms, sessionID: sessionID }, function (responseText) {
		        extraName = responseText.symptomName;
		        extraUrl = responseText.url;
		        extraExp = responseText.explanation;
		        extraAdd = responseText.additional;
		        meter = responseText.percentage;

			    updateP();


		        symptomNames = extraName.split('*');
		        symptomURLS = extraUrl.split('*');
		        symptomExp = extraExp.split('*');
		        symptomAdditional = extraAdd.split('*');
		                     
		        for (var i = 0; i < symptomNames.length-1; i++) {
		            	$("#symptomsresultsC").append('<div class="symptomsresults"><img src="images/symptoms/' + symptomURLS[i]+ '"><div><h1>' + symptomExp[i] + '</h1></div></div>');
		            }
		            $("#symptomsresultsC").append('<div id="cont">Continue</div>');
		        });

	    counter++;
	
	$("#advisor").animate({ "height": "95%" }, 1000, "easeInOutCirc", function () {
		$("#symptomsresultsC").fadeIn();
	});
	$("#menu").fadeOut();
	$("#patient").animate({ "bottom": "-101%" }, 1000, "easeInOutCirc", function () {
		$("#symptoms").fadeOut(0);
		$("#lifestyle").fadeIn();
	});

}

var count = 0;

function changeArray(array1, array2) {
	var newArray = new Array();
	var newidArray = new Array();
		
	for (var x=0;x<array1.length -1;x++) {
		newArray.push(array1[x]);
		newidArray.push(array2[x]);
	}
	answerArray = new Array();
	idArray = new Array();
	for (var x=0;x<newArray.length;x++) {
		answerArray.push(newArray[x]);
		idArray.push(newidArray[x]);
	}
	restartFeedback (answerArray,idArray);
}


function revert() {
	$(".feedback").html("");	
	changeArray(answerArray,idArray);
	$("#backb").fadeOut();
	$("#button").css({"left":"0px"});
    $.get('DA', { command: "back",stage:"stage1", sessionID: sessionID }, function(responseText){
	    ajaxCall("question", sessionID);
	});
	
}

function revertL() {
	$(".feedback").html("");	
	changeArray(answerArray,idArray);
    $.get('DA', { command: "back", stage: "stage2", sessionID: sessionID }, function (responseText) {
        ajaxCallLifestyle("question", sessionID);
    });
}

var sessionID = 0;

var isFemale = knowsDiabetes = hasDiabetes = false;

function setSession(ID) {
	sessionID = ID;
}

function getSession() {
	return sessionID;
}

var theOptions = new Array();
var lastNumber = 0;
function ajaxCall(command, sessionID) {

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
		    meter = data.percentage;
		    lastNumber = data.qNumber;
	  		if (meter.length>0) {
	            	updateP();
	        }	    $(".profileH1").html(question);

		    if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
		        $(".questions").html('<input id="' + id + '" value="" type="' + id + '" placeholder="Enter Your ' + id + ' Here">');
		    	}
		    else if (type == "MALE-FEMALE") {
		        $(".questions").html('<div id="male" onclick="gSpecific(this)"><img src="images/male-sign.jpg"></div><div id="female" onclick="gSpecific(this)"><img src="images/female-sign.jpg"></div>');
		    }
		    else if (type == "YES-NO") {
		        $(".questions").html('<div id="yesbutton" class="yes" value="yes" onclick="yesno(yes)">Yes</div><div id="nobutton" class="no" value="no" onclick="yesno(no)">No</div>');
		    } else
		        if (type == "OPTIONAL") {
		            theOptions = options.split('-');
		            $(".questions").html("");
		            for (var i = 0; i < theOptions.length; i++) {
		                $(".questions").append('<div class="options" id="' + theOptions[i] + '">' + theOptions[i] + '</div>');
		            }

		        }
		        else {
		            profile();
		        }

		}
	});

	}

	function ajaxCallLifestyle(command, sessionID) {

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
	            meter = data.percentage;
	            lastNumber = data.qNumber;


	            if (meter.length > 0) {
	                updateP();
	            }

	                document.getElementById("lif").src = "images/factors/" + id + ".jpg";

	            $("#advisorH1").html(question);

	            if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
	                $("#lifestyle .questions").html('<input id="' + id + '" value="" type="' + id + '" placeholder="Enter Your ' + id + ' Here">');
	            }
	            else if (type == "MALE-FEMALE") {
	                $("#lifestyle .questions").html('<div id="male" onclick="gSpecific(this)"><img src="images/male-sign.jpg"></div><div id="female" onclick="gSpecific(this)"><img src="images/female-sign.jpg"></div>');
	            }
	            else if (type == "YES-NO") {
	                $("#lifestyle .questions").html('<div id="yesbutton" class="yes" value="yes" onclick="yesno(yes)">Yes</div><div id="nobutton" class="no" value="no" onclick="yesno(no)">No</div>');
	            } else
	                if (type == "OPTIONAL") {
	                    theOptions = options.split('-');
	                    $("#lifestyle .questions").html("");
	                    for (var i = 0; i < theOptions.length; i++) {
	                        $("#lifestyle .questions").append('<div class="options" id="' + theOptions[i] + '">' + theOptions[i] + '</div>');
	                    }

	                }
	                else {
	                    $("#advisor").animate({ "height": "95%" }, 1000, "easeInOutCirc", function () {
	                        $("#lifesummary").fadeIn();
	                    });
	                    $("#menu").fadeOut();
	                    $("#patient").animate({ "bottom": "-101%" }, 1000, "easeInOutCirc");

	                    $.get('DA', { command: "getFeedback", sessionID: sessionID, stage: "stage2" }, function (responseText) {

	                        feedbackArray = responseText.feedback.split("*");
	                        url = responseText.url.split("*");
	                        meter = responseText.percentage;
	                        updateP();
	                        for (var i = 0; i < feedbackArray.length - 1; i++) {
	                            $("#lifesummary").append('<div class="symptomsresults"><img src="images/feedback/' + url[i] + '"><div><h3>' + feedbackArray[i] + '</h3></div></div>');
	                        }
	
	                    });
	                    done = true;
	                }

	        }
	    });

		}

var done = false;
var advisor = "";
var submitArray = new Array();
var symptomName = symptomID = symptomExplanation = new Array();
var feedbackArray = new Array();
var url = "";
var contclicked = false;

function profile() {
    $.get('DA', { command: "profile", sessionID: sessionID }, function (responseText1) {
        $('#advisorH1').text(responseText1);
        advisor = responseText1;
        $.get('DA', { command: "getSymptoms", sessionID: sessionID }, function (responseText2) {
            symptomName = responseText2.symptomNames.split("*");
            symptomID = responseText2.symptomIDs.split("*");
            symptomExplanation = responseText2.explanation.split("*");
            meter = responseText2.percentage;

            updateP();
            $("#symptomsContainer").html("");
            for (var i = 0; i < symptomName.length - 1; i++) {
                $("#symptomsContainer").append('<div class="buttons" id="' + symptomID[i] + '" value = "' + symptomName[i] + '" onclick="clicked(' + i + ')">' + symptomName[i].replace("-", " ") + '</div>');
                buttonObject = { id: "#" + symptomID[i], clicked: false };
                submitArray[i - 1] = buttonObject;
            }
            $("#symptomsContainer").append('<div class="buttons" id="submitB" onclick="submitSymptoms()">Submit</div>');

            $(".button").attr('title', 'Click to select symptom');
            $("#submitB").attr('title', 'Click to submit list of symptoms');

            $(".questions").fadeOut(0);

            $("#profile div.speech").animate({ "height": "72%" });
            $.get('DA', { command: "getFeedback", sessionID: sessionID, stage: "stage1" }, function (responseText3) {
                feedbackArray = responseText3.feedback.split("*");
                url = responseText3.url.split('*');
                meter = responseText3.percentage;
	            updateP();

                for (var i = 0; i < feedbackArray.length - 1; i++) {
                    $(".summary").append('<div class="symptomsresults"><img src="images/feedback/'+url[i]+'"><div><h3>' + feedbackArray[i] + '</h3></div></div>');
                }
                $(".summary").delay(1000).fadeIn();
            });
        });


    });
	
	$("#choice").fadeOut();
	$("#symptoms").fadeIn();
	contclicked = true;

}

function restartFeedback(array1, array2) {
	for (var x=0;x<array1.length;x++) {
		$(".feedback").append(array2[x] + " : " + array1[x] + "<br>");
	}
}

var meter = height = 0;
var idArray = new Array();
var answerArray= new Array();
var counter=0;

function confirm() {
    $("#backb").fadeIn();
    $("#button").css({"left":"160px"});
	var proceed = false;
	idArray.push(id);
	

	if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
		var answer = $("#" + id).val();
		answerArray.push(answer);
		if (type == "INPUTN") {
		    var intRegex = /^\d+$/;
		    if (intRegex.test(answer)) {
		        $(".feedback").fadeIn();
		        $(".feedback").append(id + ": " + answer + "<br>");
		        $.get('DA', { value: answer, answerID: id, sessionID: sessionID, last:lastNumber});
		        proceed = true;
		    }
		    else {
		        alert("Please Enter a valid number in the " + id + " field");
		    }
		} else if (type == "INPUTND") {
		    var intRegex = /^(\d+\.?\d*|\.\d+)$/;
		    if (intRegex.test(answer)) {
		        $(".feedback").fadeIn();
		        $(".feedback").append(id + " : " + answer + "<br>");
		        $.get('DA', { value: answer, answerID: id, sessionID: sessionID, last:lastNumber});
		        proceed = true;
		    } else {
		        alert("Please Enter a valid number in the " + id + " field");
		    }

		}
		else {
		    $(".feedback").fadeIn();
		    $(".feedback").append(id + ": " + answer + "<br>");
		    $.get('DA', { value: answer, answerID: id, sessionID: sessionID, last:lastNumber });
		    proceed = true;
		}
	}
	else if (type == "YES-NO") {
		$(".feedback").fadeIn();
		$(".feedback").append(id + ": " + yesOrno + "<br>");
		$.get('DA', { value: yesOrno, answerID: id, sessionID: sessionID, last:lastNumber });
		proceed = true;
		answerArray.push(yesOrno);
	}
	else if (type == "MALE-FEMALE") {
		$(".feedback").fadeIn();
		$(".feedback").append(id + ": " + gendertype + "<br>");
		$.get('DA', { value: gendertype, answerID: id, sessionID: sessionID, last:lastNumber });
		proceed = true;
		answerArray.push(gendertype);
	}
	else if (type == "OPTIONAL") {
		$(".feedback").fadeIn();
		$(".feedback").append(id + ": " + opt + "<br>");
		$.get('DA', { value: opt, answerID: id, sessionID: sessionID, last:lastNumber});
		proceed = true;
		answerArray.push(opt);
	}
	if (proceed) {
		ajaxCall("question", sessionID);
	}
    if (contclicked) {
        $("#profile").fadeOut();
        stage = 2;
    }
		    
}

function confirmLifestyle() {
    $("#backbL").fadeIn();
    $("#contButton").css({ "left": "160px" });
	var proceed = false;
	idArray.push(id);
	
	if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
		var answer = $("#" + id).val();
		answerArray.push(answer);

		if (type == "INPUTN") {
		    var intRegex = /^\d+$/;
		    if (intRegex.test(answer)) {
		        $(".feedback").fadeIn();
		        $(".feedback").append(id + ": " + answer + "<br>");
		        $.get('DA', { value: answer, answerID: id, sessionID: sessionID, last:lastNumber });
		        proceed = true;
		    }
		    else {
		        alert("Please Enter a valid number in the " + id + " field");
		    }
		} else if (type == "INPUTND") {
		    var intRegex = /^(\d+\.?\d*|\.\d+)$/;
		    if (intRegex.test(answer)) {
		        $(".feedback").fadeIn();
		        $(".feedback").append(id + ": " + answer + "<br>");
		        $.get('DA', { value: answer, answerID: id, sessionID: sessionID, last:lastNumber });
		        proceed = true;
		    } else {
		        alert("Please Enter a valid number in the " + id + " field");
		    }

		}
		else {
		    $(".feedback").fadeIn();
		    $(".feedback").append(id + ": " + answer + "<br>");
		    $.get('DA', { value: answer, answerID: id, sessionID: sessionID, last:lastNumber });
		    proceed = true;
		}
	}
	else if (type == "YES-NO") {
		$(".feedback").fadeIn();
		$(".feedback").append(id + ": " + yesOrno + "<br>");
		$.get('DA', { value: yesOrno, answerID: id, sessionID: sessionID, last:lastNumber });
		proceed = true;
		answerArray.push(yesOrno);
	}
	else if (type == "MALE-FEMALE") {
		$(".feedback").fadeIn();
		$(".feedback").append(id + ": " + gendertype + "<br>");
		$.get('DA', { value: gendertype, answerID: id, sessionID: sessionID, last:lastNumber });
		proceed = true;
		answerArray.push(gendertype);
	}
	else if (type == "OPTIONAL") {
		$(".feedback").fadeIn();
		$(".feedback").append(id + ": " + opt + "<br>");
		$.get('DA', { value: opt, answerID: id, sessionID: sessionID, last:lastNumber });
		proceed = true;
		answerArray.push(opt);
	}
	if (proceed) {
		ajaxCallLifestyle("question", sessionID);
	}
    if (done) {
        $("#ffeedbackC").fadeIn();

        $.get('DA', { command: "getFeedback", sessionID: sessionID, stage: "stage3" }, function (responseText) {
            var backfeed = responseText.feedback.split("*");
            meter = responseText.percentage;
	        updateP();

            $(".ffeedback").html("");
            for (var i = 0; i < backfeed.length; i++) {
                $(".ffeedback").append('<div>' + backfeed[i] + '</div>');
            }

        });
	}

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

var gendertype = aGender = "";
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

function updateP() {

    height = 330 * (meter / 100);
	$("#pvalue").html(meter + "%");
    if (meter >= 80) {
        $("#percentage").css({ "height": height + "px", "background": "rgba(255,0,0,0.5)" });
        $("#pvalue").css({ "color": "rgba(255,0,0,0.5)" });
        document.getElementById("proImg").src = "images/level/red.jpg";
        document.getElementById("symImg").src = "images/level/red.jpg";
        document.getElementById("feedImg").src = "images/level/red.jpg";

    }
    else
        if (meter >= 60) {
            $("#percentage").css({ "height": height + "px", "color": "white", "background": "rgba(255,155,0,0.5)" });
            $("#pvalue").css({ "color": "rgba(255,155,0,0.5)" });
            document.getElementById("proImg").src = "images/level/orange.jpg";
            document.getElementById("symImg").src = "images/level/orange.jpg";
            document.getElementById("feedImg").src = "images/level/orange.jpg";
    } 
    else
    if (meter >= 40) {
        $("#percentage").css({ "height": height + "px", "color": "black", "background": "rgba(255,255,0,0.5)" });
        $("#pvalue").css({ "color": "rgba(255,255,0,0.5)" });
        document.getElementById("proImg").src = "images/level/yellow.jpg";
        document.getElementById("symImg").src = "images/level/yellow.jpg";
        document.getElementById("feedImg").src = "images/level/yellow.jpg";
    }
    else
    if (meter >= 20) {
        $("#percentage").css({ "height": height + "px", "background": "rgba(0,200,0,0.5)" });
        $("#pvalue").css({ "color": "rgba(0,200,0,0.5)" });
        document.getElementById("proImg").src = "images/level/green.jpg";
        document.getElementById("symImg").src = "images/level/green.jpg";
        document.getElementById("feedImg").src = "images/level/green.jpg";
    }
    else
    if (meter >= 0) {
        $("#percentage").css({ "height": height + "px" });
        $("#pvalue").css({ "color": "lime" });
        document.getElementById("proImg").src = "images/level/lime.jpg";
        document.getElementById("symImg").src = "images/level/lime.jpg";
        document.getElementById("feedImg").src = "images/level/lime.jpg";
    }
    

}

/*------------------------------------------------*/

var opt = "";
var active = true;
$(function () {
    $(".questions,#lifestyle").on('click', '.options', function () {
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
        if (active) {
            var symID = $(this).attr("id");

            var index = symptomID.indexOf(symID);

            $("#advisorH1").html(symptomExplanation[index]);
        }
    });

    $("#symptomsContainer").on('mouseleave', '.buttons', function () {
        $('#advisorH1').text(advisor);
    });

    $("#symptomsresultsC").on('mouseover', '.symptomsresults div', function () {
        $("#advisorH1").html("");
    });

    $("#symptomsresultsC").on('click', '#cont', ontoLifestyle);

    $("body").keyup(function (e) {
        if (e.which == 13 || e.keycode == 13) {
            if (stage == 1) {
                confirm();
            }
            else if (stage == 2) {
                submitSymptoms();
            }
            else if (stage == 2.5) {
                $("#advisorH1").fadeIn();
                ontoLifestyle();


            }
            else if (stage == 3) {
                confirmLifestyle();
            }
            else {
                return false;
            }
            return false;
        }
        return true;
    });

    $(".questions").on('click', '.options,#yesbutton,#nobutton,#male,#female', function () {
        if (stage == 1) {
            confirm();
        }
        else if (stage == 2) {
            submitSymptoms();
        }
        else if (stage == 2.5) {
            $("#advisorH1").fadeIn();
            ontoLifestyle();


        }
        else if (stage == 3) {
            confirmLifestyle();
        }
        else {
            return false;
        }
    });

});

var stage = 1;
function splash() {
	$("#splash").delay(2000).effect("puff", 500);
}

function ontoLifestyle() {
        stage = 3;
        $("#symptomsresultsC").fadeOut();
        $("#contButton").fadeIn();
        $(".questions").fadeIn();
        $("#advisor").animate({ "height": "47%" }, 1000, "easeInOutCirc");
        $("#menu").fadeIn();
        $("#patient").animate({ "bottom": "2.55%" }, 1000, "easeInOutCirc");
        ajaxCallLifestyle('question', sessionID)
    }
