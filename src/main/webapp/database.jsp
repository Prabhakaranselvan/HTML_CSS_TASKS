<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.iamservices.User" %>

<%
    request.setAttribute("buttonCount", 2);
    request.setAttribute("buttonIcons", new String[]{"person_add", "chevron_left"});
    request.setAttribute("onClick", new String[]{"window.location.href='form.jsp'", "history.back()"});
    request.setAttribute("iconTitle", new String[]{"Add User", "Back"});
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>View Database</title>
    <link rel="stylesheet" href="database.css">
     <link rel="icon" href="images/favicon.png?v=1"/>
</head>

<body>
    
    <div class="DB-holder">
           <h2 class="DB-header">REGISTERED USERS</h2>
           <table>
               <thead>
                   <tr>
                   	   <th>ID</th>
                       <th>Name</th>
                       <th>DOB</th>
                       <th>Gender</th>
                       <th>Email</th>
                       <th>Phone</th>
                       <th>Account Type</th>
                       <th>Action</th>
                   </tr>
               </thead>
               <tbody>
			   <%
			    	@SuppressWarnings("unchecked")
			        List<User> records = (List<User>) request.getAttribute("records");
			        if (records != null && !records.isEmpty()) 
			        {
			            for (User user : records) 
			            { 
			            	String id = user.getId();
			                String name = user.getTitle() + "." + user.getFirstName() + " " + user.getLastName();
			                String dob = user.getDob();
			                String gender = user.getGender();
			                String email = user.getEmail();
			                String phone = user.getPhone();
			                String account_Type = user.getAccountType();
	 			%>
				        <tr>
				            <td><%= id %></td>
				            <td><%= name %></td>
				            <td><%= dob %></td>
				            <td><%= gender %></td>
				            <td><%= email %></td>
				            <td><%= phone %></td>
				            <td><%= account_Type %></td>
				            <td>
				            	<div class="edit-delete-buttons">				            
			                	<form action="RegisterServlet" method="get">
				                    <input type="hidden" name="id" value="<%= id %>">
				                    <input type="hidden" name="action" value="edit">
				                    <button class="edit-button" type="submit"><span title="Edit" class="material-symbols-outlined">edit</span> </button>
			                    </form>
				                <form id="delete-form-<%= id %>" method="post" action="RegisterServlet" onsubmit="return confirm('Are you sure you want to delete this record?');">
						        	<input type="hidden" name="id" value="<%= id %>">
						        	<input type="hidden" name="action" value="delete">
						        	<button class="delete-button" type="submit"><span title="Delete" class="material-symbols-outlined">delete_forever</span></button>
				            	</form>
		     					</div>
				            </td>
						</tr>
		    		<%  } 
			        } 
			        else 
			        {
			    	%>
			        <tr><td colspan="8">No records found.</td></tr>
			    <%  }  %>
				</tbody>
           </table>
	</div>
	<%@ include file="template.jsp" %>
</body>
</html>
