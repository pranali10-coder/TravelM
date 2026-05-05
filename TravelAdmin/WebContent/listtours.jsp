<%@page import="com.ac.travel.bean.ToursBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="allcss.jsp"%>	
<title>Tours  | Travel</title>
</head>
<body>
<%@include file="adminleftmenu.jsp"%>
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="manageAdmin">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Add Tours</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Edit Tours</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Tours list</div>
					<div class="panel-body">
						<div class="col-md-12">			
							<div class="col-md-2">			
								<small>
								<a href="tours?tact=addTours"><button class="btn btn-info" type="submit" style="float: right;">New Tours</button></a> 
								</small>
						    </div>
								<br><br><br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th>Tours Name</th>
											<th>Tours Description</th>
											<th>Tours Rating</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									
									<%ArrayList<ToursBean> activelist = (ArrayList<ToursBean>)request.getAttribute("tlist"); 
			                         if(activelist==null)
			                         {
			                        	 activelist=new ArrayList<ToursBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          int i=1;
			                          for(ToursBean bn :activelist){
			                        	  if(bn.getTours_status().equalsIgnoreCase("1")) 
				                        	 {
			                        	  %>  
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=bn.getTours_name() %></td>
											<td><%=bn.getTours_desc()%></td>
											<td><%=bn.getTours_price()%></td>
											<td class="actions">
											<a href="tours?tact=editTours&tours_id=<%=bn.getTours_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit tours"></i></a>
											<a href="tours?tact=deleteTours&tours_id=<%=bn.getTours_id()%>&tours_status=<%=bn.getTours_status()%>" class="on-default remove-row"  onclick="return confirm('Do you want Deactivate Tours?');"><i class="fa fa-trash-o" title="Tours Activate"></i></a>
											</td>
										</tr>
									<%}}%>
									</tbody>
									 <tr><td colspan="10"><hr style="border: 0.9px solid grey;"></td></tr>
									 
									<tbody>
									<%ArrayList<ToursBean> deactivelist = (ArrayList<ToursBean>)request.getAttribute("tlist1"); 
			                         if(deactivelist==null)
			                         {
			                        	 deactivelist=new ArrayList<ToursBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          for(ToursBean bn :deactivelist){
			                        	  if(bn.getTours_status().equalsIgnoreCase("0")) 
				                        	 {
			                        	  %>  
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=bn.getTours_name()%></td>
											<td><%=bn.getTours_desc()%></td>
											<td><%=bn.getTours_price()%></td>
											<td class="actions">
										    <a href="tours?tact=editTours&tours_id=<%=bn.getTours_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="edit tours"></i></a>
											<a href="tours?tact=deleteTours&tours_id=<%=bn.getTours_id()%>&tours_status=<%=bn.getTours_status()%>" class="on-default remove-row"  onclick="return confirm('Do you want to Activate tours?');"><i class="fa fa-trash-o" title="Tours Activate"></i></a>
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
