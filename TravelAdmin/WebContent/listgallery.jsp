<%@page import="com.ac.travel.bean.GalleryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="allcss.jsp"%>	
<title>Gallery List | Travel</title>
</head>
<body>
<%@include file="adminleftmenu.jsp"%>
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="manageAdmin">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Add Gallery</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Edit Gallery</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Gallery List</div>
					<div class="panel-body">
						<div class="col-md-12">			
							<div class="col-md-2">			
								<small>
								<a href="gallery?gact=addGallery"><button class="btn btn-info" type="submit" style="float: right;">Add Gallery </button></a> 
								</small>
						    </div>
								<br><br><br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th>Image Name</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									
									<%ArrayList<GalleryBean> activelist = (ArrayList<GalleryBean>)request.getAttribute("glist"); 
			                         if(activelist==null)
			                         {
			                        	 activelist=new ArrayList<GalleryBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          int i=1;
			                          for(GalleryBean bn :activelist){
			                        	  if(bn.getGallery_status().equalsIgnoreCase("1")) 
				                        	 {
			                        	  %>  
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=bn.getGallery_name() %></td>
											<td class="actions">
												<a href="gallery?gact=editGallery&gallery_id=<%=bn.getGallery_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Gallery Image"></i></a>
											<a href="gallery?gact=deleteGallery&gallery_id=<%=bn.getGallery_id()%>&gallery_status=<%=bn.getGallery_status()%>" class="on-default remove-row"  onclick="return confirm('Do you want to Deactivate gallery?');"><i class="fa fa-trash-o" title="Gallery Deactivate"></i></a>
											</td>
										</tr>
									<%}}%>
									</tbody>
									 <tr><td colspan="10"><hr style="border: 0.9px solid grey;"></td></tr>
									 
									<tbody>
									<%ArrayList<GalleryBean> deactivelist = (ArrayList<GalleryBean>)request.getAttribute("glist1"); 
			                         if(deactivelist==null)
			                         {
			                        	 deactivelist=new ArrayList<GalleryBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          for(GalleryBean bn :deactivelist){
			                        	  if(bn.getGallery_status().equalsIgnoreCase("0")) 
				                        	 {
			                        	  %>  
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=bn.getGallery_name()%></td>
											<td class="actions">
											<a href="gallery?gact=editGallery&gallery_id=<%=bn.getGallery_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Gallery Image"></i></a>
											<a href="gallery?gact=deleteGallery&gallery_id=<%=bn.getGallery_id()%>&gallery_status=<%=bn.getGallery_status()%>" class="on-default remove-row"  onclick="return confirm('Do you want to Activate gallery?');"><i class="fa fa-trash-o" title="Gallery Activate"></i></a>
											</td>
										</tr>
									<%}}%>
									</tbody>
									 
								</table>
							</div>	
						</div>	
					</div>
					</div>
						</div>
					</div>
	</div><!--/.main-->
	
<%@include file="alljs.jsp"%>	
	
</body>
</html>
