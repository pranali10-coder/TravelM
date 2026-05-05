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
	public void updateClientTesto(ClientTestoBean ctb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `tbl_clienttesto_master` set `client_name`=?,`client_description`=?,`client_img`=?,`client_designation`=?,`client_rate`=?  where client_id=?")){
			pst.setString(1,ctb.getClient_name());
			pst.setString(2,ctb.getClient_description());
			pst.setString(3,ctb.getClient_img());
			pst.setString(4,ctb.getClient_designation());
			pst.setString(5,ctb.getClient_rate());
			pst.setInt(6,ctb.getClient_id());
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

	public List<ClientTestoBean> getClientTestoList(Connection con, int status) {
		// TODO Auto-generated method stub
		List<ClientTestoBean>cList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_clienttesto_master` WHERE `client_status`=? order by client_name")){
			pst.setInt(1,status);
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

	public ClientTestoBean getClientTestoListById(Connection con,String  client_id) {
		// TODO Auto-generated method stub
		ClientTestoBean ctb=new ClientTestoBean();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_clienttesto_master` WHERE `client_status`=? and client_id=?")){
			pst.setInt(1,1);
			pst.setString(2,client_id);
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					
					ctb.setClient_id(rs.getInt("client_id"));
					ctb.setClient_name(rs.getString("client_name"));
					ctb.setClient_description(rs.getString("client_description"));
					ctb.setClient_img(rs.getString("client_img"));
					ctb.setClient_designation(rs.getString("client_designation"));
					ctb.setClient_rate(rs.getString("client_rate"));
					ctb.setClient_status(rs.getString("client_status"));
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
		return ctb;
	}

	public void saveClientTesto(ClientTestoBean ctb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("INSERT INTO `tbl_clienttesto_master`(`client_id`, `client_name`, `client_description`, `client_img` ,`client_designation`,`client_rate`,`client_status`) VALUES (?,?,?,?,?,?,?)")){
			pst.setInt(1,0);
			pst.setString(2,ctb.getClient_name());
			pst.setString(3,ctb.getClient_description());
			pst.setString(4,ctb.getClient_img());
			pst.setString(5,ctb.getClient_designation());
			pst.setString(6,ctb.getClient_rate());
			pst.setString(7,"1");
			
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
	
	public void deleteTesto(String client_id, String client_status,Connection con) {
		// TODO Auto-generated method stub
		int sta=0;
		if (client_status.equalsIgnoreCase("0")) {
			sta=1;
		}
		try (PreparedStatement pst=con.prepareStatement("update tbl_clienttesto_master set client_status=? where client_id=?")){
			pst.setInt(1,sta);
			pst.setString(2,client_id);			
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
