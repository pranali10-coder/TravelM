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
import com.ac.travel.bean.SliderBean;
import com.ac.travel.controller.Controller;
import com.ac.travel.dao.GalleryDao;
import com.ac.travel.dao.SliderDao;

/**
 * Servlet implementation class CatagoryServlet
 */
@WebServlet("/slider")
public class SliderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 SliderBean sliderbean=new SliderBean();
	 SliderDao  sliderdao=new SliderDao();
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
    public SliderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String action=request.getParameter("sact");
		
	    if (action.equalsIgnoreCase("manageSlider")) 
		{
			List<SliderBean>slist=new Controller().getSliderList(1);
			request.setAttribute("slist", slist);
			
			List<SliderBean>slist1=new Controller().getSliderList(0);
			request.setAttribute("slist1", slist1);
			
			request.getRequestDispatcher("listslider.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("deleteSlider")) 
		{
			String slider_status=request.getParameter("slider_status");
			String slider_id=request.getParameter("slider_id");
			new Controller().deleteSlider(slider_id,slider_status);
			response.sendRedirect("slider?sact=manageSlider");
		}
		else if (action.equalsIgnoreCase("addSlider"))
		{		
			request.getRequestDispatcher("addslider.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("editSlider")) 
		{
			String slider_id=request.getParameter("slider_id");
			SliderBean sb=new Controller().getSliderListById(slider_id);
			request.setAttribute("sb",sb);
			request.getRequestDispatcher("addslider.jsp").forward(request, response);
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
		
		if(request.getParameter("url")==null || request.getParameter("url")=="")
        {
			image=request.getParameter("edit_img_url");
        }
        else{
		   String imgnm;
	 		//code for imge store
	 	       HttpSession session = request.getSession();
	 	       image_in_file = request.getParameter("url");
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
	 	    /*   String str = reponsePath.substring(0, reponsePath.length() -18);*/
	 	       reponsePath = String.valueOf(str) + "timages/";
	 	       File outDir = new File(reponsePath);
	 		    outDir.mkdirs();
	 	       FileOutputStream imageOutFile = new FileOutputStream(reponsePath + imgnm+ "." + extension);
	 	       imageOutFile.write(imageByteArray);
	 	
	 	       imageOutFile.close();
	 	       image=imgnm+"."+extension;
        }
		
		String slider_id=request.getParameter("slider_id");
		String myparam = request.getParameter("myparamname");
		String slider_name=request.getParameter("slider_name");
		 if (slider_name != null)
			 slider_name = new String(slider_name.getBytes("ISO-8859-1"),"UTF8");
		String slider_status=request.getParameter("slider_status");
		
		
		SliderBean sb=new SliderBean();
		
		sb.setSlider_img(image);
		sb.setSlider_name(slider_name);
		sb.setSlider_status(slider_status);
		if(slider_id.isEmpty())
		{
			new Controller().saveSlider(sb);
		}
		else 
		{
			sb.setSlider_id(Integer.parseInt(slider_id));
			new Controller().updateSlider(sb);
		}
		
		response.sendRedirect("slider?sact=manageSlider");
	}
	public static byte[] decodeImage(String imageDataString) 
    {
        return Base64.decodeBase64(imageDataString);
    }

}
