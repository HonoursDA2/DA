package com.work;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import jess.*;

public class DA extends HttpServlet{


	public void doGet(HttpServletRequest request,
			HttpServletResponse response) 
		throws IOException, ServletException
	{
		try {
			checkInitialized();
			System.out.println("working");
			String text = request.getParameter("name");

			response.setContentType("text/plain");  
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(text+ " from jess");     	
			Rete engine =(Rete)(getServletContext().getAttribute("engine"));

			engine.executeCommand("(printout t " + text + " crlf)");
		} catch (JessException jess) {

		}
	}
	//load the jess rulesfile.
	protected void checkInitialized()
		throws ServletException {
		ServletContext servletContext = getServletContext();
		String rulesFile = servletContext.getInitParameter("rulesfile");
		System.out.println(rulesFile);
		if (servletContext.getAttribute("engine") == null) {
			try {
				Rete engine = new Rete (this);
				System.out.println(servletContext.getRealPath(rulesFile));
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
