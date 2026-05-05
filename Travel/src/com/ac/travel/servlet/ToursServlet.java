package com.ac.travel.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.json.JSONObject;

import com.ac.travel.bean.ToursBean;
import com.ac.travel.controller.Controller;
import com.ac.travel.dao.ToursDao;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/tours")
public class ToursServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ToursBean tbean=new ToursBean();
	ToursDao  tdao=new ToursDao();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToursServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action=request.getParameter("tour");
		
	    if (action.equalsIgnoreCase("tours")) 
		{
			 List<ToursBean>tlist=new Controller().getToursList();
			 request.setAttribute("tlist", tlist);
			 request.getRequestDispatcher("tours-list.jsp").forward(request, response);		
		}
	    
	    else if (action.equalsIgnoreCase("Toursoutofmaha")) 
		{
	    	 List<ToursBean>tomahlist=new Controller().getToursoutofmahaList();
			 request.setAttribute("tomahlist", tomahlist);
			 request.getRequestDispatcher("tomaha-list.jsp").forward(request, response);		
		}
	    
		else if (action.equalsIgnoreCase("Toursoutofindia")) 
		{
			 List<ToursBean>toindlist=new Controller().getToursoutofindiaList();
			 request.setAttribute("toindlist", toindlist);
			 request.getRequestDispatcher("toind-list.jsp").forward(request, response);		
		}	    
		else if (action.equalsIgnoreCase("viewtours-details")) 
		{
			int tours_id=Integer.parseInt(request.getParameter("tours_id"));
			tbean=new Controller().getToursbyId(tours_id);
			List<ToursBean>tourslist=new Controller().getToursoutofindiaList();
			request.setAttribute("tbean", tbean);			
			request.setAttribute("tourslist", tourslist);
			request.getRequestDispatcher("tours_details.jsp").forward(request, response);		
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
    	 
    	 }
	}