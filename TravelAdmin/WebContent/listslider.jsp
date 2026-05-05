<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ac.travel.bean.SliderBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="allcss.jsp"%>	
<title>Slider List  | Travel </title>
</head>
<body>
<%@include file="adminleftmenu.jsp"%>
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="manageAdmin?action=adminhome">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Add Slider</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Edit Slider</h1>
			</div>
		</div><!--/.row-->
						
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Slider List</div>
					<div class="panel-body">
						<div class="col-md-12">			
							<div class="col-md-2">			
								<small>
								<a href="slider?sact=addSlider"><button class="btn btn-info" type="button">New Slider </button></a> 
								</small>
						    </div>
								<br><br><br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th>Slider Name</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									
									<%ArrayList<SliderBean> activelist = (ArrayList<SliderBean>)request.getAttribute("slist"); 
			                         if(activelist==null)
			                         {
			                        	 activelist=new ArrayList<SliderBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          int i=1;
			                          for(SliderBean bn :activelist){
			                        	  if(bn.getSlider_status().equalsIgnoreCase("1")) 
				                        	 {
			                        	  %>  
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=(bn!=null)?bn.getSlider_name():"" %></td>
											<td><b><%="Activate"%></b></td>											
											<td class="actions">
												<a href="slider?sact=editSlider&slider_id=<%=bn.getSlider_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="स्लाइडर व्यवस्थापित करा"></i></a>
											<a href="slider?sact=deleteSlider&slider_id=<%=bn.getSlider_id()%>&slider_status=<%=bn.getSlider_status()%>" class="on-default remove-row"  onclick="return confirm('Do you want to Deactivate Slider?');"><i class="fa fa-trash-o" title="Deactivate Slider"></i></a>
											</td>
										</tr>
									<%}}%>
									</tbody>
									 <tr><td colspan="10"><hr style="border: 0.9px solid grey;"></td></tr>
									 
									<tbody>
									<%ArrayList<SliderBean> deactivelist = (ArrayList<SliderBean>)request.getAttribute("slist1"); 
			                         if(deactivelist==null)
			                         {
			                        	 deactivelist=new ArrayList<SliderBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          for(SliderBean bn :deactivelist){
			                        	  if(bn.getSlider_status().equalsIgnoreCase("0")) 
				                        	 {
			                        	  %>  
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=(bn!=null)?bn.getSlider_name():"" %></td>	
											<td><b><%="Deactivate"%></b></td>			
											<td class="actions">
											<a href="slider?sact=editSlider&slider_id=<%=bn.getSlider_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Slider"></i></a>
											<a href="slider?sact=deleteSlider&slider_id=<%=bn.getSlider_id()%>&slider_status=<%=bn.getSlider_status()%>" class="on-default remove-row"  onclick="return confirm('Do you want to Activate Slider?');"><i class="fa fa-trash-o" title="Slider Activate"></i></a>
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
