									package com.work;

									import java.io.*;
									import javax.servlet.http.*;
									import javax.servlet.*;
									import jess.*;
									import org.json.*;
									import java.util.StringTokenizer;
									public class DA extends HttpServlet{

										StringWriter sw = new StringWriter();
										StringWriter sw2 = new StringWriter();
										StringWriter sw3 = new StringWriter();
										StringWriter sw4 = new StringWriter();
										HttpServletRequest request = null;
										HttpServletResponse response = null;
										boolean symptomsChecked = false;
										boolean init = false;
										boolean firstSession = false;
										static int objects = 0;
										String jessText;			
										String jessText2;
										String jessText3;
										String jessText4;	
										Rete engine = null;
										boolean initialComplete=false;
										

										public void doGet(HttpServletRequest request,
											HttpServletResponse response) 
										throws IOException, ServletException
										{
											this.request = request;
											this.response = response;
										try {
											if (!init){
												checkInitialized();
											}
												chooseFunction();
										}
										catch (JessException e) {
												System.out.println("PROBLEM with jess");
										}
										catch (JSONException e) {
														System.out.println("PROBLEM with json");
												
												}
										}
										 public void doPost(HttpServletRequest request,
								                     HttpServletResponse response)
								      throws ServletException, IOException {
								     doGet(request, response);
								 }

								 public String engineCounter() {
								 	return "engine"+ objects;
								 }

									//load the jess rulesfile. ccheck if the server is initialized
										protected String checkInitialized()
										throws ServletException {
											Rete tempEngine = null;
											String sessionID = "";
											if (getServletContext().getAttribute(engineCounter()) == null) {
												sessionID = engineCounter();
												ServletContext servletContext = getServletContext();
												String rulesFile = servletContext.getInitParameter("rulesfile");
												try {
													tempEngine = new Rete (this);
													tempEngine.addOutputRouter("out", sw);
													tempEngine.addOutputRouter("out2", sw2);
													tempEngine.addOutputRouter("out3", sw3);
													tempEngine.addOutputRouter("out4", sw4);
													tempEngine.batch(servletContext.getRealPath(rulesFile));
													tempEngine.reset();
													tempEngine.eval("(watch all)");
													System.out.println("creating jess object" + engineCounter());
													servletContext.setAttribute(engineCounter(), tempEngine);
													//System.out.println("storing " + engineCounter());
													init = true;
													objects++;
												} catch (Exception jess) {
													throw new ServletException(jess);
												}
												return sessionID; 
												
											}
											return sessionID;
										}
										//chose the appropriate function depending on the input from the front-end
										public void chooseFunction()
										throws IOException, JessException, JSONException, ServletException
										{
											
											 if (request.getParameterMap().containsKey("symptoms")) {
												symptomList((request.getParameter("sessionID")));
											} 
											else {
											if (request.getParameterMap().containsKey("symptom"))
											{
												symptom((request.getParameter("sessionID")));
											} else 
											if (request.getParameterMap().containsKey("command")) {
													if (request.getParameter("command").equals("question")) {
														question((request.getParameter("sessionID")));
													} else 
														if (request.getParameter("command").equals("init"))
														{
															initialize();
														} else if ( request.getParameter("command").equals("profile")) {
															profile(request.getParameter("sessionID"));
														} else if ( request.getParameter("command").equals("getSymptoms")) {
															symptoms(request.getParameter("sessionID"));
														} else if ( request.getParameter("command").equals("getInfo")) {
															diabetesInfo(request.getParameter("sessionID"));
														}
												}else
											{

												String answerID = request.getParameter("answerID");
												String theAnswer = request.getParameter("value");
												getEngine(request.getParameter("sessionID")).eval("( addFact "+answerID +" " +theAnswer+ ")");
											}
											}	  
										}

										public Rete getEngine (String IDNumber) {
											//System.out.println("trying to get " + IDNumber);
										Rete currentEngine =(Rete)(getServletContext().getAttribute(IDNumber));
										return currentEngine;
										}
										
										public void initialize() 
										throws ServletException, IOException, JessException {
											System.out.println("CAALLING ME");
											String session = "";
											if (firstSession)	{ 
												session = checkInitialized();
											  } else{
											  		session = "engine0";
													firstSession= true;
											 	}
											response.setContentType("text/plain");  
											response.setCharacterEncoding("UTF-8");		
											response.getWriter().write(session);
										}

										public void question(String sessionID) throws IOException, JessException, JSONException, ServletException	{ 
												String text ="DEFAULT"; 		
												String section="";
												System.out.println("(Ask-Question)");
												if (!initialComplete) {
													section ="(Ask-Question-Initial)"; 		
												} else {
													section ="(Ask-Question-Lifestyle)"; 			
												}
												getEngine(sessionID).assertString(section);
												System.out.println(sessionID);
												getEngine(sessionID).run();
												jessText = getEngine(sessionID).getOutputRouter("out").toString();
												jessText2 = getEngine(sessionID).getOutputRouter("out2").toString();
												jessText3 = getEngine(sessionID).getOutputRouter("out3").toString();
												jessText4 = getEngine(sessionID).getOutputRouter("out4").toString();
												((StringWriter)(getEngine(sessionID).getOutputRouter("out"))).getBuffer().setLength(0);
												((StringWriter)(getEngine(sessionID).getOutputRouter("out2"))).getBuffer().setLength(0);	
												((StringWriter)(getEngine(sessionID).getOutputRouter("out3"))).getBuffer().setLength(0);	
												((StringWriter)(getEngine(sessionID).getOutputRouter("out4"))).getBuffer().setLength(0);	
												response.setContentType("application/json");  
												PrintWriter out = response.getWriter();
												JSONObject jsonObject = new JSONObject();
												jsonObject.put("question", jessText);
												jsonObject.put("type", jessText2);
												jsonObject.put("id", jessText3);
												jsonObject.put("options", jessText4);	
												out.print(jsonObject);
												out.flush();
												if (jessText.equals("")) {
													initialComplete=true;
												}
											}
										public void symptom(String sessionID)
										throws IOException, JessException	{
											String text = request.getParameter("symptom");	
											if (text.equals("extra")) {
												getEngine(sessionID).assertString("(Extra-Info)");
											} else {
												getEngine(sessionID).assertString("(Input (name "+text+"))");
												System.out.println("(Input (name "+text+"))");
											}
											getEngine(sessionID).run();
											System.out.println("done");
											jessText = getEngine(sessionID).getOutputRouter("out").toString();
											((StringWriter)(getEngine(sessionID).getOutputRouter("out"))).getBuffer().setLength(0);
											response.setContentType("text/plain");  
											response.setCharacterEncoding("UTF-8");		
											response.getWriter().write(jessText.substring(0, jessText.length()-1));
										}
										public void symptomList(String sessionID) 
										throws IOException, JessException, JSONException {	
											if (symptomsChecked==false) {
												String theSymptoms = request.getParameter("symptoms");
												StringTokenizer tokenizer = new StringTokenizer(theSymptoms, "*");
												System.out.println(theSymptoms);	
												jessText ="";
												jessText2 ="";
												jessText3 ="";
												jessText4 ="";
													
												while (tokenizer.hasMoreElements()) {
													String symptoms = tokenizer.nextElement().toString();
													System.out.println("(addFact Symptom "+symptoms+")");	
													getEngine(sessionID).eval("(addFact Symptom "+symptoms+")");
													getEngine(sessionID).run();
													

													jessText += getEngine(sessionID).getOutputRouter("out").toString() +"*";
													jessText2 += getEngine(sessionID).getOutputRouter("out2").toString() +"*";
													jessText3 += getEngine(sessionID).getOutputRouter("out3").toString() +"*";
													jessText4 += getEngine(sessionID).getOutputRouter("out4").toString() +"*";	
													((StringWriter)(getEngine(sessionID).getOutputRouter("out"))).getBuffer().setLength(0);
													((StringWriter)(getEngine(sessionID).getOutputRouter("out2"))).getBuffer().setLength(0);	
													((StringWriter)(getEngine(sessionID).getOutputRouter("out3"))).getBuffer().setLength(0);	
													((StringWriter)(getEngine(sessionID).getOutputRouter("out4"))).getBuffer().setLength(0);
													System.out.println(jessText);	
													symptomsChecked = true;
												}
													
												response.setContentType("application/json");  
												PrintWriter out = response.getWriter();
												JSONObject jsonObject = new JSONObject();
												jsonObject.put("symptomName", jessText);
												jsonObject.put("url", jessText2);
												jsonObject.put("explanation", jessText3);
												jsonObject.put("additional", jessText4);
												out.print(jsonObject);
												out.flush();
												getEngine(sessionID).eval("(facts)");

											} 	
										}

										public void diabetesInfo(String sessionID) 
										throws JessException, IOException, JSONException	{
											getEngine(sessionID).assertString("(Get Info)");
											getEngine(sessionID).run();
											String questions = getEngine(sessionID).getOutputRouter("out").toString();
											((StringWriter)(getEngine(sessionID).getOutputRouter("out"))).getBuffer().setLength(0);
											String type = getEngine(sessionID).getOutputRouter("out2").toString();
											((StringWriter)(getEngine(sessionID).getOutputRouter("out2"))).getBuffer().setLength(0);
											response.setContentType("application/json");  
											String options = getEngine(sessionID).getOutputRouter("out3").toString();
											((StringWriter)(getEngine(sessionID).getOutputRouter("out3"))).getBuffer().setLength(0);
											String explanations = getEngine(sessionID).getOutputRouter("out4").toString();
											((StringWriter)(getEngine(sessionID).getOutputRouter("out4"))).getBuffer().setLength(0);										
											PrintWriter out = response.getWriter();
											JSONObject jsonObject = new JSONObject();
											jsonObject.put("questions", questions);
											jsonObject.put("type", type);
											jsonObject.put("options", options);
											jsonObject.put("explanations", explanations);
											out.print(jsonObject);
											out.flush();
									}

									
									public void profile(String sessionID)
									throws JessException, IOException	{
											getEngine(sessionID).assertString("(Get Name)");
											getEngine(sessionID).run();
											String name = getEngine(sessionID).getOutputRouter("out").toString();
											((StringWriter)(getEngine(sessionID).getOutputRouter("out"))).getBuffer().setLength(0);
											response.setContentType("text/plain");  
											response.setCharacterEncoding("UTF-8");		
											response.getWriter().write("Hello "+name+" I am Dr Mellitus! welcome to the Diabetes Advisory Expert System, please select the symptoms you are currently experiencing then click SUBMIT" );
									}

									public void symptoms(String sessionID)
									throws JessException, JSONException, IOException {
										getEngine(sessionID).assertString("(Get Symptoms)");
										getEngine(sessionID).run();
										jessText  = getEngine(sessionID).getOutputRouter("out").toString();
										jessText2 = getEngine(sessionID).getOutputRouter("out2").toString();
										jessText3 = getEngine(sessionID).getOutputRouter("out3").toString();
										((StringWriter)(getEngine(sessionID).getOutputRouter("out"))).getBuffer().setLength(0);
										((StringWriter)(getEngine(sessionID).getOutputRouter("out2"))).getBuffer().setLength(0);
										((StringWriter)(getEngine(sessionID).getOutputRouter("out3"))).getBuffer().setLength(0);			
										response.setContentType("application/json");  
												PrintWriter out = response.getWriter();
												JSONObject jsonObject = new JSONObject();
												jsonObject.put("symptomNames", tokenizeString(jessText, " "));
												jsonObject.put("symptomIDs", tokenizeString(jessText2, " "));
												jsonObject.put("explanation", tokenizeString(jessText3, "*"));
												out.print(jsonObject);
												out.flush();

									}

									public String tokenizeString(String text, String delimeter) {
										StringTokenizer tokenizer =  new StringTokenizer (text, delimeter);
										String resultString="";
										int number=0;
										while (tokenizer.hasMoreElements()){
												resultString += tokenizer.nextElement().toString()+"*";
												number++;
										}
										return number + "*" + resultString;
									}
								}
