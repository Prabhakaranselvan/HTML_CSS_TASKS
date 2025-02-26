<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<% String message = (String) request.getAttribute("message"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>View Database</title>
    <link rel="icon" href="images/favicon.png?v=1"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />
    <link rel="stylesheet" href="dataBase.css">
</head>

<body>
	<% if (message != null) { %>
        <dialog open class="popup-message">
            <p><%= message %></p>
            <form method="dialog">
                <button>OK</button>
            </form>
        </dialog>
    <% } %>
    
    <div class="banner">
	    <div class="logo-container">
	    	<img src="images/zoho-logo-512.png" alt="Company Logo" class="logo"/>
	        <span class="company-name">IAM Services</span>
	    </div>
	    <div class=banner-buttons>
	    	<button class="banner-button" onclick="window.location.href='form.jsp'"><span title="Add User" class="material-symbols-outlined">person_add</span></button>
        	<button class="banner-button" onclick="history.back()"><span title="Back" class="material-symbols-outlined">chevron_backward</span></button>
    	</div>
    </div>
    
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
			        List<String[]> records = (List<String[]>) request.getAttribute("records");
			        if (records != null && !records.isEmpty()) 
			        {
			            for (String[] row : records) 
			            { 
			            	String id = row[0];
			                String name = row[1] + "." + row[2] + " " + row[3];
			                String dob = row[4];
			                String gender = row[5];
			                String email = row[6];
			                String phone = row[7];
			                String account_Type = row[10];
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
			                	<form action="RegisterServlet" method="get">
				                    <input type="hidden" name="id" value="<%= id %>">
				                    <input type="hidden" name="action" value="edit">
				                    <div class="edit-delete-buttons">
					                    <button class="edit-button" type="submit"><span title="Edit" class="material-symbols-outlined">edit</span> </button>
					                    <button class="delete-button" form="delete-form" type="submit"><span title="Edit" class="material-symbols-outlined">delete_forever</span></button>
				                	</div>
				                </form>
				                <form id=delete-form method="post" action="RegisterServlet" onsubmit="return confirm('Are you sure you want to delete this record?');">
						        	<input type="hidden" name="id" value="<%= id %>">
						        	<input type="hidden" name="action" value="delete">
		     					</form>
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
</body>
</html>
