/*
 * Created on 23.11.2004
 */
package de.laliluna.tutorial.library.servlets;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import de.laliluna.tutorial.library.SimulateDB;

/**
 * @author laliluna.de
 */
public class BookList extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BookList() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//init session of request
		HttpSession session = request.getSession();
		
		//init database class
		SimulateDB simulateDB = new SimulateDB();
		
		//get all books from the database class
		Collection collection = simulateDB.getAllBooks(session);
		
		//set the returned collection in the request
		request.setAttribute("books", collection);
				
		//get the request dispatcher
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/bookList.jsp");
		
		//forward to the jsp file to display the book list
		dispatcher.forward(request, response);		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//call the doGet method
		this.doGet(request, response);
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
