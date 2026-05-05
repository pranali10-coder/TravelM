package com.ac.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ac.travel.bean.ContactBean;


public class ContactDao {

	public int UserContactRegs(ContactBean conbean, Connection con) {
		int res=0;
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("INSERT INTO `tbl_contact_master`(`userid`, `username`, `email`, `phone`, `message`, `status`) VALUES (?,?,?,?,?,?)")){
			pst.setInt(1,0);
			pst.setString(2,conbean.getUsername());
			pst.setString(3,conbean.getEmail());
			pst.setString(4,conbean.getPhone());
			pst.setString(5,conbean.getMessage());
			pst.setString(6,"1");
			res=pst.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
		 if (con != null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return res;
	}

	
	

}
