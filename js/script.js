var question = type = id = "";
var extraQ = extraT = extraO = extraE = extraC = extraObj = new Array();
var dOptions = dExplanations = new Array();

window.onload = function () {
    //splash();
    initialize();
    titles();
}


function titles() {
    $("#backb").attr('title', 'Made a mistake ? Click this button to start over');
    $("#button").attr('title', 'Click to Continue with the assessment/Alternatively, press enter to continue');
    $("input").attr('title', 'click to enter details');
}

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

function backtoSplash() {
    $("#splash").show("puff", 500);
    $("#splash #moreInfo,#splash #theAdvisor").css({ "opacity": "1", "box-shadow": "0px 2px 5px -2px gray" });
    $("#diabetesInfo").fadeOut();
    $("#diabetesInfo").css({ "z-index": "4" });
    $("#ffeedbackC").css({ "z-index": "4" });
}

function calctop(obje) {
    return $(obje).offset().top - $("#dInfoOptions").offset().top
}
function calctops(obje) {
    return $(obje).offset().top - $("#diabetesQues").offset().top
}

function showInfo(index,obj) {
    $("#optPos").fadeOut();
    $("#quePos").fadeIn();
    var top = calctops(obj);
    $("#quePos").css({ "top": top });
    if (extraT[index] == "MULTIPLE") {
        dOptions = extraO[index].split("-");
        dExplanations = extraE[index].split("-");
        $("#dInfo").html(extraC[index]);
        $("#dInfoOptions").html("");
        for (var i = 0; i < dOptions.length; i++) {
            extraObj[i] = { dOpt: dOptions[i], dExp: dExplanations[i] };
            $("#dInfo").html(extraC[index]);
            $("#dInfoOptions").append("<div class='opts' onclick='displayInfo(" + i + ",this)'>" + extraObj[i].dOpt + "</div>");
        }
        $("#dInfoOptions").append("<span id='optPos'></span>");
    }
    else if (extraT[index] == "SINGLE") {
        $("#dInfoOptions").html("");
        $("#dInfo").html(extraE[index]);
    }
}

function displayInfo(index, obj) {
    var top = calctop(obj);
    $("#optPos").fadeIn();
    $("#optPos").css({ "top": top });
    $("#dInfo").html(extraObj[index].dExp);
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

    $("#theAdvisor").click(function () {
        $("#splash #moreInfo").css({ "opacity": "0.2" });
        $(this).css({ "box-shadow": "0 2px 15px -2px red" });
        $("#splash").delay(1500).effect("puff", 1000);
        $("#chances").delay(1500).fadeIn();
    });

    $("#moreInfo,#lb1").click(function () {
        $("#splash #theAdvisor").css({ "opacity": "0.2" });
        $(this).css({ "box-shadow": "0 2px 15px -2px red" });
        $("#diabetesInfo").fadeIn();
        $("#ffeedbackC").css({ "z-index": "3" });
        $("#splash").delay(1500).effect("puff", 1000);
        $.get('DA', { command: "getInfo", sessionID: sessionID }, function (data) {

            extraQ = data.questions.split("*");
            extraT = data.type.split("*");
            extraO = data.options.split("*");
            extraE = data.explanations.split("*");
            extraC = data.caption.split("*");

            for (var i = 0; i < extraQ.length; i++) {
                $("#diabetesQues").append("<div onclick='showInfo(" + i + ",this)'>" + extraQ[i] + "</div>");
            }
            $("#diabetesQues").append("<span id='quePos'></span>");
        });
    });

    $("#lb2").click(function () {
        window.open('http://bit.ly/159vbwa', '_blank');
    });

    $("#lb3").click(function () {
        window.location.reload();
    });

    $("#dExtraInfo").hover(function () {
        $(this).stop().animate({ "bottom": "0"},2000,"easeOutElastic");
    }, function () {
        $(this).stop().animate({ "bottom": "-43.5%" }, 1000, "easeOutCubic");
    });

    $('.next').on('mouseenter', rscroll);
    $('.prev').on('mouseenter', lscroll);
    $('.next,.prev').on('mouseleave', function () {
        $('#symptoms').stop();
    });

    $('document').tooltip({
        track: true
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