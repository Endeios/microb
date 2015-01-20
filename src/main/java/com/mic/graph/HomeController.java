package com.mic.graph;

import java.io.BufferedWriter;

import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.SimpleSelector;
import com.hp.hpl.jena.rdf.model.Statement;
import com.hp.hpl.jena.rdf.model.StmtIterator;
import com.hp.hpl.jena.util.FileManager;




/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//@RequestMapping(value = "/", method = RequestMethod.GET)
	/*public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	*/
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model2) {
		
		String stringa = new String();
	    InputStream in = FileManager.get().open("onto2.rdf");
		com.hp.hpl.jena.rdf.model.Model model =  ModelFactory.createDefaultModel();

	    model.read(new InputStreamReader(in),"");
	    StmtIterator iter = model.listStatements( new SimpleSelector(null, null, (RDFNode) null));
	    stringa = "[\n";
	    while (iter.hasNext()) {
		      Statement statement = (Statement)iter.next();
		      
		      if( (!statement.getSubject().toString().contains("www.w3.org")) & ( !statement.getObject().toString().contains("http://www.w3.org")) )
		      	{ 
		    	  if( (statement.getSubject().toString().contains("http")) & ( statement.getObject().toString().contains("http")) )
		    	  stringa += "{source: \"" + statement.getSubject() + "\" , target: \"" + statement.getObject() + "\", type : \"" + statement.getPredicate() + "\"\n},\n" ;
		      	}
	    }
	    
	   stringa += "]";
	   model2.addAttribute("stringa", stringa );
			
	   return "home";
	}
	
}
