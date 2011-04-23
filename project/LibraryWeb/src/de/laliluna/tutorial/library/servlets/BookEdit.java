/*
 * Created on 22.11.2004
 */
package de.laliluna.tutorial.library.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import de.laliluna.tutorial.library.Book;
import de.laliluna.tutorial.library.SimulateDB;

/**
 * @author laliluna.de
 */
public class BookEdit extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BookEdit() {
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

		//get session of the request
		HttpSession session = request.getSession();
		
		//init the simulate DB
		SimulateDB simulateDB = new SimulateDB();
		
		//get parameter do of the request
		String action = request.getParameter("do");
		
		//get the id of the request
		Long id = null;
		if(request.getParameter("id") != null)
			id = Long.valueOf(request.getParameter("id"));
		
		//add / edit book
		if(action.equals("add")){
			
			//get the request dispatcher
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/bookAdd.jsp");
			
			//forward to the jsp file to display the book list
			dispatcher.forward(request, response);	
		
		}else if(action.equals("edit")){
			
			//get the book from simulated DB
			Book book = new Book();
			if(id != null)
				book = simulateDB.loadBookById(id.longValue(), session);
			
			//set the book objekt in the request
			request.setAttribute("book", book);
			
			//get the request dispatcher
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/bookEdit.jsp");
			
			//forward to the jsp file to display the book list
			dispatcher.forward(request, response);	
			
		
		//delete book
		}else if(action.equals("delete")){
			
			//delete the book by id
			simulateDB.deleteBookById(id.longValue(), session);
			
			//redirect to the book list servlet 
			response.sendRedirect(request.getContextPath() + "/bookList");

		}
		
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
		
		//get session of the request
		HttpSession session = request.getSession();
		
		//init the simulate DB
		SimulateDB simulateDB = new SimulateDB();
		
		//get book properties from the request
		long id = 0;
		
		try{ id = Long.parseLong(request.getParameter("id")); }
		catch(NumberFormatException e){}
		
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		Boolean available = Boolean.valueOf(request.getParameter("available"));
				
		//create a new book object
		Book book = new Book(id, author, title, available.booleanValue());
		
		//save the book to DB
		simulateDB.saveToDB(book, session);
		
		//redirect to the book list servlet 
		response.sendRedirect(request.getContextPath() + "/bookList");
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
