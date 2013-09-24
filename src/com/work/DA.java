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
		int number = -1;
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		boolean symptomsChecked = false;
		Rete engine = null;
		boolean init = false;
		String jessText;			

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
	//load the jess rulesfile.
		protected void checkInitialized()
		throws ServletException {
			if (getServletContext().getAttribute("engine") == null) {
				ServletContext servletContext = getServletContext();
			String rulesFile = servletContext.getInitParameter("rulesfile");
				try {
					engine = new Rete (this);
					engine.addOutputRouter("out", sw);
					engine.addOutputRouter("out2", sw2);
					engine.addOutputRouter("out3", sw3);
					engine.batch(servletContext.getRealPath(rulesFile));
					engine.reset();
					System.out.println("creating jess object");
					servletContext.setAttribute("engine", engine);
					init = true;
				} catch (Exception jess) {
					throw new ServletException(jess);
				} 
				
			}
		}

		public void chooseFunction()
		throws IOException, JessException, JSONException
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
					System.out.println("question");
					question();
				}
			}	  
		}

		public void question() throws IOException, JessException, JSONException	{
			String text ="DEFAULT"; 
			text = request.getParameter("command");
			System.out.println("getCommand");
			System.out.println(text);		
			if (text.equals("first")) {
				System.out.println("(Ask-Question)");
				engine.assertString("(Ask-Question)");
			engine.run();
			System.out.println("done");
			jessText = engine.getOutputRouter("out").toString();
			String jessText2 = engine.getOutputRouter("out2").toString();
			String jessText3 = engine.getOutputRouter("out3").toString();
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
			System.out.println(jessText +"here");
			System.out.println(jessText2 +"here");
			}
			}

		public void symptom()
		throws IOException, JessException	{
			String jessText;
			String text = request.getParameter("symptom");
			Rete engine =(Rete)(getServletContext().getAttribute("engine"));	
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
		throws IOException, JessException

		{	Rete engine =(Rete)(getServletContext().getAttribute("engine"));
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
		Rete engine = (Rete)(getServletContext().getAttribute("engine"));
		String Danswer = request.getParameter("diabetic");
		if (Danswer.equals("Yes")) {
			engine.assertString("(Diabetic Yes)");
		}	else{
			engine.assertString("(Diabetic No)");
		}
	}

	public void age()
	throws JessException	{
		Rete engine = (Rete)(getServletContext().getAttribute("engine"));
		String age = request.getParameter("age");
		engine.assertString("(Age "+age+ ")");
	}

	public void race()
	throws JessException	{
		Rete engine = (Rete)(getServletContext().getAttribute("engine"));
		String Ranswer = request.getParameter("race");
			//engine.assertString("(Race "+Danswer+ ")");
	}


	public void diabetesKowledge()
	throws JessException	{
		Rete engine = (Rete)(getServletContext().getAttribute("engine"));
		String DKanswer = request.getParameter("diabetesK");
		if (DKanswer.equals("Yes")) {
			engine.assertString("(Diabetes-Kowledge Yes)");
		}	else{
			engine.assertString("(Diabetes-Kowledge No)");
		}
	}	
	public void pregnant()
	throws JessException	{
		Rete engine = (Rete)(getServletContext().getAttribute("engine"));
		String Panswer = request.getParameter("pregnant");
		if (Panswer.equals("Yes")) {
			engine.assertString("(Pregnant Yes)");
		}	else{
			engine.assertString("(Pregnant No)");
		}
	}

	public void familyHistory()
	throws JessException	{
		Rete engine = (Rete)(getServletContext().getAttribute("engine"));
		String FHanswer = request.getParameter("familyH");
		if (FHanswer.equals("Yes")) {
			engine.assertString("(Family-History Yes)");
		}	else{
			engine.assertString("(Family-History No)");
		}
	}
	
	public void gender()
	throws JessException	{
		Rete engine = (Rete)(getServletContext().getAttribute("engine"));
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
		Rete engine = (Rete)(getServletContext().getAttribute("engine"));
		String name = request.getParameter("name");
		engine.assertString("(name "+name+" )");
		response.getWriter().write("Hello "+ name + " welcome to the Diabetes Risk Assesment and Advisory Expert System \n Please select an option below.");
	}

}
