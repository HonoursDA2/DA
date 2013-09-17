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

	if (!symptom.clicked) {
		$(symptom.id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		symptom.clicked = true;
	}
	else {
		$(symptom.id).css({ "color": "grey", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
		symptom.clicked = false;
	}
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
        $("#isDiabetic,#profile .yes,#profile .no").fadeOut(0);
        $("#gender,#profile #male, #profile #female").fadeIn(0);
    }
}

function confirm() {

	if (count == 6) {
	    $("#profile").fadeOut();
	    $.get('servlet', { gender: gendertype });
	    $.get('servlet', { diabetic: isADiabetic });
	    $.get('servlet', { pregnant: pregnant });
	    $.get('servlet', { family-history: history });
	    $.get('servlet', { diabetic: isADiabetic });
	}
	if (count == 5) {
	    $("#pregnancy").fadeIn(0);
	    $("#history").fadeOut(0);
	    count++;
	}
	if (count == 4) {
	    $("#history").fadeIn(0);
	    $("#age").fadeOut(0);
	    count++;
	}
	if (count == 3) {
	    $("#age").fadeIn(0);
	    $("#isDiabetic").fadeOut(0);
	    count++;
	}
	if (count == 2){
		$("#isDiabetic").fadeIn(0);
		$("#knowledge").fadeOut(0);
		count++;
    }
    if (count == 1) {
        $("#knowledge").fadeIn(0);
        $("#gender,#profile #male, #profile #female").fadeOut(0);
        count++;
    }
	if (count == 0) {
		$("#intro").fadeOut(0);
		count++;
		$("#gender,#profile #male, #profile #female").fadeIn(0);
		$("#button").css({"margin":"0 0 1.5% 250px"});
		$("#backb").fadeIn();
	}
}

var gendertype ="";
function gSpecific(gender) {//Comment this out

    if (gender.id == "male") {
        gendertype = "Male";
		$("#vitchiness").fadeOut();
		$("#dysfunction").fadeIn();
		$("#" + gender.id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$("#female").css({ "color": "grey", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
if (gender.id == "female") {
        gendertype = "Female";
		$("#dysfunction").fadeOut();
		$("#vitchiness").fadeIn();
		$("#" + gender.id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$("#male").css({ "color": "grey", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
}

var knowz = "";
function knows(answer) {
    if (answer.id == "ido") {
        knowz = "Yes";
        $("#" + answer.id).css({ "color": "green", "border-bottom": "5px solid rgba(0,100,0,0.7)" });
        $("#idont").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
    }
    if (answer.id == "idont") {
        knowz = "No";
        $("#" + answer.id).css({ "color": "red", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
        $("#ido").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
    }
}

var isADiabetic ="";
function isDiabetic(answer) {
        if (answer.id == "yes") {
        isADiabetic = "Yes";
		$("#" + answer.id).css({ "color": "green", "border-bottom": "5px solid rgba(0,100,0,0.7)" });
		$("#no").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
    if (answer.id == "no") {
        isADiabetic = "No";
		$("#" + answer.id).css({ "color": "red", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$("#yes").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
}

var history = "";
function hasHistory(answer) {
    if (answer.id == "yess") {
        history = "Yes";
        $("#" + answer.id).css({ "color": "green", "border-bottom": "5px solid rgba(0,100,0,0.7)" });
        $("#noo").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
    }
    if (answer.id == "noo") {
        history = "No";
        $("#" + answer.id).css({ "color": "red", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
        $("#yess").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
    }
}

var pregnant = "";
function isPregnant(answer) {
    if (answer.id == "isPreg") {
        pregnant = "Yes";
        $("#" + answer.id).css({ "color": "green", "border-bottom": "5px solid rgba(0,100,0,0.7)" });
        $("#isNotPreg").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
    }
    if (answer.id == "isNotPreg") {
        pregnant = "No";
        $("#" + answer.id).css({ "color": "red", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
        $("#isPreg").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
    }
}

function splash() {
	$("#splash").delay(2000).effect("puff", 500);
}