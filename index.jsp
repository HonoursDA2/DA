<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Diabetes Advisor</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<link href="css/styleF.css" rel="stylesheet" type="text/css" />
		<link href="css/fonts.css" rel="stylesheet" type="text/css" />
		<script src="js/JQuery.js" type="text/javascript"></script>
		<script src="js/ui.js" type="text/javascript"></script>
		<script src="js/script.js" type="text/javascript"></script>
		<script src="js/scripts.js" type="text/javascript"></script>
		<script src="js/ajaxjsp.js" type="text/javascript"></script>
	</head>
	<body>

		<div id="splash">
			<img src="images/silver.jpg">
			<h1>DA2</h1>
			<h2>Diabetes Advisor</h2>

			Name:<input id="name" name="word" type="text" value="" placeholder="Enter your name here">
			Gender:<input id="name" name="gender" type="text" value="" placeholder="Enter your gender here">
			<input id="post" value="Go" type="button">

			<script>
				$(document).ready(function() {
					
					$('#post').click(function() {
					       var nam = $("#name").val();	
						$.get('servlet',{name:nam}, function(responseText) {
							$('#somediv').text(responseText);         
							});
					});
				});	
			</script>	

			<div id="somediv"></div>
		</div>

		<div id="profile">
			<div><h1>Welcome To DA2</h1>
				<p class="speech" id="intro">
				<span>Hi, I am Doctor Mellitus, a Diabetes Advisor.</span> <br /><br /><br /><br /><br /><br />
				<span>What is your name ?</span> <input id="name" type="text" value="" placeholder="Enter your name here">
				</p>

				<p class="speech" id="gender">
				<span>Are you a male <span id="man">(man)</span> or female <span id="woman">(woman)</span>?</span></p>
				<div id="male" onclick="gSpecific(male)"><img src="images/male-sign.jpg"></div><div id="female" onclick="gSpecific(female)"><img src="images/female-sign.jpg"></div>
				<div id="button" onclick="confirm()">Continue</div>
			</div>
		</div>



		<div class="section" id="advisor">
			<p class="speech"><span id="advisorH1">Hello</span></p>
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
				<div class="buttons" id="thirst" onclick="clicked(thirst)">Thirst</div>
				<div class="buttons" id="urinating" onclick="clicked(urinating)">Frequent Urination</div>
				<div class="buttons" id="vitchiness" onclick="clicked(itchiness)">Vaginal Itchiness</div>
				<div class="buttons" id="dysfunction" onclick="clicked(dysfunction)">Erectile Dysfunction</div>
				<div class="buttons" id="blurvision" onclick="clicked(blurvision)">Blury Vision</div>
				<div class="buttons" id="fatigue" onclick="clicked(fatigue)">Fatigue</div>
				<div class="buttons" id="weightloss" onclick="clicked(weightloss)">Weightloss</div>
				<div class="buttons" id="drymouth" onclick="clicked(drymouth)">Dry Mouth</div>
				<div class="buttons" id="vomiting" onclick="clicked(vomiting)">Vomiting</div>
				<div class="buttons" id="abdomenalpain" onclick="clicked(abdomenalpain)">Abdomenal Pain</div>
				<div class="buttons" id="Div1" onclick="diagnose()">Diagnose</div>
			</div>

			<div id="factors">

			</div>


			<div id="lifestyle">

			</div>

		</div>

		<div id="physician">
			<img src="images/robo.jpg">
		</div>

	</body>
</html>
