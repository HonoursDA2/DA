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
				Rete engine = null;
				boolean init = false;
				static int objects = 0;
				String jessText;			
				String jessText2;
				String jessText3;
				String thisEngine;

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
		 	thisEngine = objects +"";
		 	return "engine"+ objects;
		 }

			//load the jess rulesfile. ccheck if the server is initialized
				protected void checkInitialized()
				throws ServletException {
					if (getServletContext().getAttribute(engineCounter()) == null) {
						ServletContext servletContext = getServletContext();
					String rulesFile = servletContext.getInitParameter("rulesfile");
						try {
							engine = new Rete (this);
							engine.addOutputRouter("out", sw);
							engine.addOutputRouter("out2", sw2);
							engine.addOutputRouter("out3", sw3);
							engine.batch(servletContext.getRealPath(rulesFile));
							engine.reset();
							System.out.println("creating jess object" + engineCounter());
							servletContext.setAttribute(engineCounter(), engine);
							init = true;
							objects++;
						} catch (Exception jess) {
							throw new ServletException(jess);
						} 
						
					}
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
						symptom();
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
							question(request.getParameter("command"));
						}
					}	  
				}

				public void question(String value) throws IOException, JessException, JSONException, ServletException	{
					String text ="DEFAULT"; 
					text = value;		
					if (text.equals("first")) {
						getServletContext().setAttribute("engine", null);
						checkInitialized();
						question("question");
					} else
					if (text.equals("question")) {
						System.out.println("(Ask-Question)" + thisEngine);
						engine.assertString("(Ask-Question)");
						engine.run();
						jessText = engine.getOutputRouter("out").toString();
						jessText2 = engine.getOutputRouter("out2").toString();
						jessText3 = engine.getOutputRouter("out3").toString();
						((StringWriter)(engine.getOutputRouter("out"))).getBuffer().setLength(0);
						((StringWriter)(engine.getOutputRouter("out2"))).getBuffer().setLength(0);	
						((StringWriter)(engine.getOutputRouter("out3"))).getBuffer().setLength(0);	
						response.setContentType("application/json");  
						PrintWriter out = response.getWriter();
						JSONObject jsonObject = new JSONObject();
						jsonObject.put("question", jessText);
						jsonObject.put("type", jessText2);
						jsonObject.put("id", jessText3);
						out.print(jsonObject);
						out.flush();
					}
					}

				public void symptom()
				throws IOException, JessException	{
					String text = request.getParameter("symptom");	
					if (text.equals("extra")) {
						engine.assertString("(Extra-Info)");

					} else {
						engine.assertString("(Input (name "+text+"))");
						System.out.println("(Input (name "+text+"))");
					}

					engine.run();
					System.out.println("done");
					jessText = engine.getOutputRouter("out").toString();
					((StringWriter)(engine.getOutputRouter("out"))).getBuffer().setLength(0);
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
