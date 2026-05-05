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
	
	public List<SliderBean> getSliderList(Connection con) {
		// TODO Auto-generated method stub
		List<SliderBean>sList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_slider_master`  WHERE `slider_status`=?")){
			pst.setString(1,"1");
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

	
}
