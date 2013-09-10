thirst = { id: "#thirst", clicked: false };
urinating = { id: "#urinating", clicked: false };
itchiness = { id: "#vitchiness", clicked: false };
dysfunction = { id: "#dysfunction", clicked: false };
blurvision = { id: "#blurvision", clicked: false };
fatigue = { id: "#fatigue", clicked: false };
weightloss = { id: "#weightloss", clicked: false };
drymouth = { id: "#drymouth", clicked: false };
abdominalpain = { id: "#abdominalpain", clicked: false };
neusea = { id: "#neusea", clicked: false };
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
	var submitArray = [thirst,urinating,itchiness,dysfunction,blurvision,fatigue,weightloss,drymouth,abdominalpain];
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
			alert(symptomName + " " + count +" " +counter);
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
		$("#button").css({"margin":"0 0 1.5% 1.5%"});
		$("#backb").fadeOut();
	}
}

function confirm() {

	if (count == 2) {
		$("#profile").fadeOut();
	}
	if (count == 1){
		$("#isDiabetic,#profile #yes,#profile #no").fadeIn(0);
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

function gSpecific(gender) {//Comment this out

	if (gender.id == "male") {
		$("#vitchiness").fadeOut();
		$("#dysfunction").fadeIn();
		$("#" + gender.id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$("#female").css({ "color": "grey", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
	if (gender.id == "female") {
		$("#dysfunction").fadeOut();
		$("#vitchiness").fadeIn();
		$("#" + gender.id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$("#male").css({ "color": "grey", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
}

function isDiabetic(answer) {

	if (answer.id == "yes") {
		$("#" + answer.id).css({ "color": "green", "border-bottom": "5px solid rgba(0,100,0,0.7)" });
		$("#no").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
	if (answer.id == "no") {
		$("#" + answer.id).css({ "color": "red", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		$("#yes").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
	}
}

function splash() {
	$("#splash").delay(2000).effect("puff", 500);
}