	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
	<div id="backb" onclick="revert()">Back</div><div id="button" onclick="confirm()">Continue</div>
	</div>

	<div id="feedback"></div>

	</div>
	</div>

	<div class="section" id="advisor">
	    

	<div class="speech"><span id="advisorH1">Hello</span>
	    
	<div id="definition"></div>
	<img id="extra" src="images/information.png">
	<div id="symptomsresultsC"></div>
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
	<div class="prev"></div><div class="next"></div>
	<div id="symptomsContainer">
	</div>
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
