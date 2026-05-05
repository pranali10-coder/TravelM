package com.ac.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import com.ac.travel.bean.ToursBean;

public class ToursDao {



	public List<ToursBean> getToursList(Connection con) {
		// TODO Auto-generated method stub
		List<ToursBean>tList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_tours_master`  WHERE `tours_status`=? and `tours_type`=?")){
			pst.setString(1,"1");
			pst.setString(2,"1");
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					ToursBean tb=new ToursBean();
					tb.setTours_id(rs.getInt("tours_id"));
					tb.setTours_name(rs.getString("tours_name"));
					tb.setTours_desc(rs.getString("tours_desc"));
					tb.setTours_img(rs.getString("tours_img"));
					tb.setTours_price(rs.getString("tours_price"));
					tb.setTours_days(rs.getString("tours_days"));
					tb.setTours_nights(rs.getString("tours_nights"));
					tb.setTours_route(rs.getString("tours_route"));
					tb.setTours_type(rs.getString("tours_type"));
					tb.setTours_status(rs.getString("tours_status"));
					tList.add(tb);
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
		return tList;
	}

	
	public List<ToursBean> getToursoutofmahaList(Connection con) {
		// TODO Auto-generated method stub
		List<ToursBean>tList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_tours_master`  WHERE `tours_status`=?")){
			pst.setString(1,"1");
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					ToursBean tb=new ToursBean();
					tb.setTours_id(rs.getInt("tours_id"));
					tb.setTours_name(rs.getString("tours_name"));
					tb.setTours_desc(rs.getString("tours_desc"));
					tb.setTours_img(rs.getString("tours_img"));
					tb.setTours_price(rs.getString("tours_price"));
					tb.setTours_days(rs.getString("tours_days"));
					tb.setTours_nights(rs.getString("tours_nights"));
					tb.setTours_route(rs.getString("tours_route"));
					tb.setTours_type(rs.getString("tours_type"));
					tb.setTours_status(rs.getString("tours_status"));
					tList.add(tb);
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
		return tList;
	}

	public List<ToursBean> getToursoutofindiaList(Connection con) {
		// TODO Auto-generated method stub
		List<ToursBean>tList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_tours_master`  WHERE `tours_status`=?")){
			pst.setString(1,"1");
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					ToursBean tb=new ToursBean();
					tb.setTours_id(rs.getInt("tours_id"));
					tb.setTours_name(rs.getString("tours_name"));
					tb.setTours_desc(rs.getString("tours_desc"));
					tb.setTours_img(rs.getString("tours_img"));
					tb.setTours_price(rs.getString("tours_price"));
					tb.setTours_days(rs.getString("tours_days"));
					tb.setTours_nights(rs.getString("tours_nights"));
					tb.setTours_route(rs.getString("tours_route"));
					tb.setTours_type(rs.getString("tours_type"));
					tb.setTours_status(rs.getString("tours_status"));
					tList.add(tb);
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
		return tList;
	}

	public ToursBean getToursbyId(Connection con, int tours_id) {
		// TODO Auto-generated method stub
		ToursBean tbn=new ToursBean();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM tbl_tours_master WHERE tours_status=? and tours_id=?")){
			pst.setInt(1,1);
			pst.setInt(2,tours_id);
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					
					tbn.setTours_id(rs.getInt("tours_id"));
					tbn.setTours_name(rs.getString("tours_name"));
					tbn.setTours_desc(rs.getString("tours_desc"));
					tbn.setTours_img(rs.getString("tours_img"));
					tbn.setTours_price(rs.getString("tours_price"));
					tbn.setTours_days(rs.getString("tours_days"));
					tbn.setTours_nights(rs.getString("tours_nights"));
					tbn.setTours_route(rs.getString("tours_route"));
					tbn.setTours_type(rs.getString("tours_type"));
					tbn.setTours_status(rs.getString("tours_status"));
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
		return tbn;
	}

}
