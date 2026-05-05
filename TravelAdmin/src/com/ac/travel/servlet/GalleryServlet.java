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

import com.ac.travel.bean.GalleryBean;
import com.ac.travel.controller.Controller;
import com.ac.travel.dao.GalleryDao;

/**
 * Servlet implementation class CatagoryServlet
 */
@WebServlet("/gallery")
public class GalleryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 GalleryBean gallerybean=new GalleryBean();
	 GalleryDao  gallerydao=new GalleryDao();
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
    public GalleryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String action=request.getParameter("gact");
		
	    if (action.equalsIgnoreCase("manageGallery")) 
		{
			List<GalleryBean>glist=new Controller().getGalleryList(1);
			request.setAttribute("glist", glist);
			
			List<GalleryBean>glist1=new Controller().getGalleryList(0);
			request.setAttribute("glist1", glist1);
			
			request.getRequestDispatcher("listgallery.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("deleteGallery")) 
		{
			String gallery_status=request.getParameter("gallery_status");
			String gallery_id=request.getParameter("gallery_id");
			new Controller().deleteGallery(gallery_id,gallery_status);
			response.sendRedirect("gallery?gact=manageGallery");
		}
		else if (action.equalsIgnoreCase("addGallery"))
		{		
			request.getRequestDispatcher("addgallery.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("editGallery")) 
		{
			String gallery_id=request.getParameter("gallery_id");
			GalleryBean gb=new Controller().getGalleryListById(gallery_id);
			request.setAttribute("gb",gb);
			request.getRequestDispatcher("addgallery.jsp").forward(request, response);
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

	      /* String str = reponsePath.substring(0, reponsePath.length() -23);*/
	       
	        String str = reponsePath.substring(0, reponsePath.length() -11);
	       
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
		String gallery_id=request.getParameter("gallery_id");
		String gallery_name=request.getParameter("gallery_name"); 
		String gallery_description=request.getParameter("gallery_description");
		String gallery_status=request.getParameter("gallery_status");
		
		
		GalleryBean gb=new GalleryBean();
		
		gb.setGallery_img(image);
		gb.setGallery_status(gallery_status);
		gb.setGallery_name(gallery_name);
		gb.setGallery_description(gallery_description);
		if(gallery_id.isEmpty())
		{
			new Controller().saveGallery(gb);
		}
		else 
		{
			gb.setGallery_id(Integer.parseInt(gallery_id));
			new Controller().updateGallery(gb);
		}
		
		response.sendRedirect("gallery?gact=manageGallery");
	}
	public static byte[] decodeImage(String imageDataString) 
    {
        return Base64.decodeBase64(imageDataString);
    }

}
