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

        $("#theAdvisor").click(function () {
            $("#splash #moreInfo").css({ "opacity": "0.2" });
            $(this).css({ "box-shadow": "0 2px 15px -2px red" });
            $("#splash").delay(2000).effect("puff", 1000);
        });

        $("#moreInfo").click(function () {
            $("#splash #theAdvisor").css({ "opacity": "0.2" });
            $(this).css({ "box-shadow": "0 2px 15px -2px red" });
            $("#diabetesInfo").fadeIn();
            $("#splash").delay(2000).effect("puff", 1000);
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