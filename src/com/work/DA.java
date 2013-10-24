package com.work;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import jess.*;
import org.json.*;
import java.util.StringTokenizer;
import java.util.*;
import java.text.*;
/**
DA servelt class for the Diabetes Advisor 2 Web application.
@authour Benjamin Mmari <mmrben001@myuct.ac.za>
@version 1.0 October 28th 2013
**/

public class DA extends HttpServlet{

	StringWriter sw = new StringWriter();
	StringWriter sw2 = new StringWriter();
	StringWriter sw3 = new StringWriter();
	StringWriter sw4 = new StringWriter();
	StringWriter sw5 = new StringWriter();
	StringWriter sw6 = new StringWriter();
	StringWriter sw7 = new StringWriter();
	HttpServletRequest request = null;
	HttpServletResponse response = null;
	static int objects = 0;
	boolean init = false;
	boolean firstSession = false;
	String jessText;			
	String jessText2;
	String jessText3;
	String jessText4;
	String jessText5;
	String questionNumber;	
	String percentage;
	Map<String, String[]> params = null;
	ArrayList<sessionData> sessions = new ArrayList<sessionData>();
	ServletContext servletContext = null;
/**
sessionData is a class that shall be assigned to each new session with the webapplciation
sessions are created on web page load. With this approach there can be multiple sessions within the same browser. sessionData
contains the jessObject and other parameters that keep track of which stage the assessment applciation is.
**/
	private class sessionData {
		boolean symptomsChecked;
		boolean initialComplete;
		Rete engine;

		public sessionData() {
			symptomsChecked = false;
			initialComplete = false;												
			engine = null;
		}

		public void setEngine(Rete theEngine) {
			engine = theEngine;
		}

		public Rete getEngine() {
			return engine;
		}											

		public boolean getSymptomsChecked () {
			return symptomsChecked;
		}

		public boolean getInitialComplete () {
			return initialComplete;
		}

		public void setSymptomsChecked () {
			symptomsChecked = true;
		}

		public void setInitialComplete (boolean value) {
			initialComplete = value;
		}
	}

	public int getInt(String sessionID) {
		return Integer.parseInt(sessionID.charAt(sessionID.length()-1)+"");
	}


	public void doGet(HttpServletRequest request,
			HttpServletResponse response) 
		throws IOException, ServletException
	{
		this.request = request;
		this.response = response;
		params = new HashMap<String, String[]>(request.getParameterMap());
		servletContext = getServletContext();
		try {
			if (
				//getServletContext().getInitParameter("initialized").equals("false")) 
			!init)
			{
				checkInitialized();
			}
			chooseFunction();
		}
		catch (JessException e) {
			System.out.println(e.getMessage());
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
	/**Load the jess rulesfile. ccheck if the server is initialized. Returns the sessionID to be used by the particular session for future correspondance.
	 * @return a sessionID to be used throughout this session.
	**/	
	protected String checkInitialized()
		throws ServletException {
		Rete tempEngine = null;
		String sessionID = "";
		if (servletContext.getAttribute(engineCounter()) == null) {
			sessionID = engineCounter();
			sessions.add(new sessionData());
			String rulesFile = servletContext.getInitParameter("rulesfile");
			try {
				tempEngine = new Rete (this);
				tempEngine.addOutputRouter("out", sw);
				tempEngine.addOutputRouter("out2", sw2);
				tempEngine.addOutputRouter("out3", sw3);
				tempEngine.addOutputRouter("out4", sw4);
				tempEngine.addOutputRouter("out5", sw5);
				tempEngine.addOutputRouter("out6", sw6);
				tempEngine.addOutputRouter("out7", sw7);
				tempEngine.batch(servletContext.getRealPath(rulesFile));
				tempEngine.reset();
				tempEngine.eval("(watch all)");
				System.out.println("creating jess object" + engineCounter());
				sessions.get(getInt(sessionID)).setEngine(tempEngine);
				servletContext.setAttribute(engineCounter(), sessions.get(getInt(sessionID)));
				//System.out.println("storing " + engineCounter());
				init = true;
				//servletContext.setInitParameter("initialized", "true");
				objects++;
			} catch (Exception jess) {
				throw new ServletException(jess);
			}
			return sessionID; 

		}
		return sessionID;
	}
	/**
	*Choose the appropriate function depending on the values in the request.
	**/
	public void chooseFunction()
		throws IOException, JessException, JSONException, ServletException
	{

try {
		if ( params.containsKey("answerID") && params.containsKey("value")) {
							String answerID = request.getParameter("answerID");
							String theAnswer = request.getParameter("value");
							String last = request.getParameter("last");
							getEngine(request.getParameter("sessionID")).eval("( addFact "+answerID +" " +theAnswer+ " "+ last +")");
							getEngine(request.getParameter("sessionID")).run();
				}
			  
		else if (params.containsKey("symptoms")) {
			symptomList((request.getParameter("sessionID")));
		} 
		else {
				if (params.containsKey("command")) {
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

						}  else if ( request.getParameter("command").equals("getFeedback")) {
							getFeedback(request.getParameter("stage"), request.getParameter("sessionID"));

						} else if ( request.getParameter("command").equals("back")) { 
							back(request.getParameter("stage"), request.getParameter("sessionID"));

						}
				}
				} 
			}
			catch (NullPointerException e) {
				System.out.println(e.getMessage());
			}
	}
	/**
	* Returns the Rete object used in this session.
	@param sessionID The sessionID of session that made the request.
	**/
	public Rete getEngine (String sessionID) {
		Rete currentEngine = null;
		try {
		sessionData data = (sessionData)(servletContext.getAttribute(sessionID));
		currentEngine = (Rete)data.getEngine();

	}
		catch (NullPointerException e) {
			System.out.println(e.getMessage());
		}
		return currentEngine;
	}
	/**
	* If this is the first call to the server then this will set the firstSession boolean value to true.
	**/
	public void initialize() 
		throws ServletException, IOException, JessException {
		String session = "";
		if (
			//getServletContext().getInitParameter("first").equals("false"))	
			!firstSession)
		{ 
			session = checkInitialized();
		} else{
			session = "engine0";
			firstSession=true;
			//getServletContext().setInitParameter("first", "true");
		}
		response.setContentType("text/plain");  
		response.setCharacterEncoding("UTF-8");		
		response.getWriter().write(session);
	}

	public void back(String stage, String sessionID) throws JessException {
		if (stage.equals("stage2")){
		sessions.get(getInt(sessionID)).setInitialComplete(true);
		}
		getEngine(sessionID).assertString("(Go-Back)");
		getEngine(sessionID).run();

	}

	public void question(String sessionID) throws IOException, JessException, JSONException, ServletException	{ 
		String text ="DEFAULT"; 		
		String section="";
		System.out.println("(Ask-Question)");
		if (!(sessions.get(getInt(sessionID))).getInitialComplete()) {
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
		percentage = getEngine(sessionID).getOutputRouter("out6").toString();
		((StringWriter)(getEngine(sessionID).getOutputRouter("out"))).getBuffer().setLength(0);
		((StringWriter)(getEngine(sessionID).getOutputRouter("out2"))).getBuffer().setLength(0);	
		((StringWriter)(getEngine(sessionID).getOutputRouter("out3"))).getBuffer().setLength(0);	
		((StringWriter)(getEngine(sessionID).getOutputRouter("out4"))).getBuffer().setLength(0);
		((StringWriter)(getEngine(sessionID).getOutputRouter("out4"))).getBuffer().setLength(0);
		((StringWriter)(getEngine(sessionID).getOutputRouter("out6"))).getBuffer().setLength(0);	
		questionNumber = getEngine(sessionID).getOutputRouter("out7").toString();	
		((StringWriter)(getEngine(sessionID).getOutputRouter("out7"))).getBuffer().setLength(0);
		response.setContentType("application/json");  
		PrintWriter out = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("question", jessText);
		jsonObject.put("type", jessText2);
		jsonObject.put("id", jessText3);
		jsonObject.put("options", jessText4);	
		jsonObject.put("percentage", decimal (percentage));
		jsonObject.put("qNumber", questionNumber);
		out.print(jsonObject);
		out.flush();

		System.out.println("EHHHHHH "+ percentage);
		if (jessText.equals("")) {
			sessions.get(getInt(sessionID)).setInitialComplete(true);
		}
	}

	public String decimal(String decimalString) {
		if (decimalString.length()>0){
		double d = Double.parseDouble(decimalString);
        DecimalFormat f = new DecimalFormat("#");  // this will helps you to always keeps in no decimal places
        return f.format(d) +""; 
    }
    return decimalString;

	}

	public void symptomList(String sessionID) 
		throws IOException, JessException, JSONException {	
		if (!(sessions.get(getInt(sessionID))).getSymptomsChecked()) {
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
				getEngine(sessionID).eval("(addSymptom " +symptoms+")");
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
				sessions.get(getInt(sessionID)).setSymptomsChecked();
			}
			response.setContentType("application/json");  
			PrintWriter out = response.getWriter();
			JSONObject jsonObject = new JSONObject();
			getEngine(sessionID).assertString("(Calculate Totals)");
			getEngine(sessionID).run();
			percentage = getEngine(sessionID).getOutputRouter("out6").toString();
			((StringWriter)(getEngine(sessionID).getOutputRouter("out6"))).getBuffer().setLength(0);	
			jsonObject.put("symptomName", jessText);
			jsonObject.put("url", jessText2);
			jsonObject.put("explanation", jessText3);
			jsonObject.put("additional", jessText4);	
			jsonObject.put("percentage", decimal (percentage));	
			out.print(jsonObject);
			out.flush();
			
			//getEngine(sessionID).eval("(facts)");

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
		String caption = getEngine(sessionID).getOutputRouter("out5").toString();
		((StringWriter)(getEngine(sessionID).getOutputRouter("out5"))).getBuffer().setLength(0);										
		PrintWriter out = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("questions", questions);
		jsonObject.put("type", type);
		jsonObject.put("options", options);
		jsonObject.put("explanations", explanations);
		jsonObject.put("caption", caption);	
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

	public void getFeedback(String stage,String sessionID)
		throws JessException, IOException, JSONException	{
			if (stage.equals("stage1")) {
				getEngine(sessionID).assertString("(Get FeedbackI)");		
			} else 
				if (stage.equals("stage2")) {
					getEngine(sessionID).assertString("(Get FeedbackL)");
				}
				 else 
				if (stage.equals("stage3")) {
					getEngine(sessionID).assertString("(Get FeedbackF)");
				}
		getEngine(sessionID).run();
		String feedback= getEngine(sessionID).getOutputRouter("out").toString();
		String url= getEngine(sessionID).getOutputRouter("out2").toString();
		percentage= getEngine(sessionID).getOutputRouter("out6").toString();	
		((StringWriter)(getEngine(sessionID).getOutputRouter("out"))).getBuffer().setLength(0);
		((StringWriter)(getEngine(sessionID).getOutputRouter("out2"))).getBuffer().setLength(0);
		((StringWriter)(getEngine(sessionID).getOutputRouter("out6"))).getBuffer().setLength(0);
		PrintWriter out = response.getWriter();
		response.setContentType("application/json"); 
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("feedback", feedback);
		jsonObject.put("url", url);
		jsonObject.put("percentage",tokenizeString2(percentage,"*"));
		out.print(jsonObject);
		out.flush();
		System.out.println(feedback);
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
		getEngine(sessionID).assertString("(Calculate Totals)");
		getEngine(sessionID).run();
		percentage = getEngine(sessionID).getOutputRouter("out6").toString();	
		((StringWriter)(getEngine(sessionID).getOutputRouter("out6"))).getBuffer().setLength(0);
		jsonObject.put("percentage", decimal(percentage));
		out.print(jsonObject);
		out.flush();
	}

	public String tokenizeString(String text, String delimeter) {
		StringTokenizer tokenizer =  new StringTokenizer (text, delimeter);
		String resultString="";
		while (tokenizer.hasMoreElements()){
			resultString += tokenizer.nextElement().toString()+"*";
		}
		return resultString;
	}

		public String tokenizeString2(String text, String delimeter) {
		StringTokenizer tokenizer =  new StringTokenizer (text, delimeter);
		return decimal(tokenizer.nextElement().toString());
	}
}
