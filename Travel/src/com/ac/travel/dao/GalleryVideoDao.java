package com.ac.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ac.travel.bean.GalleryVideoBean;




public class GalleryVideoDao 
{

	public List<GalleryVideoBean> getGalleryVideoList(Connection con, int status) {
		// TODO Auto-generated method stub
		List<GalleryVideoBean>gList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_galleryvideo_master` WHERE `galleryvideo_status`=? order by galleryvideo_name")){
			pst.setInt(1,status);
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					GalleryVideoBean gb=new GalleryVideoBean();
					gb.setGalleryvideo_id(rs.getInt("galleryvideo_id"));
					gb.setGalleryvideo_name(rs.getString("galleryvideo_name"));
					gb.setGalleryVideo_link(rs.getString("galleryvideo_link"));
					gb.setGalleryvideo_status(rs.getString("galleryvideo_status"));
					gList.add(gb);
				}
			} 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
		 if (con != null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return gList;
	}

	
}
