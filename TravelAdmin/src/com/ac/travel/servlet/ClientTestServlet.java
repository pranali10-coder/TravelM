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

import com.ac.travel.bean.ClientTestoBean;
import com.ac.travel.bean.GalleryBean;
import com.ac.travel.controller.Controller;
import com.ac.travel.dao.ClientTestoDao;
import com.ac.travel.dao.GalleryDao;

/**
 * Servlet implementation class ClientTestServlet
 */
@WebServlet("/clienttesto")
public class ClientTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 ClientTestoBean clienttestobean=new ClientTestoBean();
	 ClientTestoDao  clienttestodao=new ClientTestoDao();
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
    public ClientTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String action=request.getParameter("cact");
		
	    if (action.equalsIgnoreCase("manageTesto")) 
		{
			List<ClientTestoBean>ctlist=new Controller().getClientTestoList(1);
			request.setAttribute("ctlist", ctlist);
			
			List<ClientTestoBean>ctlist1=new Controller().getClientTestoList(0);
			request.setAttribute("ctlist1", ctlist1);
			
			request.getRequestDispatcher("listclienttest.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("deleteTesto")) 
		{
			String client_status=request.getParameter("client_status");
			String client_id=request.getParameter("client_id");
			new Controller().deleteTesto(client_id,client_status);
			response.sendRedirect("clienttesto?cact=manageTesto");
		}
		else if (action.equalsIgnoreCase("addTesto"))
		{		
			request.getRequestDispatcher("addclienttest.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("editTesto")) 
		{
			String client_id=request.getParameter("client_id");
			ClientTestoBean ctb=new Controller().getTestoListById(client_id);
			request.setAttribute("ctb",ctb);
			request.getRequestDispatcher("addclienttest.jsp").forward(request, response);
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
	       
	       /* String str = reponsePath.substring(0, reponsePath.length() -18);*/
	       
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
		String client_id=request.getParameter("client_id");
		String client_name=request.getParameter("client_name");
		String client_designation=request.getParameter("client_designation");
		String client_rate=request.getParameter("rate");
		String client_description=request.getParameter("client_description");
		String client_status=request.getParameter("client_status");
		
		
		ClientTestoBean ctb=new ClientTestoBean();
		
		ctb.setClient_img(image);
		ctb.setClient_status(client_status);
		ctb.setClient_name(client_name);
		ctb.setClient_description(client_description);
		ctb.setClient_designation(client_designation);
		ctb.setClient_rate(client_rate);
		
		
		if(client_id.isEmpty())
		{
			new Controller().saveClientTesto(ctb);
		}
		else 
		{
			ctb.setClient_id(Integer.parseInt(client_id));
			new Controller().updateClientTesto(ctb);
		}
		
		response.sendRedirect("clienttesto?cact=manageTesto");
	}
	public static byte[] decodeImage(String imageDataString) 
    {
        return Base64.decodeBase64(imageDataString);
    }

}
