window.onload = function () {
    splash();
    info();
};



function info() {
    var info = "images/information.png";
    var buttonInfo = "buttonInfo";
    $(".buttons").append("<img class=" + buttonInfo + " src=" + info + " />");
}



$(function () {
    $(document).on('click', '.buttonInfo', function () {
        var def = $(this).parent().attr("id");
        $("p.speech span").css({ 'text-align': 'left' });
        if (def == 'thirst') {
            document.getElementById("advisorH1").innerHTML = "<span id='def'>" + def + "</span>" + "is blah blah";
        }
        else if (def == 'urinating') {
            document.getElementById("advisorH1").innerHTML = "<span id='def'>" + def + "</span>" + "is blah blah";
        }
        else if (def == 'vitchiness') {
            document.getElementById("advisorH1").innerHTML = "<span id='def'>Vaginal Itchiness</span>" + "<span id='definition'>is blah blah</span>";
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
        $("#symptoms").fadeIn();
        $("#choice, #menu").fadeOut();
    });
    
    $("#nearest").click(function (){
        $("#directions").fadeIn();
    });
});