package com.ac.travel.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {

	SimpleDateFormat df=new SimpleDateFormat("dd-MM-yyyy");
	
	
	SimpleDateFormat dfdb=new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat dpars=new SimpleDateFormat("yyyy-MM-dd");
	
	public String convertClientDate(String dt)
	{
		String cdate = null;
		try {
			cdate=df.format( dpars.parse(dt));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cdate;
		
	}
	
	
	public String convertDatabaseDate(String dt)
	{
		String cdate = null;
		try {
			cdate=dpars.format(df.parse(dt));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cdate;
		
	}
	
	
	
	public String todayDate()
	{
		
         Date dates = new Date();
       		  SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
        
		return sdf.format(dates);
		
	}
	
	
	
}
