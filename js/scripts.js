		function clicked(i) {
		    var j = i - 1;
		    if (!submitArray[j].clicked) {
		        $(submitArray[j].id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		        submitArray[j].clicked = true;
		    }
		    else {
		        $(submitArray[j].id).css({ "color": "grey", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
		        submitArray[j].clicked = false;
		    }
		}

		function initialize() {
		    $.get('DA', { command: "init" }, function (responseText) {
		        setSession(responseText);
		        ajaxCall("question", responseText);
		    });
		}

		function countClicks() {
		    var count = 0;
		    for (var x = 0; x < submitArray.length; x++) {
		        if (submitArray[x].clicked) {
		            count++;
		        }
		    }
		    return count;
		}

		var extraName = extraUrl = extraExp = extraAdd = "";
		function submitSymptoms() {
		    $("#advisorH1").html("");
		    var counter = 0;
		    var count = countClicks();
		    var processText = "incomplete";
		    var clickedSymptoms ="";
		    var symptomNames = new Array();
		    var symptomURLS = new Array();
		    var symptomExp = new Array();
		    var symptomAdditional = new Array();
		    	var clickedSymptoms ="";

		    for (var x = 0; x < submitArray.length; x++) {
		    
		        if (submitArray[x].clicked) {
		            var symptomObject = submitArray[x];
		            clickedSymptoms = clickedSymptoms + $(symptomObject.id).attr('value')+'*';
		            }

		            }
		        
		            $.get('DA', { symptoms: clickedSymptoms, sessionID: sessionID }, function (responseText) {
		                extraName = responseText.symptomName;
		                extraUrl = responseText.url;
		                extraExp = responseText.explanation;
		                extraAdd = responseText.additional;
		                 symptomNames = extraName.split('*');
		               symptomURLS = extraUrl.split('*');
		               symptomExp = extraExp.split('*');
		               symptomAdditional = extraAdd.split('*');
		                     
		                for (var i = 0; i < symptomNames.length-1; i++) {
		            		  $("#symptomsresultsC").append('<div class="symptomsresults"><img src="images/symptoms/' + symptomURLS[i]+ '"><div><h1>' + symptomExp[i] + '</h1></div></div>');
		                    }
		                    $("#symptomsresultsC").append('<div id="cont">Continue</div>');
		                });

	            counter++;
	
		    $("#advisor").animate({ "height": "95%" }, 1000, "easeInOutCirc", function () {
		        $("#symptomsresultsC").fadeIn();
		    });
		    $("#menu").fadeOut();
		    $("#patient").animate({ "bottom": "-101%" }, 1000, "easeInOutCirc", function () {
		        $("#symptoms").fadeOut(0);
		        $("#lifestyle").fadeIn();
		    });

		}

		var count = 0;

		function revert() {
		    if (count == 1) {
		        $("#intro").fadeIn(0);
		        count--;
		        $("#gender,#profile #male, #profile #female").fadeOut(0);
		        $("#button").css({ "margin": "0 0 1.5% 1.5%" });
		        $("#backb").fadeOut();
		    }
		    if (count == 2) {
		        count--;
		        $("#isDiabetic").fadeOut(0);
		        $("#gender,#profile #male, #profile #female").fadeIn(0);
		    }
		}

		var sessionID = 0;

		var isFemale = knowsDiabetes = hasDiabetes = false;

		function setSession(ID) {
		    sessionID = ID;
		}

		function getSession() {
		    return sessionID;
		}

		var theOptions = new Array();
		function ajaxCall(command, sessionID) {

		    $.ajax({
		        url: 'DA',
		        type: 'GET',
		        dataType: 'json',
		        data: {
		            command: command,
		            sessionID: sessionID
		        },
		        contentType: 'application/json',
		        mimeType: 'application/json',
		        success: function (data) {
		            question = data.question;
		            id = data.id;
		            type = data.type;
		            options = data.options;

		            $(".profileH1").html(question);

		            if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
		                $(".questions").html('<input id="' + id + '" value="" type="' + id + '" placeholder="Enter Your ' + id + ' Here">');
		            }
		            else if (type == "MALE-FEMALE") {
		                $(".questions").html('<div id="male" onclick="gSpecific(this)"><img src="images/male-sign.jpg"></div><div id="female" onclick="gSpecific(this)"><img src="images/female-sign.jpg"></div>');
		            }
		            else if (type == "YES-NO") {
		                $(".questions").html('<div id="yesbutton" class="yes" value="yes" onclick="yesno(yes)">Yes</div><div id="nobutton" class="no" value="no" onclick="yesno(no)">No</div>');
		            } else
		                if (type == "OPTIONAL") {
		                    theOptions = options.split('-');
		                    $(".questions").html("");
		                    for (var i = 0; i < theOptions.length; i++) {
		                        $(".questions").append('<div class="options" id="' + theOptions[i] + '">' + theOptions[i] + '</div>');
		                    }

		                }
		                else {
		                    profile();
		                }

		        }
		    });

		    }

		    function ajaxCallLifestyle(command, sessionID) {

		        $.ajax({
		            url: 'DA',
		            type: 'GET',
		            dataType: 'json',
		            data: {
		                command: command,
		                sessionID: sessionID
		            },
		            contentType: 'application/json',
		            mimeType: 'application/json',
		            success: function (data) {
		                question = data.question;
		                id = data.id;
		                type = data.type;
		                options = data.options;

		                $("#advisorH1").html(question);

		                if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
		                    $("#lifestyle .questions").html('<input id="' + id + '" value="" type="' + id + '" placeholder="Enter Your ' + id + ' Here">');
		                }
		                else if (type == "MALE-FEMALE") {
		                    $("#lifestyle .questions").html('<div id="male" onclick="gSpecific(this)"><img src="images/male-sign.jpg"></div><div id="female" onclick="gSpecific(this)"><img src="images/female-sign.jpg"></div>');
		                }
		                else if (type == "YES-NO") {
		                    $("#lifestyle .questions").html('<div id="yesbutton" class="yes" value="yes" onclick="yesno(yes)">Yes</div><div id="nobutton" class="no" value="no" onclick="yesno(no)">No</div>');
		                } else
		                    if (type == "OPTIONAL") {
		                        theOptions = options.split('-');
		                        $("#lifestyle .questions").html("");
		                        for (var i = 0; i < theOptions.length; i++) {
		                            $("#lifestyle .questions").append('<div class="options" id="' + theOptions[i] + '">' + theOptions[i] + '</div>');
		                        }

		                    }
		                    else {
		                        alert("Guess what, you have Diabetes :-O draft a bucket list and enjoy life while you still can, Goodbye");
		                    }

		            }
		        });

		        }

		var submitArray = new Array();
		var symptomName = symptomID = symptomExplanation = new Array();
		function profile() {

		    $.get('DA', { command: "profile", sessionID: sessionID }, function (responseText1) {
		        $('#advisorH1').text(responseText1);
		        $.get('DA', { command: "getSymptoms", sessionID: sessionID }, function (responseText2) {
		            symptomName = responseText2.symptomNames.split("*");
		            symptomID = responseText2.symptomIDs.split("*");
		            symptomExplanation = responseText2.explanation.split("*");

		            $("#symptomsContainer").html("");
		            for (var i = 1; i < symptomName.length - 1; i++) {
		                $("#symptomsContainer").append('<div class="buttons" id="' + symptomID[i] + '" value = "' + symptomName[i] + '" onclick="clicked(' + i + ')">' + symptomName[i].replace("-", " ") + '</div>');
		                buttonObject = { id: "#" + symptomID[i], clicked: false };
		                submitArray[i - 1] = buttonObject;
		            }
		            $("#symptomsContainer").append('<div class="buttons" id="submitB" onclick="submitSymptoms()">Submit</div>');
		        });
		    });

		    $("#profile").fadeOut();
		    $("#choice").fadeOut();
		    $("#symptoms").fadeIn();

		}

		var meter = 0;
		function confirm() {
		    var proceed = false;
		    meter += 10;

		    if (meter == 20) {
		        $("#percentage").css({ "height": "70px" });
		        $("#pvalue").html(meter + "%");
		        $('.imgBg').attr('src', function (i, e) {
		            return e.replace("images/level/lime.jpg", "images/level/lime.jpg");
		        });
		    }
		    else if (meter == 40) {
		        $("#percentage").css({ "height": "140px", "background": "rgba(0,200,0,0.5)" });
		        $("#pvalue").html(meter + "%");
		        $('.imgBg').attr('src', function (i, e) {
		            return e.replace("images/level/lime.jpg", "images/level/green.jpg");
		        });
		    }
		    else if (meter == 60) {
		        $("#percentage").css({ "height": "210px", "background": "rgba(255,255,0,0.5)" });
		        $("#pvalue").html(meter + "%");
		        $('.imgBg').attr('src', function (i, e) {
		            return e.replace("images/level/green.jpg", "images/level/yellow.jpg");
		        });
		    }
		    else if (meter == 80) {
		        $("#percentage").css({ "height": "280px", "background": "rgba(255,155,0,0.5)" });
		        $("#pvalue").html(meter + "%");
		        $('.imgBg').attr('src', function (i, e) {
		            return e.replace("images/level/yellow.jpg", "images/level/orange.jpg");
		        });
		    }
		    else if (meter == 100) {
		        $("#percentage").css({ "height": "330px", "background": "rgba(255,0,0,0.5)" });
		        $("#pvalue").html(meter + "%");
		        $('.imgBg').attr('src', function (i, e) {
		            return e.replace("images/level/orange.jpg", "images/level/red.jpg");
		        });
		    }
		    else if (meter == 120) {
		        $('.imgBg').attr('src', function (i, e) {
		            return e.replace("images/level/red.jpg", "images/level/orange.jpg");
		        });
		    }

		    if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
		        var answer = $("#" + id).val();

		        if (type == "INPUTN") {
		            var intRegex = /^\d+$/;
		            if (intRegex.test(answer)) {
		                $(".feedback").fadeIn();
		                $(".feedback").append("Your " + id + " is : " + answer + "<br>");
		                $.get('DA', { value: answer, answerID: id, sessionID: sessionID });
		                proceed = true;
		            }
		            else {
		                alert("Please Enter a valid number in the " + id + " field");
		            }
		        } else if (type == "INPUTND") {
		            var intRegex = /^(\d+\.?\d*|\.\d+)$/;
		            if (intRegex.test(answer)) {
		                $(".feedback").fadeIn();
		                $(".feedback").append("Your " + id + " is : " + answer + "<br>");
		                $.get('DA', { value: answer, answerID: id, sessionID: sessionID });
		                proceed = true;
		            } else {
		                alert("Please Enter a valid number in the " + id + " field");
		            }

		        }
		        else {
		            $(".feedback").fadeIn();
		            $(".feedback").append("Your " + id + " is : " + answer + "<br>");
		            $.get('DA', { value: answer, answerID: id, sessionID: sessionID });
		            proceed = true;
		        }
		    }
		    else if (type == "YES-NO") {
		        $(".feedback").fadeIn();
		        $(".feedback").append("Your " + id + ": " + yesOrno + "<br>");
		        $.get('DA', { value: yesOrno, answerID: id, sessionID: sessionID });
		        proceed = true;
		    }
		    else if (type == "MALE-FEMALE") {
		        $(".feedback").fadeIn();
		        $(".feedback").append("Gender: " + gendertype + "<br>");
		        $.get('DA', { value: gendertype, answerID: id, sessionID: sessionID });
		        proceed = true;
		    }
		    else if (type == "OPTIONAL") {
		        $(".feedback").fadeIn();
		        $(".feedback").append(id + ": " + opt + "<br>");
		        $.get('DA', { value: opt, answerID: id, sessionID: sessionID });
		        proceed = true;
		    }
		    if (proceed) {
		        ajaxCall("question", sessionID);
		    }

		    
		}

		function confirmLifestyle() {
		    var proceed = false;
		    if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
		        var answer = $("#" + id).val();

		        if (type == "INPUTN") {
		            var intRegex = /^\d+$/;
		            if (intRegex.test(answer)) {
		                $(".feedback").fadeIn();
		                $(".feedback").append("Your " + id + " is : " + answer + "<br>");
		                $.get('DA', { value: answer, answerID: id, sessionID: sessionID });
		                proceed = true;
		            }
		            else {
		                alert("Please Enter a valid number in the " + id + " field");
		            }
		        } else if (type == "INPUTND") {
		            var intRegex = /^(\d+\.?\d*|\.\d+)$/;
		            if (intRegex.test(answer)) {
		                $(".feedback").fadeIn();
		                $(".feedback").append("Your " + id + " is : " + answer + "<br>");
		                $.get('DA', { value: answer, answerID: id, sessionID: sessionID });
		                proceed = true;
		            } else {
		                alert("Please Enter a valid number in the " + id + " field");
		            }

		        }
		        else {
		            $(".feedback").fadeIn();
		            $(".feedback").append("Your " + id + " is : " + answer + "<br>");
		            $.get('DA', { value: answer, answerID: id, sessionID: sessionID });
		            proceed = true;
		        }
		    }
		    else if (type == "YES-NO") {
		        $(".feedback").fadeIn();
		        $(".feedback").append("Your " + id + ": " + yesOrno + "<br>");
		        $.get('DA', { value: yesOrno, answerID: id, sessionID: sessionID });
		        proceed = true;
		    }
		    else if (type == "MALE-FEMALE") {
		        $(".feedback").fadeIn();
		        $(".feedback").append("Gender: " + gendertype + "<br>");
		        $.get('DA', { value: gendertype, answerID: id, sessionID: sessionID });
		        proceed = true;
		    }
		    else if (type == "OPTIONAL") {
		        $(".feedback").fadeIn();
		        $(".feedback").append(id + ": " + opt + "<br>");
		        $.get('DA', { value: opt, answerID: id, sessionID: sessionID });
		        proceed = true;
		    }
		    if (proceed) {
		        ajaxCallLifestyle("question", sessionID);
		    }


		}
		var yes = "Yes";
		var no = "No";
		var yesOrno = "";

		function yesno(theAnswer) {
		    yesOrno = theAnswer;

		    if (theAnswer == "Yes") {
		        $(".yes").css({ "color": "rgba(0,55,0,0.7)", "border-bottom": "5px solid rgba(0,255,0,0.7)" });
		        $(".no").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
		    }
		    if (theAnswer == "No") {
		        yesOrno = "No";
		        $(".no").css({ "color": "rgba(55,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		        $(".yes").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
		    }
		}

		var gendertype = aGender = "";
		function gSpecific(gender) {
		    if (gender.id == "male") {
		        gendertype = "Male";
		        isFemale = false;
		        aGender = "Male";
		        $("#gestational").fadeOut();
		        $("#yeast").fadeOut();
		        $("#dysfunction").fadeIn();
		        $("#" + gender.id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		        $("#female").css({ "color": "white", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
		    }
		    if (gender.id == "female") {
		        gendertype = "Female";
		        isFemale = true;
		        aGender = "Female";
		        $("#dysfunction").fadeOut();
		        $("#yeast").fadeIn();
		        $("#gestational").fadeIn();
		        $("#" + gender.id).css({ "color": "rgba(255,0,0,0.7)", "border-bottom": "5px solid rgba(255,0,0,0.7)" });
		        $("#male").css({ "color": "grey", "border-bottom": "0px solid rgba(255,0,0,0.7)" });

		    }
		}

		var opt = "";
		$(function () {
		    $(".questions,#lifestyle").on('click', '.options', function () {
		        opt = $(this).attr("id");

		        $(this).css({ "color": "red", "border-bottom": "5px solid red" });
		        var temp = opt;
		        for (var i = 0; i < theOptions.length; i++) {
		            if (temp != theOptions[i]) {
		                $("#" + theOptions[i]).css({ "color": "black", "border-bottom": "0px solid rgba(255,0,0,0.7)" });
		            }
		        }
		    });

		    $('#symptomsContainer').on('mouseover', '.buttons', function () {
		        var symID = $(this).attr("id");

		        var index = symptomID.indexOf(symID);

		        $("#advisorH1").html(symptomExplanation[index]);
		    });

		    $("#symptomsresultsC").on('click', '#cont', function () {
		        $("#symptomsresultsC").fadeOut();
		        $("#contButton").fadeIn();
		        $("#advisor").animate({ "height": "47%" }, 1000, "easeInOutCirc");
		        $("#menu").fadeIn();
		        $("#patient").animate({ "bottom": "2.55%" }, 1000, "easeInOutCirc");

		        $.get('DA', { command: "question", sessionID: sessionID }, function (data) {
		            question = data.question;
		            id = data.id;
		            type = data.type;
		            options = data.options;

		            
		            $("#advisorH1").html(question);

		            if (type == "INPUTT" || type == "INPUTN" || type == "INPUTND") {
		                $("#lifestyle .questions").html('<input id="' + id + '" value="" type="' + id + '" placeholder="Enter Your ' + id + ' Here">');
		            }
		            else if (type == "MALE-FEMALE") {
		                $("#lifestyle .questions").html('<div id="male" onclick="gSpecific(this)"><img src="images/male-sign.jpg"></div><div id="female" onclick="gSpecific(this)"><img src="images/female-sign.jpg"></div>');
		            }
		            else if (type == "YES-NO") {
		                $("#lifestyle .questions").html('<div id="yesbutton" class="yes" value="yes" onclick="yesno(yes)">Yes</div><div id="nobutton" class="no" value="no" onclick="yesno(no)">No</div>');
		            } else
		                if (type == "OPTIONAL") {
		                    theOptions = options.split('-');
		                    $("#lifestyle .questions").html("");
		                    for (var i = 0; i < theOptions.length; i++) {
		                        $("#lifestyle .questions").append('<div class="options" id="' + theOptions[i] + '">' + theOptions[i] + '</div>');
		                    }

		                }
		                else {
		                    alert("Guess what, you have Diabetes :-O draft a bucket list and enjoy life while you still can, Goodbye")
		                }

		        });
		    });
		});

		function splash() {
		    $("#splash").delay(2000).effect("puff", 500);
		}