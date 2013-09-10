	package com.work;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import jess.*;
//im not sure why the doGet is called twice

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
		if (request.getParameterMap().containsKey("symptom"))//need to change the name of this
	       	{
			symptom();
		}  else if (request.getParameterMap().containsKey("gender")) {
			gender();
			}  else if (request.getParameterMap().containsKey("diabetic")) {
				diabetic();
				} else if (request.getParameterMap().containsKey("name")) {
					name();
					}
					else if (request.getParameterMap().containsKey("symptoms")) {
					symptomList();
					}
	}

	public void symptom()
		throws IOException, JessException	{
		String text = request.getParameter("symptom");
		response.setContentType("text/plain");  
		response.setCharacterEncoding("UTF-8");	
		Rete engine =(Rete)(getServletContext().getAttribute("engine"));
		engine.assertString("(Input (name "+text+"))");
		System.out.println("(Input (name "+text+"))");
		engine.run();
		System.out.println("done");
		String jessText = engine.getOutputRouter("out").toString();
		((StringWriter)(engine.getOutputRouter("out"))).getBuffer().setLength(0);
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
		String answer = request.getParameter("diabetic");
		if (answer.equals("Yes")) {
			engine.eval("(Diabetic_yes)");
		}	else
			engine.eval("(Diabetic_no)");
	}
	
	public void gender()
       		throws JessException	{
		Rete engine = (Rete)(getServletContext().getAttribute("engine"));
		String gender = request.getParameter("gender");
		if (gender.equals("Male")) {
			engine.assertString("(Gender_male)");
		}	else
			engine.assertString("(Gender_female)");
	}

	public void name()
       		throws JessException, IOException	{
       			System.out.println("name bruuu");
		Rete engine = (Rete)(getServletContext().getAttribute("engine"));
		String name = request.getParameter("name");
		engine.assertString("(name "+name+" )");
		response.getWriter().write("Hello "+ name + " welcome to the Diabetes Risk Advisor Expert System \n Please select an option below.");
		}

}
