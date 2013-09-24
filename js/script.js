var question = type = id = "";

window.onload = function () {
    //splash();
    $.get('DA', { command: "init" }, function (responseText) {
                setSession(responseText);
                ajaxCall("question", responseText);
                });

    var first = "first";
    var dataString = "command=" + first;

    $.ajax({
        url: 'DA',
        type: 'GET',
        dataType: 'json',
        data: dataString,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function (data) {
            question = data.question;
            id = data.id;
            type = data.type;
            $(".profileH1").html(question);

            if (type == "INPUT") {
                $(".questions").html('<input id="' + id + '" value="" type="' + id + '" placeholder="Enter Your ' + id + ' Here">');
            }
        }
    });

};

function rscroll() {
    $('#symptoms').animate({
        scrollLeft: '+=20'
    }, 200, rscroll);
}

function lscroll() {
    $('#symptoms').animate({
        scrollLeft: '-=20'
    }, 200, lscroll);
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