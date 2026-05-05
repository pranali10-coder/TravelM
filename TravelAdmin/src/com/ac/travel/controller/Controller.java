package com.ac.travel.controller;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.ac.travel.bean.ClientTestoBean;
import com.ac.travel.bean.ContactBean;
import com.ac.travel.bean.GalleryBean;
import com.ac.travel.bean.GalleryVideoBean;
import com.ac.travel.bean.LoginBean;
import com.ac.travel.bean.SliderBean;
import com.ac.travel.bean.ToursBean;
import com.ac.travel.connection.ManageConnection;
import com.ac.travel.dao.AdminLoginDao;
import com.ac.travel.dao.ClientTestoDao;
import com.ac.travel.dao.ContactDao;
import com.ac.travel.dao.GalleryDao;
import com.ac.travel.dao.GalleryVideoDao;
import com.ac.travel.dao.SliderDao;
import com.ac.travel.dao.ToursDao;

public class Controller {

	

	public LoginBean getUserByLoginDetails(String username, String password) {
		// TODO Auto-generated method stub
		LoginBean log=new LoginBean();
		try (Connection con=ManageConnection.getConnection()){
			log=new AdminLoginDao().getUserByLoginDetails(username,password,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return log;
	}


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

	public GalleryBean getGalleryListById(String gallery_id) {
		// TODO Auto-generated method stub
		GalleryBean glist1=new GalleryBean();
		try (Connection con=ManageConnection.getConnection()){
			glist1=new GalleryDao().getGalleryListById(con,gallery_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return glist1;
	}

	public void saveGallery(GalleryBean gb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new GalleryDao().saveGallery(gb,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void updateGallery(GalleryBean gb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new GalleryDao().updateGallery(gb,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void deleteGallery(String gallery_id, String gallery_status) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new GalleryDao().deleteGallery(gallery_id,gallery_status,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	


	public List<ContactBean> getContactList() {
		// TODO Auto-generated method stub
		List<ContactBean>clist=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			clist=new ContactDao().getContactList(con);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return clist;
	}

	public void deleteContact(String userid, String status) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new ContactDao().deleteContact(userid,status,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	public List<ToursBean> getToursList(int status) {
		// TODO Auto-generated method stub
		List<ToursBean>tlist=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			tlist=new ToursDao().getToursList(con,status);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return tlist;
	}

	public ToursBean getToursListById(String tours_id) {
		// TODO Auto-generated method stub
		ToursBean tlist1=new ToursBean();
		try (Connection con=ManageConnection.getConnection()){
			tlist1=new ToursDao().getToursListById(con,tours_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return tlist1;
	}

	public void saveTours(ToursBean tb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new ToursDao().saveTours(tb,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void updateTours(ToursBean tb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new ToursDao().updateTours(tb,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void deleteTours(String tours_id, String tours_status) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new ToursDao().deleteTours(tours_id,tours_status,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
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

	public GalleryVideoBean getGalleryVideoListById(String galleryvideo_id) {
		// TODO Auto-generated method stub
		GalleryVideoBean glist1=new GalleryVideoBean();
		try (Connection con=ManageConnection.getConnection()){
			glist1=new GalleryVideoDao().getGalleryVideoListById(con,galleryvideo_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return glist1;
	}

	public void saveGalleryVideo(GalleryVideoBean gb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new GalleryVideoDao().saveGalleryVideo(gb,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void updateGalleryVideo(GalleryVideoBean gb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new GalleryVideoDao().updateGalleryVideo(gb,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void deleteGalleryVideo(String galleryvideo_id, String galleryvideo_status) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new GalleryVideoDao().deleteGalleryVideo(galleryvideo_id,galleryvideo_status,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	
	

	
	public List<SliderBean> getSliderList(int status) {
		// TODO Auto-generated method stub
		List<SliderBean>slist=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			slist=new SliderDao().getSliderList(con,status);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return slist;
	}

	public SliderBean getSliderListById(String slider_id) {
		// TODO Auto-generated method stub
		SliderBean slist1=new SliderBean();
		try (Connection con=ManageConnection.getConnection()){
			slist1=new SliderDao().getSliderListById(con,slider_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return slist1;
	}

	public void saveSlider(SliderBean sb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new SliderDao().saveSlider(sb,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void updateSlider(SliderBean sb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new SliderDao().updateSlider(sb,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void deleteSlider(String slider_id, String slider_status) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new SliderDao().deleteSlider(slider_id,slider_status,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
		

	public List<ClientTestoBean> getClientTestoList(int status) {
		// TODO Auto-generated method stub
		List<ClientTestoBean>ctlist=new ArrayList<>();
		try (Connection con=ManageConnection.getConnection()){
			ctlist=new ClientTestoDao().getClientTestoList(con,status);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ctlist;
	}

	public ClientTestoBean getTestoListById(String client_id) {
		// TODO Auto-generated method stub
		ClientTestoBean ctlist1=new ClientTestoBean();
		try (Connection con=ManageConnection.getConnection()){
			ctlist1=new ClientTestoDao().getClientTestoListById(con,client_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ctlist1;
	}

	public void saveClientTesto(ClientTestoBean ctb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new ClientTestoDao().saveClientTesto(ctb,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void updateClientTesto(ClientTestoBean ctb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new ClientTestoDao().updateClientTesto(ctb,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void deleteTesto(String client_id, String client_status) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new ClientTestoDao().deleteTesto(client_id,client_status,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
