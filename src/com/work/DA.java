	package com.work;

	import java.io.*;
	import javax.servlet.http.*;
	import javax.servlet.*;
	import jess.*;

	public class DA extends HttpServlet{

		StringWriter sw = null;
		int number = 0;
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		boolean symptomsChecked = false;

		public void doGet(HttpServletRequest request,
			HttpServletResponse response) 
		throws IOException, ServletException
		{
			this.request = request;
			this.response = response;
			sw = new StringWriter();
			try {
				number++;
				System.out.println(number);
				checkInitialized();
				System.out.println("working");
				chooseFunction();
			}
			catch (JessException jess) {

			}

		}
	//load the jess rulesfile.
		protected void checkInitialized()
		throws ServletException {
			ServletContext servletContext = getServletContext();
			String rulesFile = servletContext.getInitParameter("rulesfile");
			if (servletContext.getAttribute("engine") == null) {
				try {
					Rete engine = new Rete (this);
					engine.addOutputRouter("out", sw);
					engine.batch(servletContext.getRealPath(rulesFile));
					engine.reset();
					System.out.println("creating jess object");
					servletContext.setAttribute("engine", engine);
				} catch (Exception jess) {
					throw new ServletException(jess);
				}
			}
		}

		public void chooseFunction()
		throws IOException, JessException
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
				}
				if (request.getParameterMap().containsKey("diabetic")) {
					diabetic();
				} 
				if (request.getParameterMap().containsKey("diabetesK")) {
					diabetesKowledge();
				}  
				if (request.getParameterMap().containsKey("pregnant")) {
					pregnant();
				}  
				if (request.getParameterMap().containsKey("familyH")) {
					familyHistory();
				}  
				if (request.getParameterMap().containsKey("age")) {
					age();
				}  
				if (request.getParameterMap().containsKey("race")) {
					race();
				}
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
