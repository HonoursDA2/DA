package com.work;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import jess.*;

public class DA extends HttpServlet{

	StringWriter sw = null;
	int number=0;
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) 
		throws IOException, ServletException
	{
		sw = new StringWriter();
		try {
			number++;
			System.out.println(number);
			if (number%2==0) {
			checkInitialized();
			System.out.println("working");
			String text = request.getParameter("name");
			response.setContentType("text/plain");  
			response.setCharacterEncoding("UTF-8");	
			Rete engine =(Rete)(getServletContext().getAttribute("engine"));
			engine.assertString("(Input (name "+text+"))");
			System.out.println("(Input (name "+text+"))");
			//engine.eval("(facts)");
			//engine.eval("(facts)");
			//engine.executeCommand("(printout out " + text + " crlf)");
			engine.eval("(facts)");
			engine.run();
			System.out.println("done");
			String jessText = engine.getOutputRouter("out").toString();
			((StringWriter)(engine.getOutputRouter("out"))).getBuffer().setLength(0);
			response.getWriter().write( jessText);
			}
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

}
