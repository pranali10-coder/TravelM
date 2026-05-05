package com.ac.travel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ac.travel.bean.GalleryBean;
import com.ac.travel.bean.GalleryVideoBean;
import com.ac.travel.controller.Controller;
import com.ac.travel.dao.GalleryDao;

/**
 * Servlet implementation class GalleryServlet
 */
@WebServlet("/galleryVideo")
public class GalleryVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 GalleryBean gallerybean=new GalleryBean();
	 GalleryDao  gallerydao=new GalleryDao();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryVideoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String action=request.getParameter("gact");
		
	    if (action.equalsIgnoreCase("manageGalleryVideo")) 
		{
			List<GalleryVideoBean>gvlist=new Controller().getGalleryVideoList(1);
			request.setAttribute("gvlist", gvlist);
			
			List<GalleryVideoBean>gvlist1=new Controller().getGalleryVideoList(0);
			request.setAttribute("gvlist1", gvlist1);
			
			request.getRequestDispatcher("listgalleryvideo.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("deleteGalleryVideo")) 
		{
			String galleryvideo_status=request.getParameter("galleryvideo_status");
			String galleryvideo_id=request.getParameter("galleryvideo_id");
			new Controller().deleteGalleryVideo(galleryvideo_id,galleryvideo_status);
			response.sendRedirect("galleryVideo?gact=manageGalleryVideo");
		}
		else if (action.equalsIgnoreCase("addGalleryVideo"))
		{		
			request.getRequestDispatcher("addgalleryvideo.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("editGalleryVideo")) 
		{
			String galleryvideo_id=request.getParameter("galleryvideo_id");
			GalleryVideoBean gb=new Controller().getGalleryVideoListById(galleryvideo_id);
			request.setAttribute("gb",gb);
			request.getRequestDispatcher("addgalleryvideo.jsp").forward(request, response);
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
		
		String galleryvideo_id=request.getParameter("galleryvideo_id");
		String myparam = request.getParameter("myparamname");
		String galleryVideo_name=request.getParameter("galleryVideo_name");
		 if (galleryVideo_name != null)
			 galleryVideo_name = new String(galleryVideo_name.getBytes("ISO-8859-1"),"UTF8"); 
		String galleryVideo_link=request.getParameter("galleryVideo_link");
		String galleryvideo_status=request.getParameter("galleryvideo_status");
		
		
		GalleryVideoBean gb=new GalleryVideoBean();
		gb.setGalleryvideo_status(galleryvideo_status);
		gb.setGalleryvideo_name(galleryVideo_name);
		gb.setGalleryVideo_link(galleryVideo_link);
		if(galleryvideo_id.isEmpty())
		{
			new Controller().saveGalleryVideo(gb);
		}
		else 
		{
			gb.setGalleryvideo_id(Integer.parseInt(galleryvideo_id));
			new Controller().updateGalleryVideo(gb);
		}
		
		response.sendRedirect("galleryVideo?gact=manageGalleryVideo");
	}
}
