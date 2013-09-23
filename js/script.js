window.onload = function () {
    splash();
        $.get('DA', { command: "first", number: "-1" }, function (responseText) {
                       $('.profileH1').text(responseText);
                   });
                   $(".questions").html('<input id="name" value="" type="name" placeholder="Enter Your Name Here">');
    
};

$(function () {

    $("#symptom").hover(function () {
        document.getElementById("patientH1").innerHTML = "Symptoms";
    });
    $("#factor").hover(function () {
        document.getElementById("patientH1").innerHTML = "Risk Factors";
    });
    $("#life").hover(function () {
        document.getElementById("patientH1").innerHTML = "Lifestyle";
    });

    $("#symptom").click(function () {
        $("#symptoms").delay(200).fadeIn();
        $("#choice").fadeOut();
    });

    $("#life").click(function () {
        $("#lifestyle").delay(200).fadeIn();
        $("#choice").fadeOut();
    });

    $("#backbutton").click(function () {
        $("#symptoms, #factors, #lifestyle").delay(200).fadeOut();
        $("#choice").delay(200).fadeIn();
    });

    var clicked = clicked2 = false;
    $("#nearest").click(function () {
        if (!clicked) {
            $("#directions").fadeIn();
            clicked = true;
        }
        else {
            $("#directions").fadeOut();
            clicked = false;
        }
    });

    $("#extra").click(function () {
        if (!clicked2) {
            $("#definition").fadeIn();
            clicked2 = true;
        }
        else {
            $("#definition").fadeOut();
            clicked2 = false;
        }
    });

    $("#symptom2").click(function () {
        $(".symptomsresults").fadeOut();
        $("#advisor").animate({ "height": "47%" }, 1000, "easeInOutCirc");
        $("#menu").fadeIn();
        $("#patient").animate({ "bottom": "2.55%" }, 1000, "easeInOutCirc");
    });

   /* window.oncontextmenu = function () {
        if (!clicked2) {
            $("#definition").fadeIn();
            clicked2 = true;
            $.get('servlet', { symptom: "extra" }, function (responseText) {
                $('#definition').text(responseText);
            });
        }
        else {
            $("#definition").fadeOut();
            clicked2 = false;
        }
        return false;
    }
    */
});