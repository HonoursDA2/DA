﻿var question = type = id = progress = "";
var extraQ = extraT = extraO = extraE = extraC = extraObj = new Array();
var dOptions = dExplanations = new Array();
var currentInfo = "";
window.onload = function () {
    //splash();
    initialize();
    titles();
    progressp();
}


function titles() {
    $("#backb").attr('title', 'Made a mistake ? Click this button to start over');
    $("#button").attr('title', 'Click to Continue with the assessment/Alternatively, press enter to continue');
    $("input").attr('title', 'click to enter details');
}

function progressp() {
    var pos = $("#progress").offset().left - 150;
    $("#progress").css({ "left": pos + "px" });
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

function showInfo(index, obj) {
    // $("#keyw").html("");
    //$("#keywExp").html("");   
    $("#optPos").fadeOut();
    $("#quePos").fadeIn();
    var top = calctops(obj);
    $("#quePos").css({ "top": top });
    if (extraT[index] == "MULTIPLE") {
        currentInfo = extraC[index];
        dOptions = extraO[index].split("-");
        dExplanations = extraE[index].split("-");
        $("#dInfo").html(extraC[index]);
        currentInfo = extraC[index];
        checkForKeywords(currentInfo);
        $("#keyw").html(keywordString);
        appendInfo(explanations);
        $("#dInfoOptions").html("");
        for (var i = 0; i < dOptions.length; i++) {
            extraObj[i] = { dOpt: dOptions[i], dExp: dExplanations[i] };
            $("#dInfo").html(extraC[index]);
            $("#dInfoOptions").append("<div class='opts' onclick='displayInfo(" + i + ",this)'>" + extraObj[i].dOpt + "</div>");
        }
        //$("#dInfoOptions").append("<span id='optPos'></span>");
    }
    else if (extraT[index] == "SINGLE") {
        $("#dInfoOptions").html("");
        $("#dInfo").html(extraE[index]);
        currentInfo = extraE[index];
        checkForKeywords(currentInfo);
        $("#keyw").html(keywordString);
        appendInfo(explanations);
    }
}

function displayInfo(index, obj) {
    var top = calctop(obj);
    $("#optPos").fadeIn();
    $("#optPos").css({ "top": top });
    $("#dInfo").html(extraObj[index].dExp);
    currentInfo = extraObj[index].dExp;
    checkForKeywords(currentInfo);
    $("#keyw").html(keywordString);
    appendInfo(explanations);

}


var keywordHash = {};
var keywords = explanations = new Array();
function fillKeywords() {
    keywords = extraO[0].split("-");
    explanations = extraE[0].split("-");
    for (var count = 0; count < keywords.length; count++) {
        keywordHash[keywords[count].toLowerCase()] = [explanations[count]];
    }
}

var keywordString = "";
var explanations = "";
function checkForKeywords(currentText) {
    $("#keyw").html("");
    $("#keywExp").html("");
    keywordString = "";
    explanations = "";
    var lower = currentText.toLowerCase();
    for (var count = 0; count < keywords.length; count++) {
        var keyword = keywords[count].toLowerCase();
        if (lower.indexOf(keyword) != -1) {
            keywordString = keywordString + "-" + keyword;
            explanations = explanations + keywordHash[keyword] + "-";

        }

    }
    keywordString = keywordString + "-";
}

function appendInfo(text) {
    var array = text.split("-");
    for (var count = 0; count < array.length; count++) {
        $("#keywExp").append(array[count] + "<br><br>");
    }
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

    var dinfomenu = false;
    $("#dinfomenu").click(function () {
        if (!dinfomenu) {
            $("#diabetesQues").fadeIn();
            dinfomenu = true;
        }
        else {
            $("#diabetesQues").fadeOut();
            dinfomenu = false;
        }
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
            fillKeywords();

            for (var i = 0; i < extraQ.length; i++) {
                $("#diabetesQues").append("<div onclick='showInfo(" + i + ",this)'>" + extraQ[i] + "</div>");
            }
//            $("#diabetesQues").append("<span id='quePos'></span>");
        });
    });

    $("#lb2").click(function () {
        window.open('http://bit.ly/159vbwa', '_blank');
    });

    $("#lb3").click(function () {
        ui
        window.location.reload();
    });

    var dextrainfo = false;
    $("#dExtraInfo").click(function () {
        if (!dextrainfo) {
            $(this).stop().animate({ "bottom": "0" }, 2000, "easeOutElastic");
            dextrainfo = true;
        }
        else {
            $(this).stop().animate({ "bottom": "-43.5%" }, 1000, "easeOutCubic");
            dextrainfo = false;
        }
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