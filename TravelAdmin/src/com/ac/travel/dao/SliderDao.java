package com.ac.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ac.travel.bean.SliderBean;


public class SliderDao 
{
	public void updateSlider(SliderBean sb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `tbl_slider_master` set `slider_name`=?, `slider_img`=?  where slider_id=? ")){
			pst.setString(1,sb.getSlider_name());
			pst.setString(2,sb.getSlider_img());
			pst.setInt(3,sb.getSlider_id());
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

	public List<SliderBean> getSliderList(Connection con, int status) {
		// TODO Auto-generated method stub
		List<SliderBean>sList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_slider_master` WHERE `slider_status`=? order by slider_name")){
			pst.setInt(1,status);
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					SliderBean sb=new SliderBean();
					sb.setSlider_id(rs.getInt("slider_id"));
					sb.setSlider_name(rs.getString("slider_name"));
					sb.setSlider_img(rs.getString("slider_img"));
					sb.setSlider_status(rs.getString("slider_status"));
					sList.add(sb);
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
		return sList;
	}

	public SliderBean getSliderListById(Connection con,String  slider_id) {
		// TODO Auto-generated method stub
		SliderBean sb=new SliderBean();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_slider_master` WHERE `slider_status`=? and slider_id=?")){
			pst.setInt(1,1);
			pst.setString(2,slider_id);
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					
					sb.setSlider_id(rs.getInt("slider_id"));
					sb.setSlider_name(rs.getString("slider_name"));
					sb.setSlider_img(rs.getString("slider_img"));
					sb.setSlider_status(rs.getString("slider_status"));
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
		return sb;
	}

	public void saveSlider(SliderBean sb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("INSERT INTO `tbl_slider_master`(`slider_id`, `slider_name`, `slider_img`, `slider_status`) VALUES (?,?,?,?)")){
			pst.setInt(1,0);
			pst.setString(2,sb.getSlider_name());
			pst.setString(3,sb.getSlider_img());
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
	
	public void deleteSlider(String slider_id, String slider_status,Connection con) {
		// TODO Auto-generated method stub
		int sta=0;
		if (slider_status.equalsIgnoreCase("0")) {
			sta=1;
		}
		try (PreparedStatement pst=con.prepareStatement("update tbl_slider_master set slider_status=? where slider_id=?")){
			pst.setInt(1,sta);
			pst.setString(2,slider_id);			
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
