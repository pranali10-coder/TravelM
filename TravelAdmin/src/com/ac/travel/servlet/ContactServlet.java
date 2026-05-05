package com.ac.travel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ac.travel.bean.ContactBean;
import com.ac.travel.controller.Controller;



/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/managecontact")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String action=request.getParameter("contact");
			
		   if (action.equalsIgnoreCase("contact")) 
			{	
		List<ContactBean>clist=new Controller().getContactList();
		request.setAttribute("clist", clist);
		request.getRequestDispatcher("listcontact.jsp").forward(request, response);
			}
		   else if (action.equalsIgnoreCase("deleteContact")) 
			{
				String status=request.getParameter("status");
				String userid=request.getParameter("userid");
				new Controller().deleteContact(userid,status);
				response.sendRedirect("managecontact?contact=contact");
			}
			else {
				 response.sendRedirect("index.jsp");
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
