﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Diabetes Advisor</title>
    <link href="http://localhost:8080/DA/css/style1366.css" media="screen and (min-device-width: 1366px)" rel="stylesheet" type="text/css"/>
    <link href="http://localhost:8080/DA/css/style1920.css" media="screen and (min-device-width: 1920px)" rel="stylesheet" type="text/css" />
    <link href="http://localhost:8080/DA/css/styleF.css" rel="stylesheet" type="text/css" />
    <link href="http://localhost:8080/DA/css/fonts.css" rel="stylesheet" type="text/css" />
    <script src="js/JQuery.js" type="text/javascript"></script>
    <script src="js/ui.js" type="text/javascript"></script>
    <script src="js/script.js" type="text/javascript"></script>
    <script src="js/scripts.js" type="text/javascript"></script>
</head>
<body>
	<script>
	    $(document).ready(function () {

	        $('#button').click(function () {
	          $('.buttons').mouseover(function () {
	                var symptomName = $(this).attr("value");
	                $.get('DA', {symptom: symptomName }, function (responseText) {
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
<div class="speech">
<span class="profileH1"></span>
</div>

<div class="questions">

</div>
</div>

<div id="feedback"></div>

<div id="backb" onclick="revert()">Back</div><div id="button" onclick="confirm()">Continue</div>
</div>
</div>

<div class="section" id="advisor">
    

<div class="speech"><span id="advisorH1">Hello</span>
    
<div id="definition"></div>
<img id="extra" src="images/information.png">

<div class="symptomsresults" id="symptom1">
<img src="images/symptoms/nausea.jpg"><div><h1>Extra Info on Nausea</h1></div>
</div>

<div class="symptomsresults" id="symptom2">
<img src="images/symptoms/headache.jpg"><div><h1>Extra Info on Headaches</h1></div>
</div>

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
    
<div id="menu">
<div id="backbutton"><img src="images/icons/back.png"></div>
<div id="nearest">Nearest Clinic</div>
<div>Restart</div>
</div>

<div id="choice">
<h1 id="patientH1">...</h1>
<div id="symptom">Symptoms</div>
<div id="life">.<img src="images/risk.png"></div>
</div>

<div id="symptoms">
<div class="buttons" id="weightloss" value="Weightloss" onclick="clicked(weightloss)">Unusual Weightloss</div>
<div class="buttons" id="thirst" value="Extreme-Thirst" onclick="clicked(thirst)">Thirst</div>
<div class="buttons" id="drymouth" value="Dry-Mouth" onclick="clicked(drymouth)">Dry Mouth</div>
<div class="buttons" id="hunger" value="Extreme-Hunger" onclick="clicked(hunger)">Extreme Hunger</div>
<div class="buttons" id="urinating" value="Excessive-Urination" onclick="clicked(urinating)">Frequent Urination</div>
<div class="buttons" id="nausea" value="Nausea" onclick="clicked(nausea)">Nausea</div>
<div class="buttons" id="fatigue" value="Fatigue" onclick="clicked(fatigue)">Fatigue</div>
<div class="buttons" id="headache" value="Frequent-Headache" onclick="clicked(headache)">Frequent Headaches</div>
<div class="buttons" id="dysfunction" value="Erectile-Dysfunction" onclick="clicked(dysfunction)">Erectile Dysfunction</div>
<div class="buttons" id="yeast" value="Yeast-Infection" onclick="clicked(yeast)">Vaginal Yeast Infection</div>
<div class="buttons" id="gestational" value="Gestational-Diabetes" onclick="clicked(gestational)">Gestational Diabetes</div>
<div class="buttons" id="blurvision" value="Blurred-Vision" onclick="clicked(blurvision)">Blury Vision</div>
<div class="buttons" id="abdominalpain" value="Abdominal-Pain" onclick="clicked(abdominalpain)">Abdominal Pain</div>
<div class="buttons" id="irritability" value="Irritability" onclick="clicked(irritability)">Irritability</div>
<div class="buttons" id="wounds" value="Slow-Healing-Wounds" onclick="clicked(wounds)">Slow Healing of Wounds</div>
<div class="buttons" id="numbness" value="Numbness" onclick="clicked(numbness)">Numbness</div>
<div class="buttons" id="teethandgum" value="Gum-Infection" onclick="clicked(teethandgum)">Teeth and gum problems</div>
<div class="buttons" id="submitB" onclick="submitSymptoms()">Submit</div>
</div>

<div id="lifestyle">
   <h1>Lifestyle</h1>
</div>

</div>

<div id="physician">
<img src="images/robo.jpg">
</div>

</body>
</html>
