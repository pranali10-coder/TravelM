package com.ac.travel.servlet;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ac.travel.util.Constant;



/**
 * Servlet implementation class FetchGallery
 */
@WebServlet("/fetchGallery")
public class FetchGallery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FetchGallery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String type;
	        String image;
	        block34 : {
	            type = "addv";
	            image = "noimage.gif";
	            if (request.getParameter("type") != null && !request.getParameter("type").trim().equals("")) {
	                type = request.getParameter("type");
	            }
	            if (request.getParameter("image") != null && !request.getParameter("image").trim().equals("")) {
	                image = request.getParameter("image");
	            }
	            if (type.equals("QRCode")) {
	                FileInputStream fin;
	                block35 : {
	                    String imagePath = String.valueOf(Constant.QRCODES) + image;
	                    ServletOutputStream out = response.getOutputStream();
	                    File f = new File(imagePath);
	                    if (!f.exists()) {
	                        imagePath = String.valueOf(Constant.QRCODES) + "noimage.gif";
	                    }
	                    fin = null;
	                    BufferedInputStream fBuf = null;
	                    try {
	                        int bytesRead;
	                        fin = new FileInputStream(imagePath);
	                        fBuf = new BufferedInputStream(fin);
	                        byte[] buf = new byte[2048];
	                        while (-1 != (bytesRead = fBuf.read(buf, 0, buf.length))) {
	                            out.write(buf, 0, bytesRead);
	                        }
	                        if (out != null) {
	                            out.flush();
	                            out.close();
	                        }
	                    }
	                    catch (FileNotFoundException fnfe) {
	                        fnfe.printStackTrace();
	                        if (fBuf != null) {
	                            fBuf.close();
	                        }
	                        if (fin != null) {
	                            fin.close();
	                        }
	                        break block34;
	                    }
	                    catch (Exception e) {
	                        try {
	                            e.printStackTrace();
	                        }
	                        catch (Throwable var12_15) {
	                            throw var12_15;
	                        }
	                        finally {
	                            if (fBuf != null) {
	                                fBuf.close();
	                            }
	                            if (fin != null) {
	                                fin.close();
	                            }
	                        }
	                    }
	                    if (fBuf == null) break block35;
	                    fBuf.close();
	                }
	                if (fin != null) {
	                    fin.close();
	                }
	            }
	        }
	        if (type.equals("UserPhoto")) 
	        {
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
	            String imagePath = String.valueOf(reponsePath) + image;
	            ServletOutputStream out = response.getOutputStream();
	            File f = new File(imagePath);
	            if (!f.exists()) {
	                imagePath = String.valueOf(Constant.POSTPHOTO) + "noimage.gif";
	            }
	            FileInputStream fin = null;
	            BufferedInputStream fBuf = null;
	            try {
	                try {
	                    int bytesRead;
	                    fin = new FileInputStream(imagePath);
	                    fBuf = new BufferedInputStream(fin);
	                    byte[] buf = new byte[2048];
	                    while (-1 != (bytesRead = fBuf.read(buf, 0, buf.length))) {
	                        out.write(buf, 0, bytesRead);
	                    }
	                    if (out != null) {
	                        out.flush();
	                        out.close();
	                    }
	                }
	                catch (FileNotFoundException fnfe) {
	                    fnfe.printStackTrace();
	                    if (fBuf != null) {
	                        fBuf.close();
	                    }
	                    if (fin != null) {
	                        fin.close();
	                    }
	                }
	                catch (Exception e) {
	                    block37 : {
	                        e.printStackTrace();
	                        if (fBuf == null) break block37;
	                        fBuf.close();
	                    }
	                    if (fin != null) {
	                        fin.close();
	                    }
	                }
	            }
	            finally 
	            {
	                if (fBuf != null) {
	                    fBuf.close();
	                }
	                if (fin != null) {
	                    fin.close();
	                }
	            }
	        }
	    	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
