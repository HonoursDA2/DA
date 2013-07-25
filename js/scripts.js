thirst = { id: "#thirst", clicked: false };
urinating = { id: "#urinating", clicked: false };
itchiness = { id: "#vitchiness", clicked: false };
dysfunction = { id: "#dysfunction", clicked: false };
blurvision = { id: "#blurvision", clicked: false };
fatigue = { id: "#fatigue", clicked: false };
weightloss = { id: "#weightloss", clicked: false };
drymouth = { id: "#drymouth", clicked: false };
vomiting = { id: "#vomiting", clicked: false };
abdomenalpain = { id: "#abdomenalpain", clicked: false };

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

function diagnose() {
    if (thirst.clicked) {
        document.getElementById("advisorH1").innerHTML = "Drink Something";
    }
    if (thirst.clicked && fatigue.clicked) {
        document.getElementById("advisorH1").innerHTML = "Drink water and rest";
    }
}

var name;
var count = 0;
function confirm() {

    if (count > 0) {
        $("#profile").fadeOut();
    }
    if (count == 0) {
        name = document.getElementById('name').value;
        $("#intro").fadeOut();
        document.getElementById("advisorH1").innerHTML = "Hello " + name + " how may I help you ?";
        count++;
        $("#gender,#profile #male, #profile #female").fadeIn();
    }
}

function gSpecific(gender) {

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

function splash() {
    $("#splash").delay(2000).effect("puff", 500);
}