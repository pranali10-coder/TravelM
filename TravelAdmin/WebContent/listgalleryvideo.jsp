<%@page import="com.ac.travel.bean.GalleryVideoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="allcss.jsp"%>	
<title>Gallery Vedio | Travel</title>
</head>
<body>
<%@include file="adminleftmenu.jsp"%>
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="manageAdmin">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Add Gallery Vedio</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Edit Gallery Vedio</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Gallery Vedio List</div>
					<div class="panel-body">
						<div class="col-md-12">			
							<div class="col-md-2">			
								<small>
								<a href="galleryVideo?gact=addGalleryVideo"><button class="btn btn-info" type="submit" style="float: right;">New Gallery Vedio</button></a> 
								</small>
						    </div>
								<br><br><br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th>Gallery Vedio Name</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									
									<%ArrayList<GalleryVideoBean> activelist = (ArrayList<GalleryVideoBean>)request.getAttribute("gvlist"); 
			                         if(activelist==null)
			                         {
			                        	 activelist=new ArrayList<GalleryVideoBean>();
			                         }
			                         %>
			                         
			                          <% 
			                          int i=1;
			                          for(GalleryVideoBean bn :activelist){
			                        	  if(bn.getGalleryvideo_status().equalsIgnoreCase("1")) 
				                        	 {
			                        	  %>
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=bn.getGalleryvideo_name() %></td>
											<td class="actions">
											<a href="galleryVideo?gact=editGalleryVideo&galleryvideo_id=<%=bn.getGalleryvideo_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Gallery Vedio"></i></a>
											<a href="galleryVideo?gact=deleteGalleryVideo&galleryvideo_id=<%=bn.getGalleryvideo_id()%>&galleryvideo_status=<%=bn.getGalleryvideo_status()%>" class="on-default remove-row"  onclick="return confirm('Do you want to Deactivate Gallery Vedio?');"><i class="fa fa-trash-o" title="Deactivate Gallery Vedio"></i></a>
											</td>
										</tr>
									<%}}%>
									</tbody>
									 <tr><td colspan="10"><hr style="border: 0.9px solid grey;"></td></tr>
									 
									<tbody>
									<%ArrayList<GalleryVideoBean> deactivelist = (ArrayList<GalleryVideoBean>)request.getAttribute("gvlist1"); 
			                         if(deactivelist==null)
			                         {
			                        	 deactivelist=new ArrayList<GalleryVideoBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          for(GalleryVideoBean bn :deactivelist){
			                        	  if(bn.getGalleryvideo_status().equalsIgnoreCase("0")) 
				                        	 {
			                        	  %>  
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=bn.getGalleryvideo_name()%></td>
											<td class="actions">
											<a href="galleryVideo?gact=editGalleryVideo&galleryvideo_id=<%=bn.getGalleryvideo_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Video Gallery"></i></a>
											<a href="galleryVideo?gact=deleteGalleryVideo&galleryvideo_id=<%=bn.getGalleryvideo_id()%>&galleryvideo_status=<%=bn.getGalleryvideo_status()%>" class="on-default remove-row"  onclick="return confirm('Do you want to Deactivate Gallery Vedio?');"><i class="fa fa-trash-o" title="Activate Gallery Vedio"></i></a>
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
