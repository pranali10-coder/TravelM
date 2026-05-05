package com.ac.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ac.travel.bean.ClientTestoBean;






public class ClientTestoDao 
{
	
	public List<ClientTestoBean> getClientTestoList(Connection con) {
		// TODO Auto-generated method stub
		List<ClientTestoBean>cList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_clienttesto_master` WHERE `client_status`=? order by client_name")){
			pst.setString(1,"1");
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					ClientTestoBean ctb=new ClientTestoBean();
					ctb.setClient_id(rs.getInt("client_id"));
					ctb.setClient_name(rs.getString("client_name"));
					ctb.setClient_description(rs.getString("client_description"));
					ctb.setClient_img(rs.getString("client_img"));
					ctb.setClient_designation(rs.getString("client_designation"));
					ctb.setClient_rate(rs.getString("client_rate"));
					ctb.setClient_status(rs.getString("client_status"));
					cList.add(ctb);
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
		return cList;
	}
	
}
