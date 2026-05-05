<%@page import="com.ac.travel.bean.ClientTestoBean"%>
<%@page import="com.ac.travel.bean.GalleryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="allcss.jsp"%>	
<title>Client Testimonials  | Travel</title>
</head>
<body>
<%@include file="adminleftmenu.jsp"%>
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="manageAdmin">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Client Testimonials</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Client Testimonials</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Client Testimonials List</div>
					<div class="panel-body">
						<div class="col-md-12">			
							<div class="col-md-2">			
								<small>
								<a href="clienttesto?cact=addTesto"><button class="btn btn-info" type="submit">View Client Testimonials</button></a> 
								</small>
						    </div>
								<br><br><br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th>Tours Name</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									
									<%ArrayList<ClientTestoBean> activelist = (ArrayList<ClientTestoBean>)request.getAttribute("ctlist"); 
			                         if(activelist==null)
			                         {
			                        	 activelist=new ArrayList<ClientTestoBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          int i=1;
			                          for(ClientTestoBean bn :activelist){
			                        	  if(bn.getClient_status().equalsIgnoreCase("1")) 
				                        	 {
			                        	  %>  
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=bn.getClient_name() %></td>
											<td class="actions">
											<a href="clienttesto?cact=editTesto&client_id=<%=bn.getClient_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Client Testinmonial"></i></a>
											<a href="clienttesto?cact=deleteTesto&client_id=<%=bn.getClient_id()%>&client_status=<%=bn.getClient_status()%>" class="on-default remove-row"  onclick="return confirm('Do you want to Deactivate Client Testinmonial?');"><i class="fa fa-trash-o" title="Deactivate  Client Testinmonial "></i></a>
											</td>
										</tr>
									<%}}%>
									</tbody>
									 <tr><td colspan="10"><hr style="border: 0.9px solid grey;"></td></tr>
									 
									<tbody>
									<%ArrayList<ClientTestoBean> deactivelist = (ArrayList<ClientTestoBean>)request.getAttribute("ctlist1"); 
			                         if(deactivelist==null)
			                         {
			                        	 deactivelist=new ArrayList<ClientTestoBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          for(ClientTestoBean bn :deactivelist){
			                        	  if(bn.getClient_status().equalsIgnoreCase("0")) 
				                        	 {
			                        	  %>  
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=bn.getClient_name()%></td>
											<td class="actions">
										    <a href="clienttesto?cact=editTesto&client_id=<%=bn.getClient_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Gallery Image"></i></a>
											<a href="clienttesto?cact=deleteTesto&client_id=<%=bn.getClient_id()%>&client_status=<%=bn.getClient_status()%>" class="on-default remove-row"  onclick="return confirm('Do you want to activate Client Testinmonial?');"><i class="fa fa-trash-o" title="Activate"></i></a>
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
