package com.ac.travel.controller;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.ac.travel.bean.ClientTestoBean;
import com.ac.travel.bean.ContactBean;
import com.ac.travel.bean.EnquiryBean;
import com.ac.travel.bean.GalleryBean;
import com.ac.travel.bean.GalleryVideoBean;
import com.ac.travel.bean.SliderBean;
import com.ac.travel.bean.ToursBean;
import com.ac.travel.connection.ManageConnection;
import com.ac.travel.dao.ClientTestoDao;
import com.ac.travel.dao.ContactDao;
import com.ac.travel.dao.EnquiryDao;
import com.ac.travel.dao.GalleryDao;
import com.ac.travel.dao.GalleryVideoDao;
import com.ac.travel.dao.SliderDao;
import com.ac.travel.dao.ToursDao;

public class Controller {


	public List<GalleryBean> getGalleryList(int status) {
		// TODO Auto-generated method stub
		List<GalleryBean>glist=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			glist=new GalleryDao().getGalleryList(con,status);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return glist;
	}
	
	public List<ToursBean> getToursList() {
		// TODO Auto-generated method stub
		List<ToursBean>tlist=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			tlist=new ToursDao().getToursList(con);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return tlist;
	}

	public List<ToursBean> getToursoutofmahaList() {
		// TODO Auto-generated method stub
		List<ToursBean>tlist2=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			tlist2=new ToursDao().getToursoutofmahaList(con);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return tlist2;
	}

	public List<ToursBean> getToursoutofindiaList() {
		// TODO Auto-generated method stub
		List<ToursBean>tlist3=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			tlist3=new ToursDao().getToursoutofindiaList(con);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return tlist3;
	}

	public ToursBean getToursbyId(int tours_id) {
		// TODO Auto-generated method stub
		ToursBean tbn=new ToursBean();
		try (Connection con=ManageConnection.getConnection()){
			tbn=new ToursDao().getToursbyId(con,tours_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return tbn;
	}
	public List<GalleryVideoBean> getGalleryVideoList(int status) {
		// TODO Auto-generated method stub
		List<GalleryVideoBean>glist=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			glist=new GalleryVideoDao().getGalleryVideoList(con,status);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return glist;
	}
	
	public List<SliderBean> getSliderList() {
		// TODO Auto-generated method stub
		List<SliderBean>slist=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			slist=new SliderDao().getSliderList(con);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return slist;
	}
	
	public List<ClientTestoBean> getClientTestoList() {
		// TODO Auto-generated method stub
		List<ClientTestoBean>ctlist=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			ctlist=new ClientTestoDao().getClientTestoList(con);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ctlist;
	}
	

	public int getEnquiry(EnquiryBean enbean) {
		// TODO Auto-generated method stub
		int res=0;
		// TODO Auto-generated method stub
				try(Connection con=ManageConnection.getConnection())
				{				
		             //create a Dao object and method. 
					EnquiryDao edao=new EnquiryDao();
					res=edao.UserEnquiryRegs(enbean,con);
				}
				catch(Exception e)
				{
				  e.printStackTrace();	
				}
				return res;
		
	}
		
	public int getContact(ContactBean conbean) {
		// TODO Auto-generated method stub
		int res=0;
		// TODO Auto-generated method stub
				try(Connection con=ManageConnection.getConnection())
				{				
		             //create a Dao object and method. 
					ContactDao contdao=new ContactDao();
					res=contdao.UserContactRegs(conbean,con);
				}
				catch(Exception e)
				{
				  e.printStackTrace();	
				}
				return res;
		
	}
		
	
}
