					package com.work;

					import java.io.*;
					import javax.servlet.http.*;
					import javax.servlet.*;
					import jess.*;
					import org.json.*;

					public class DA extends HttpServlet{

						StringWriter sw = new StringWriter();
						StringWriter sw2 = new StringWriter();
						StringWriter sw3 = new StringWriter();
						HttpServletRequest request = null;
						HttpServletResponse response = null;
						boolean symptomsChecked = false;
						boolean init = false;
						boolean firstSession = false;
						static int objects = 0;
						String jessText;			
						String jessText2;
						String jessText3;
						Rete engine = null;

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
									tempEngine.batch(servletContext.getRealPath(rulesFile));
									tempEngine.reset();
									System.out.println("creating jess object" + engineCounter());
									servletContext.setAttribute(engineCounter(), tempEngine);
									System.out.println("storing " + engineCounter());
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

							if (request.getParameterMap().containsKey("name")) {
									name();
								}else 
							if (request.getParameterMap().containsKey("symptom"))
							{
								symptom((request.getParameter("sessionID")));
							} else if (request.getParameterMap().containsKey("symptoms")) {
								symptomList();
							}
							else {

								if (request.getParameterMap().containsKey("gender")) {
									gender();
								} else
								if (request.getParameterMap().containsKey("diabetic")) {
									diabetic();
								}  else
								if (request.getParameterMap().containsKey("diabetesK")) {
									diabetesKowledge();
								}  else
								if (request.getParameterMap().containsKey("pregnant")) {
									pregnant();
								}  else
								if (request.getParameterMap().containsKey("familyH")) {
									familyHistory();
								}  else
								if (request.getParameterMap().containsKey("age")) {
									age();
								}  else
								if (request.getParameterMap().containsKey("race")) {
									race();
								}else
								if (request.getParameterMap().containsKey("command")) {
									System.out.println("First");		
									if (request.getParameter("command").equals("question")) {
										question((request.getParameter("sessionID")));
									} else 
										if (request.getParameter("command").equals("init"))
										{
											System.out.println("INIT");
											initialize();
										}
								}
							}	  
						}

						public Rete getEngine (String IDNumber) {
							System.out.println("trying to get " + IDNumber);
						Rete currentEngine =(Rete)(getServletContext().getAttribute(IDNumber));
						return currentEngine;
						}
						

						public void initialize() 
						throws ServletException, IOException {
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
							response.getWriter().write(session);;
							//response.getWriter().flush();
						}

						public void question(String sessionID) throws IOException, JessException, JSONException, ServletException	{ 
								String text ="DEFAULT"; 		
								System.out.println("(Ask-Question)");
								getEngine(sessionID).assertString("(Ask-Question)");
								System.out.println(sessionID);
								getEngine(sessionID).run();
								jessText = getEngine(sessionID).getOutputRouter("out").toString();
								jessText2 = getEngine(sessionID).getOutputRouter("out2").toString();
								jessText3 = getEngine(sessionID).getOutputRouter("out3").toString();
								((StringWriter)(getEngine(sessionID).getOutputRouter("out"))).getBuffer().setLength(0);
								((StringWriter)(getEngine(sessionID).getOutputRouter("out2"))).getBuffer().setLength(0);	
								((StringWriter)(getEngine(sessionID).getOutputRouter("out3"))).getBuffer().setLength(0);	
								response.setContentType("application/json");  
								PrintWriter out = response.getWriter();
								JSONObject jsonObject = new JSONObject();
								jsonObject.put("question", jessText);
								jsonObject.put("type", jessText2);
								jsonObject.put("id", jessText3);
								out.print(jsonObject);
								out.flush();
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
							response.getWriter().write(jessText);

						}

						public void symptomList() 
						throws IOException, JessException {	
							Rete engine =(Rete)(getServletContext().getAttribute("engine"));
							String symptoms = request.getParameter("symptoms");
							if (symptomsChecked==false) {
								System.out.println(request.getParameter("symptoms") +" " + request.getParameter("process"));
								System.out.println("(addFact Symptom "+symptoms+")");	
								engine.eval("(addFact Symptom "+symptoms+")");
								if (request.getParameter("process").equals("complete")) {
									symptomsChecked=true;
									System.out.println("checking facts");
									engine.eval("(facts)");
								}
							} 	
						}

					public void diabetic()
					throws JessException	{
						String Danswer = request.getParameter("diabetic");
						if (Danswer.equals("Yes")) {
							engine.assertString("(Diabetic Yes)");
						}	else{
							engine.assertString("(Diabetic No)");
						}
					}

					public void age()
					throws JessException	{
						String age = request.getParameter("age");
						engine.assertString("(Age "+age+ ")");
					}

					public void race()
					throws JessException	{
						String Ranswer = request.getParameter("race");
							//engine.assertString("(Race "+Danswer+ ")");
					}


					public void diabetesKowledge()
					throws JessException	{
						String DKanswer = request.getParameter("diabetesK");
						if (DKanswer.equals("Yes")) {
							engine.assertString("(Diabetes-Kowledge Yes)");
						}	else{
							engine.assertString("(Diabetes-Kowledge No)");
						}
					}	
					public void pregnant()
					throws JessException	{
						String Panswer = request.getParameter("pregnant");
						if (Panswer.equals("Yes")) {
							engine.assertString("(Pregnant Yes)");
						}	else{
							engine.assertString("(Pregnant No)");
						}
					}

					public void familyHistory()
					throws JessException	{
						String FHanswer = request.getParameter("familyH");
						if (FHanswer.equals("Yes")) {
							engine.assertString("(Family-History Yes)");
						}	else{
							engine.assertString("(Family-History No)");
						}
					}
					
					public void gender()
					throws JessException	{
						String gender = request.getParameter("gender");
						if (gender.equals("Male")) {
							engine.assertString("(Gender Male)");
						}	else
						{
							engine.assertString("(Gender Female)");
						}
					}

					public void name()
					throws JessException, IOException	{
						String name = request.getParameter("name");
						engine.assertString("(name "+name+" )");
						response.getWriter().write("Hello "+ name + " welcome to the Diabetes Risk Assesment and Advisory Expert System \n Please select an option below.");
					}

				}
