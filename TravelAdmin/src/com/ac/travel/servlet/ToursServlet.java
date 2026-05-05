package com.ac.travel.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;

import com.ac.travel.bean.ToursBean;
import com.ac.travel.controller.Controller;
import com.ac.travel.dao.ToursDao;

/**
 * Servlet implementation class ToursServlet
 */
@WebServlet("/tours")
public class ToursServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 ToursBean toursbean=new ToursBean();
	 ToursDao  toursdao=new ToursDao();
	 String name = null;   // to store file name
     String fileType = null;     // to store file type
     String fileTypeandURL = null;  //to store file type and the base64 string
     String extension = null;    // to store extension of image
     String datetime = null;    //  to store date and time in miliseconds
     String image = null; 
     String image_in_file;     
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

		String action=request.getParameter("tact");
		
	    if (action.equalsIgnoreCase("manageTours")) 
		{
			List<ToursBean>tlist=new Controller().getToursList(1);
			request.setAttribute("tlist", tlist);
			
			List<ToursBean>tlist1=new Controller().getToursList(0);
			request.setAttribute("tlist1", tlist1);
			
			request.getRequestDispatcher("listtours.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("deleteTours")) 
		{
			String tours_status=request.getParameter("tours_status");
			String tours_id=request.getParameter("tours_id");
			new Controller().deleteTours(tours_id,tours_status);
			response.sendRedirect("tours?tact=manageTours");
		}
		else if (action.equalsIgnoreCase("addTours"))
		{		
			request.getRequestDispatcher("addtours.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("editTours")) 
		{
			String tours_id=request.getParameter("tours_id");
			ToursBean tb=new Controller().getToursListById(tours_id);
			request.setAttribute("tb",tb);
			request.getRequestDispatcher("addtours.jsp").forward(request, response);
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
	
	HttpSession sec=request.getSession();
		
	  String imgnm;
		//code for imge store
	       HttpSession session = request.getSession();
	       if(request.getParameter("image_file")!="")
	       {
	       image_in_file = request.getParameter("image_file");
	       int i = image_in_file.indexOf(":");
	
	       if (i > 0) {
	           fileTypeandURL = image_in_file.substring(i + 1);
	       }
	
	       int j = fileTypeandURL.indexOf(";");
	
	       if (j > 0) {
	           fileType = fileTypeandURL.substring(0, j);
	
	       }
	
	       int k = image_in_file.indexOf(",");
	
	       if (k > 0) {
	           image = image_in_file.substring(k + 1);
	
	       }
	
	       if (fileType.equalsIgnoreCase("image/jpeg")) {
	           extension = "jpg";
	       }
	       if (fileType.equalsIgnoreCase("image/png")) {
	           extension = "png";
	       }
	       if (fileType.equalsIgnoreCase("image/gif")) {
	           extension = "gif";
	       }
	       byte[] imageByteArray = decodeImage(image);
	
	       Calendar calendar = Calendar.getInstance();
	       long milis = calendar.getTimeInMillis();
	       datetime = Long.toString(milis);
	       imgnm = datetime;
	
	       String path = this.getClass().getClassLoader().getResource("").getPath();
	       String fullPath = URLDecoder.decode(path, "UTF-8");
	       String[] pathArr = fullPath.split("/WEB-INF/classes/");
	       fullPath = pathArr[0];
	       String reponsePath = "";
	       reponsePath = new File(fullPath).getPath();

	       String str = reponsePath.substring(0, reponsePath.length() -11);
	       
	      /*  String str = reponsePath.substring(0, reponsePath.length() -18);*/
	       
	       reponsePath = String.valueOf(str) + "timages/";
	       File outDir = new File(reponsePath);
		    outDir.mkdirs();
	       FileOutputStream imageOutFile = new FileOutputStream(reponsePath + imgnm+ "." + extension);
	       imageOutFile.write(imageByteArray);
	
	       imageOutFile.close();
	       image=imgnm+"."+extension;
	       }
	       else if(request.getParameter("edit_img_url")!=null)
	       {	
	    	   
	    	   image=request.getParameter("edit_img_url");
	       }
		
		String tours_id=request.getParameter("tours_id");
		String tours_name=request.getParameter("tours_name");
		String tours_desc=request.getParameter("tours_desc");	
		String tours_price=request.getParameter("tours_price");	
		String tours_days=request.getParameter("tours_days");
		String tours_nights=request.getParameter("tours_nights");
	    String tours_route=request.getParameter("tours_route");
	    String tours_type=request.getParameter("tours_type");
		String tours_status=request.getParameter("tours_status");
		
		
		ToursBean tb=new ToursBean();
		
		tb.setTours_img(image);
		tb.setTours_name(tours_name);
		tb.setTours_desc(tours_desc);
		tb.setTours_price(tours_price);
		tb.setTours_days(tours_days);
		tb.setTours_nights(tours_nights);
		tb.setTours_route(tours_route);
		tb.setTours_type(tours_type);

		if(tours_id.isEmpty())
		{
			new Controller().saveTours(tb);
		}
		else 
		{
			tb.setTours_id(Integer.parseInt(tours_id));
			new Controller().updateTours(tb);
		}
		
		response.sendRedirect("tours?tact=manageTours");
	}
	public static byte[] decodeImage(String imageDataString) 
    {
        return Base64.decodeBase64(imageDataString);
    }

}

