package com.ac.travel.servlet;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ac.travel.bean.EnquiryBean;
import com.ac.travel.controller.Controller;



/**
 * Servlet implementation class Contact
 */
@WebServlet("/Enquiry")
public class EnquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EnquiryBean enbean=new EnquiryBean();
	Controller cont=new Controller();
	String username=null;
	String email=null;
	String phone=null;
	String message=null;
	String subject=null;
    SendMailUsingAuthentication e=new SendMailUsingAuthentication();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnquiryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
       
			
			request.getRequestDispatcher("inquiry.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String enquiryid=request.getParameter("enquiryid");
		String fullname=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String message=request.getParameter("message");	
		String subject=request.getParameter("toursub");
		String status="1";
		
		EnquiryBean enbean=new EnquiryBean();
		enbean.setEnquiryid(enquiryid);
		enbean.setFullname(fullname);
		enbean.setEmail(email);
		enbean.setPhone(phone);
		enbean.setMessage(message);
		enbean.setSubject(subject); 
		enbean.setStatus(status);
		
		
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
		int res=cont.getEnquiry(enbean);
		request.setAttribute("res", res);
		request.getRequestDispatcher("inquiry.jsp").forward(request, response);
	}

}
