<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<% String message = (String) request.getAttribute("message"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Database</title>
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
				                    <button class="edit-button" type="submit"> EDIT </button>
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
           <button class="form-button" onclick="window.location.href='form.jsp'">Add User</button>
    </div>
    <button type="button" class="go-back-button" onclick="history.back()">Back</button>
</body>
</html>
