var question = type = id = "";

window.onload = function () {
    //splash();
    initialize();

    };

function splash() {
    $("#splash").delay(2000).effect("puff", 500);
}

function rscroll() {
    $('#symptoms').animate({
        scrollLeft: '+=20'
    }, 50, rscroll);
}

function lscroll() {
    $('#symptoms').animate({
        scrollLeft: '-=20'
    }, 50, lscroll);
}

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

    $('.next').on('mouseenter', rscroll);
    $('.prev').on('mouseenter', lscroll);
    $('.next,.prev').on('mouseleave', function () {
        $('#symptoms').stop();
    });

    /*    window.oncontextmenu = function () {

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