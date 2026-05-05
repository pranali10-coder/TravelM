package com.ac.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ac.travel.bean.ContactBean;

public class ContactDao {

	public List<ContactBean> getContactList(Connection con) {
		// TODO Auto-generated method stub
		List<ContactBean>cList=new ArrayList<>();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_contact_master`"))
		{
			try (ResultSet rs=pst.executeQuery()){
				while (rs.next()) {
					ContactBean bb=new ContactBean();
					
					bb.setUserid(rs.getString("userid"));
					bb.setUsername(rs.getString("username"));
					bb.setEmail(rs.getString("email"));
					bb.setPhone(rs.getString("phone"));
					bb.setMessage(rs.getString("message"));
					bb.setStatus(rs.getString("status"));
					cList.add(bb);
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

	public void deleteContact(String userid, String status, Connection con) {
		// TODO Auto-generated method stub
		int sta=0;
		if (status.equalsIgnoreCase("0")) {
			sta=1;
		}
		try (PreparedStatement pst=con.prepareStatement("update tbl_contact_master set status=? where userid=?")){
			pst.setInt(1,sta);
			pst.setString(2,userid);			
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
