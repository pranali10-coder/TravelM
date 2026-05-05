package com.ac.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ac.travel.bean.LoginBean;





public class AdminLoginDao
{

	static Date date=new Date();
    static DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    static String today = df.format(date);
    
	/***************************************Login******************************/
	
	public LoginBean getUserByLoginDetails(String username, String password,
			Connection con) {
		// TODO Auto-generated method stub
		LoginBean log=new LoginBean();
		try{
			try(PreparedStatement pst=con.prepareStatement("SELECT * FROM `tbl_login_master` WHERE `username`=? and `password`=?"))
			{
				pst.setString(1,username);
				pst.setString(2, password);
			
				try(ResultSet rs=pst.executeQuery())
				{
					if(rs.next())
					{
						log.setUserid(rs.getString("userid"));
						log.setUsername(rs.getString("username"));	
						log.setPassword(rs.getString("password"));	
					}
					
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
		
		return log;
	}

}

	