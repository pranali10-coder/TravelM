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
	public void updateGalleryVideo(GalleryVideoBean gb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `tbl_galleryvideo_master` set `galleryvideo_name`=?, `galleryvideo_link`=?  where galleryvideo_id=?")){
			pst.setString(1,gb.getGalleryvideo_name());
			pst.setString(2,gb.getGalleryVideo_link());
			pst.setInt(3,gb.getGalleryvideo_id());
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

	public GalleryVideoBean getGalleryVideoListById(Connection con,String  galleryvideo_id) {
		// TODO Auto-generated method stub
		GalleryVideoBean gb=new GalleryVideoBean();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_galleryvideo_master` WHERE `galleryvideo_status`=? and galleryvideo_id=?")){
			pst.setInt(1,1);
			pst.setString(2,galleryvideo_id);
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					
					gb.setGalleryvideo_id(rs.getInt("galleryvideo_id"));
					gb.setGalleryvideo_name(rs.getString("galleryvideo_name"));
					gb.setGalleryVideo_link(rs.getString("galleryVideo_link"));
					gb.setGalleryvideo_status(rs.getString("galleryvideo_status"));
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

	public void saveGalleryVideo(GalleryVideoBean cb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("INSERT INTO `tbl_galleryvideo_master`(`galleryvideo_id`, `galleryvideo_name`, `galleryvideo_link`, `galleryvideo_status`) VALUES (?,?,?,?)")){
			pst.setInt(1,0);
			pst.setString(2,cb.getGalleryvideo_name());
			pst.setString(3,cb.getGalleryVideo_link());
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
	
	public void deleteGalleryVideo(String galleryvideo_id, String galleryvideo_status,Connection con) {
		// TODO Auto-generated method stub
		int sta=0;
		if (galleryvideo_status.equalsIgnoreCase("0")) {
			sta=1;
		}
		try (PreparedStatement pst=con.prepareStatement("update tbl_galleryvideo_master set galleryvideo_status=? where galleryvideo_id=?")){
			pst.setInt(1,sta);
			pst.setString(2,galleryvideo_id);			
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
