package com.ac.travel.servlet;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ac.travel.bean.ContactBean;
import com.ac.travel.controller.Controller;

/**
 * Servlet implementation class Contact
 */
@WebServlet("/Contact")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ContactBean conbean=new ContactBean();
	Controller cont=new Controller();
	String username=null;
	String email=null;
	String phone=null;
	String message=null;
    SendMailUsingAuthentication e=new SendMailUsingAuthentication();
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
       
			
			request.getRequestDispatcher("contact.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userid=request.getParameter("userid");
		
		String name=request.getParameter("name");
		if(name!=null)
			name=new String(name.getBytes("ISO_8859_1"),"UTF8");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		if(phone!=null)
			phone=new String(phone.getBytes("ISO_8859_1"),"UTF8");
		String message=request.getParameter("message");
		if(message!=null)
		message=new String(message.getBytes("ISO_8859_1"),"UTF8");	
		String status=request.getParameter("status");
		//String status="1";
		
		ContactBean conbean=new ContactBean();
		conbean.setUserid(userid);
		conbean.setUsername(name);
		conbean.setEmail(email);
		conbean.setPhone(phone);
		conbean.setMessage(message);
		conbean.setStatus(status);
		
		
		String from="pranalimore9696@gmail.com";
		String mailname="pranalimore9696@gmail.com";
	   	 
	    //String em[]={request.getParameter("email")};
		String sub=request.getParameter("subject");
		String msg=request.getParameter("content");
		String em[]={mailname};
		
		
		if(em!=null)
		{
			try 
			{
			
				String body="<b>Contact:<b><br> Name:</b>"+username+"<br> <b> phone:</b>"+phone+"<br><b> Email Id:</b>"+email+"<br><b> Message:</b>"+message;
				
				boolean result=e.postMail(em,"Test",body, from);
				
			}
			catch (MessagingException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		Controller cont=new Controller();
		int res=cont.getContact(conbean);
		request.setAttribute("res", res);
		request.getRequestDispatcher("contact.jsp").forward(request, response);
	}

}
