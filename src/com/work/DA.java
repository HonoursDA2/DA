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
			String text = "some text";

			response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			response.getWriter().write(text);       // Write response body.	
			Rete engine =(Rete)(getServletContext().getAttribute("engine"));

			engine.executeCommand("(printout t " + "ben and kevin" + " crlf)");
		} catch (JessException jess) {
		
		}
	}

	protected void checkInitialized()
		throws ServletException {
		ServletContext servletContext = getServletContext();
		if (servletContext.getAttribute("engine") == null) {
			try {
				Rete engine = new Rete (this);
				engine.reset();
				System.out.println("creating jess object");
				servletContext.setAttribute("engine", engine);
			} catch (Exception jess) {
				throw new ServletException(jess);
			}
		}
	}
}

