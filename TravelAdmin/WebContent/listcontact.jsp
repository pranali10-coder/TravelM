<%@page import="com.ac.travel.bean.ContactBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="allcss.jsp"%>	
<title>Contact Enquiry | Travel Admin </title>
</head>
<body>
<%@include file="adminleftmenu.jsp"%>
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="manageAdmin">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active"> Enquiry List</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Enquiry List</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Enquiry List</div>
					<div class="panel-body">
						<div class="col-md-12">			
							<div class="col-md-2">			
								<small>
								</small>
						    </div>
								<br><br><br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th>Name</th>
											<th>Email</th>
											<th>Mobile NO</th>
											<th>Messege</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									
								    <%ArrayList<ContactBean> activelist = (ArrayList<ContactBean>)request.getAttribute("clist"); 
			                         if(activelist==null)
			                         {
			                        	 activelist=new ArrayList<ContactBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          int i=1;
			                          for(ContactBean bn :activelist){
			                        	  if(bn.getStatus().equalsIgnoreCase("1")) 
				                        	 {
			                        	  %>
			                        	  
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=bn.getUsername() %></td>
											<td><%=bn.getEmail() %></td>
											<td><%=bn.getPhone() %></td>
											<td><%=bn.getMessage() %></td>
											<td class="actions">
											<a href="managecontact?contact=deleteContact&userid=<%=bn.getUserid() %>&status=<%=bn.getStatus() %>" class="on-default remove-row"  onclick="return confirm('Do you want to enquiry Deactivate?');"><i  title="Enquiry Deactivate"></i><button class="btn btn-danger" type="submit"><%=(bn.getStatus().equals("1"))?"Check":"Uncheck"%></button></a>
											</td>
										</tr>
									 <%}}%> 
									</tbody>
									</table>
									 <tr><td colspan="10"><hr style="border: 0.9px solid grey;"></td></tr>
									<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
										    <th>Sr.No</th>
											<th>Name</th>
											<th>Email</th>
											<th>Mobile NO</th>
											<th>Messege</th>
											<th>Action</th>
										</tr>
									</thead> 
									<tbody>
									
									<%ArrayList<ContactBean> deactivelist = (ArrayList<ContactBean>)request.getAttribute("clist"); 
			                         if(deactivelist==null)
			                         {
			                        	 deactivelist=new ArrayList<ContactBean>();
			                         }
			                         %>
			                        
			                          <% 
			                          for(ContactBean bn :deactivelist){
			                        	  if(bn.getStatus().equalsIgnoreCase("0")) 
				                        	 {
			                        	  %>   
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=bn.getUsername() %></td>
											<td><%=bn.getEmail() %></td>
											<td><%=bn.getPhone() %></td>
											<td><%=bn.getMessage() %></td>			
											<td class="actions">		
											<a href="managecontact?contact=deleteContact&userid=<%=bn.getUserid()%>&status=<%=bn.getStatus() %>" class="on-default remove-row" onclick="return confirm('Do you want to Activate e enquiry?');"><i  title="deactivate enquiry"></i><button class="btn btn-info" type="submit" ><%=(bn.getStatus().equals("0"))?"Uncheck":"Check"%></button></a> 
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
