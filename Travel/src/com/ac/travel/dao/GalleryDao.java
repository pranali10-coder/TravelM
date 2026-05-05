package com.ac.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ac.travel.bean.GalleryBean;




public class GalleryDao 
{
	
	public List<GalleryBean> getGalleryList(Connection con, int status) {
		// TODO Auto-generated method stub
		List<GalleryBean>gList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_gallery_master` WHERE `gallery_status`=? order by gallery_name")){
			pst.setInt(1,status);
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					GalleryBean gb=new GalleryBean();
					gb.setGallery_id(rs.getInt("gallery_id"));
					gb.setGallery_name(rs.getString("gallery_name"));
					gb.setGallery_img(rs.getString("gallery_img"));
					gb.setGallery_status(rs.getString("gallery_status"));
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

	public GalleryBean getGalleryListById(Connection con,String  gallery_id) {
		// TODO Auto-generated method stub
		GalleryBean gb=new GalleryBean();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_gallery_master` WHERE `gallery_status`=? and gallery_id=?")){
			pst.setInt(1,1);
			pst.setString(2,gallery_id);
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					
					gb.setGallery_id(rs.getInt("gallery_id"));
					gb.setGallery_name(rs.getString("gallery_name"));
					gb.setGallery_img(rs.getString("gallery_img"));
					gb.setGallery_status(rs.getString("gallery_status"));
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
		return gb;
	}

	public void saveGallery(GalleryBean cb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("INSERT INTO `tbl_gallery_master`(`gallery_id`, `gallery_name`, `gallery_img`, `gallery_status`) VALUES (?,?,?,?)")){
			pst.setInt(1,0);
			pst.setString(2,cb.getGallery_name());
			pst.setString(3,cb.getGallery_img());
			pst.setString(4,"1");
			
			pst.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
		 if (con != null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	public void deleteGallery(String gallery_id, String gallery_status,Connection con) {
		// TODO Auto-generated method stub
		int sta=0;
		if (gallery_status.equalsIgnoreCase("0")) {
			sta=1;
		}
		try (PreparedStatement pst=con.prepareStatement("update tbl_gallery_master set gallery_status=? where gallery_id=?")){
			pst.setInt(1,sta);
			pst.setString(2,gallery_id);			
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		finally
		{
		 if (con != null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}	
}
