package com.ac.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ac.travel.bean.ContactBean;
import com.ac.travel.bean.EnquiryBean;

public class EnquiryDao {

public int UserEnquiryRegs(EnquiryBean enbean, Connection con) {
	int res=0;
	// TODO Auto-generated method stub
	try (PreparedStatement pst=con.prepareStatement("INSERT INTO `tbl_enquiry_master`(`userid`, `fullname`, `email`, `phone`, `message`, `subject`, `status`) VALUES (?,?,?,?,?,?,?)")){
		pst.setInt(1,0);
		pst.setString(2,enbean.getFullname());
		pst.setString(3,enbean.getEmail());
		pst.setString(4,enbean.getPhone());
		pst.setString(5,enbean.getSubject());
		pst.setString(6,enbean.getMessage());
		pst.setString(7,"1");
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
