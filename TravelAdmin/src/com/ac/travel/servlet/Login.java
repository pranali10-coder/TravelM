package com.ac.travel.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ac.travel.bean.LoginBean;
import com.ac.travel.controller.Controller;



/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		LoginBean log=new Controller().getUserByLoginDetails(username,password);
		
		if (log.getUserid()!=null) {
			
			HttpSession sec=request.getSession(true);
			sec.setMaxInactiveInterval(20*60);

			sec.setAttribute("userid",log.getUserid());
			request.getRequestDispatcher("adminhome.jsp").forward(request, response);
		} 
		else 
		{
			System.out.println("In else");
			request.setAttribute("msg","You Have No Permission.. Please Check Login Details..");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}

}
