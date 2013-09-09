window.onload = function () {
    splash();
};

$(function () { //Comment this out
    $(".buttons").hover(function(){
        var def = $(this).attr("id");
        $("div.speech span").css({ 'text-align': 'left' });
        if (def == 'thirst') {
            document.getElementById("advisorH1").innerHTML = "<span id='def'>" + def + "</span>" + "is blah blah";
        }
        else if (def == 'urinating') {
            document.getElementById("advisorH1").innerHTML = "<span id='def'>" + def + "</span>" + "is blah blah";
        }
        else if (def == 'vitchiness') {
            document.getElementById("advisorH1").innerHTML = "<span id='def'>Vaginal Itchiness</span>" + "is blah blah";
        }

    });


    $("#symptom").hover(function () {
        document.getElementById("patientH1").innerHTML = "Symptoms";
    });
    $("#factor").hover(function () {
        document.getElementById("patientH1").innerHTML = "Risk Factors";
    });
    $("#life").hover(function () {
        document.getElementById("patientH1").innerHTML = "Lifestyle";
    });
    
    $("#symptom").click(function (){
        $("#symptoms").delay(200).fadeIn();
        $("#choice, #menu").fadeOut();
        $("#backbutton").delay(200).fadeIn();
    });
    
    $("#backbutton").click(function (){
        $("#symptoms, #factors, #lifestyle").delay(200).fadeOut();
        $("#choice, #menu").delay(200).fadeIn();
        $(this).fadeOut();
    });

    var clicked = clicked2 = false;
    $("#nearest").click(function (){
        if(!clicked){
        $("#directions").fadeIn();
        clicked = true;
        }
        else{
        $("#directions").fadeOut();
        clicked = false;
        }
    });
    
    $("#extra").click(function (){
        if(!clicked2){
        $("#definition").fadeIn();
        clicked2 = true;
        }
        else{
        $("#definition").fadeOut();
        clicked2 = false;
        }
    });
});