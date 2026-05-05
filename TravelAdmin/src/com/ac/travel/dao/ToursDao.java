package com.ac.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ac.travel.bean.ToursBean;

public class ToursDao {

	
	public void updateTours(ToursBean tb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `tbl_tours_master` set `tours_name`=?,`tours_desc`=?,`tours_price`=?,`tours_img`=?,`tours_days`=?,`tours_nights`=?,`tours_route`=?,`tours_type`=?  where tours_id=?")){
			pst.setString(1,tb.getTours_name());
			pst.setString(2,tb.getTours_desc());
			pst.setString(3,tb.getTours_price());
			pst.setString(4,tb.getTours_img());
			pst.setString(5,tb.getTours_days());
			pst.setString(6,tb.getTours_nights());
			pst.setString(7,tb.getTours_route());
			pst.setString(8,tb.getTours_type());
  			pst.setInt(9,tb.getTours_id());
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

	public List<ToursBean> getToursList(Connection con, int status) {
		// TODO Auto-generated method stub
		List<ToursBean>tList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_tours_master` WHERE `tours_status`=? order by tours_name")){
			pst.setInt(1,status);
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					ToursBean tb=new ToursBean();
					tb.setTours_id(rs.getInt("tours_id"));
					tb.setTours_name(rs.getString("tours_name"));
					tb.setTours_desc(rs.getString("tours_desc"));
					tb.setTours_price(rs.getString("tours_price"));
					tb.setTours_img(rs.getString("tours_img"));
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

	public ToursBean getToursListById(Connection con,String  tours_id) {
		// TODO Auto-generated method stub
		ToursBean tb=new ToursBean();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_tours_master` WHERE `tours_status`=? and tours_id=?")){
			pst.setInt(1,1);
			pst.setString(2,tours_id);
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					
					tb.setTours_id(rs.getInt("tours_id"));
					tb.setTours_name(rs.getString("tours_name"));
					tb.setTours_desc(rs.getString("tours_desc"));
					tb.setTours_price(rs.getString("tours_price"));
					tb.setTours_img(rs.getString("tours_img"));
					tb.setTours_days(rs.getString("tours_days"));
					tb.setTours_nights(rs.getString("tours_nights"));
					tb.setTours_route(rs.getString("tours_route"));
					tb.setTours_type(rs.getString("tours_type"));
					tb.setTours_status(rs.getString("tours_status"));
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
		return tb;
	}

	public void saveTours(ToursBean cb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("INSERT INTO `tbl_tours_master`(`tours_id`, `tours_name`,`tours_desc`,`tours_price`,`tours_img`,`tours_days`,`tours_nights`,`tours_route`,`tours_type`,`tours_status`) VALUES (?,?,?,?,?,?,?,?,?,?)")){
			pst.setInt(1,0);
			pst.setString(2,cb.getTours_name());
			pst.setString(3,cb.getTours_desc());
			pst.setString(4,cb.getTours_price());
			pst.setString(5,cb.getTours_img());
			pst.setString(6,cb.getTours_days());
			pst.setString(7,cb.getTours_nights());
			pst.setString(8,cb.getTours_route());
			pst.setString(9,cb.getTours_type());
			pst.setString(10,"1");
			
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
	
	public void deleteTours(String tours_id, String tours_status,Connection con) {
		// TODO Auto-generated method stub
		int sta=0;
		if (tours_status.equalsIgnoreCase("0")) {
			sta=1;
		}
		try (PreparedStatement pst=con.prepareStatement("update tbl_tours_master set tours_status=? where tours_id=?")){
			pst.setInt(1,sta);
			pst.setString(2,tours_id);			
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
