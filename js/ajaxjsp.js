/*
function xmlhttpPost(strURL) {
var xmlHttpReq = false;
var self = this;
// Mozilla/Safari
if (window.XMLHttpRequest) {
self.xmlHttpReq = new XMLHttpRequest();
}
// IE
else if (window.ActiveXObject) {
self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
}
self.xmlHttpReq.open('POST', strURL, true);
self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
self.xmlHttpReq.onreadystatechange = function() {
if (self.xmlHttpReq.readyState == 4) {
updatepage(self.xmlHttpReq.responseText);
}
}
self.xmlHttpReq.send(getquerystring());
}

function getquerystring() {
var form = document.forms['f1'];
var word = form.word.value;
qstr = 'name=' + escape(word); // NOTE: no '?' before querystring
return qstr;
}

function updatepage(str){
document.getElementById("n").innerHTML = str;
}

----------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------
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

		var isADiabetic = dStatus = "";
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
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
*/