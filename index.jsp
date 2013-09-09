<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Diabetes Advisor</title>
    <link href="css/style1366.css" media="screen and (min-device-width: 1366px)" rel="stylesheet" type="text/css"/>
    <link href="css/style1920.css" media="screen and (min-device-width: 1920px)" rel="stylesheet" type="text/css" />
    <link href="css/styleF.css" rel="stylesheet" type="text/css" />
    <link href="css/fonts.css" rel="stylesheet" type="text/css" />
    <script src="js/JQuery.js" type="text/javascript"></script>
    <script src="js/ui.js" type="text/javascript"></script>
    <script src="js/script.js" type="text/javascript"></script>
    <script src="js/scripts.js" type="text/javascript"></script>
</head>
<body>
	<script>
	    $(document).ready(function () {

	        $('#button').click(function () {
	            var nam = $("#name").val();
	            $.get('servlet', { name: nam }, function (responseText) {
	                $('#advisorH1').text(responseText);
	            });

	            $('.buttons').mouseover(function () {
	                var symptomName = $(this).attr("value");
	                $.get('servlet', { symptom: symptomName }, function (responseText) {
	                    $('#advisorH1').text(responseText);
	                });

	            });

	        });
	    });	
	</script>

<div id="splash">
<img src="images/silver.jpg">
<h1>DA2</h1>
<h2>Diabetes Advisor</h2>
</div>

<div id="profile">
<div><h1>Welcome To DA2</h1>
<div class="speech" id="intro">
<span>Hi, I am Doctor Mellitus, a Diabetes Advisor.</span> <br /><br /><br /><br /><br /><br />
<span>What is your name ?</span> <input id="name" type="text" value="" placeholder="Enter your name here">
</div>
<div class="speech" id="gender">
<span>Are you a male <span id="man">(man)</span> or female <span id="woman">(woman)</span>?</span></div>
<div id="male" onclick="gSpecific(male)"><img src="images/male-sign.jpg"></div><div id="female" onclick="gSpecific(female)"><img src="images/female-sign.jpg"></div>
    
<div class="speech" id="isDiabetic">
<span>Are you diabetic?</span></div>
<div id="yes" onclick="isDiabetic(yes)">Yes</div><div id="no" onclick="isDiabetic(no)">No</div>

<div id="backb" onclick="revert()">Back</div><div id="button" onclick="confirm()">Continue</div>
</div>
</div>

<div class="section" id="advisor">
    

<div class="speech"><span id="advisorH1">Hello</span>
    
<div id="definition">Extra Definitions here</div>
<img id="extra" src="images/information.png">
</div>
    
<div id="directions">
<iframe width="50%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.za/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=nearest+clinic&amp;aq=&amp;sll=-33.9398,18.568611&amp;sspn=0.114074,0.264187&amp;t=h&amp;ie=UTF8&amp;hq=clinic&amp;hnear=&amp;ll=-33.939942,18.568611&amp;spn=0.136718,0.219727&amp;z=12&amp;output=embed"></iframe>
<div>
<h1>Clinics Nearest To You</h1>
<br /><h2><a target="_blank" href="https://maps.google.co.za/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=nearest+clinic&amp;aq=&amp;sll=-33.9398,18.568611&amp;sspn=0.114074,0.264187&amp;t=h&amp;ie=UTF8&amp;hq=clinic&amp;hnear=&amp;ll=-33.939942,18.568611&amp;spn=0.136718,0.219727&amp;z=12" style="text-align:left">View Larger Map</a></h2>
</div>
</div>


</div>

<div class="section" id="patient">
<div id="backbutton"><img src="images/icons/back.png"></div>
    
<div id="menu">
<div>Menu</div>
<div id="nearest">Nearest Clinic</div>
<div>Exit</div>
</div>

<div id="choice">
<h1 id="patientH1">...</h1>
<div id="symptom">Symptoms</div>
<div id="factor">.<img src="images/risk.png"></div>
<div id="life">.<img src="images/lifestyle.jpg"></div>
</div>

<div id="symptoms">
<div class="buttons" id="thirst" value="Extreme-Thirst" onclick="clicked(thirst)">Thirst</div>
<div class="buttons" id="urinating" value="Excessive-Urination" onclick="clicked(urinating)">Frequent Urination</div>
<div class="buttons" id="vitchiness" value="Vaginal-Itchiness" onclick="clicked(itchiness)">Vaginal Itchiness</div>
<div class="buttons" id="dysfunction" value="Erectile-Dysfunction" onclick="clicked(dysfunction)">Erectile Dysfunction</div>
<div class="buttons" id="blurvision" value="Blurred-Vision" onclick="clicked(blurvision)">Blury Vision</div>
<div class="buttons" id="fatigue" value="Fatigue" onclick="clicked(fatigue)">Fatigue</div>
<div class="buttons" id="weightloss" value="Weightloss" onclick="clicked(weightloss)">Weightloss</div>
<div class="buttons" id="drymouth" value="Dry-Mouth" onclick="clicked(drymouth)">Dry Mouth</div>
<div class="buttons" id="abdominalpain" value="Abdominal-Pain" onclick="clicked(abdominalpain)">Abdominal Pain</div>
<div class="buttons" id="nausea" value="Nausea" onclick="clicked(nausea)">Nausea</div>
<div class="buttons" id="irritability" value="Irritability" onclick="clicked(irritability)">Irritability</div>
<div class="buttons" id="yeast" onclick="clicked(yeast)">Yeast Infection</div>
<div class="buttons" id="wounds" value="Slow-Healing-Wounds" onclick="clicked(wounds)">Slow Healing of Wounds</div>
<div class="buttons" id="numbness" onclick="clicked(numbness)">Numbness</div>
<div class="buttons" id="teethandgum" value="Teeth-and-Gum-Problems" onclick="clicked(teethandgum)">Teeth and gum problems</div>
<div class="buttons" id="hunger" value="Extreme-Hunger" onclick="clicked(hunger)">Extreme Hunger</div>
<div class="buttons" id="Div1" onclick="submitSymptoms()">Submit</div>
</div>

<div id="factors">
    <div></div>
    <div></div>
</div>


<div id="lifestyle">
    
</div>

</div>

<div id="physician">
<img src="images/robo.jpg">
</div>

</body>
</html>
