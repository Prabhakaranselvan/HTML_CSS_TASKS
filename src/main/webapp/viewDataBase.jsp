<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Database</title>
    <link rel="stylesheet" href="dataBase.css">
</head>
<body>
    <div class="DB-holder">
           <h2 class="DB-header">REGISTERED USERS</h2>
           <table>
               <thead>
                   <tr>
                       <th>Title</th>
                       <th>First Name</th>
                       <th>Last Name</th>
                       <th>DOB</th>
                       <th>Gender</th>
                       <th>Email</th>
                       <th>Phone</th>
                       <th>Aadhar</th>
                       <th>PAN</th>
                       <th>Account Type</th>
                       <th>Address</th>
                       <th>District</th>
                       <th>State</th>
                       <th>Country</th>
                       <th>Pincode</th>
                       <th>Nominee Name</th>
                       <th>Nominee Contact</th>
                   </tr>
               </thead>
               <tbody>
			    <%
			        List<String[]> records = (List<String[]>) request.getAttribute("records");
			        if (records != null && !records.isEmpty()) {
			            for (String[] row : records) { %>
			        <tr>
					    <% for (String cell : row) { %>
					        <td><%= cell %></td>
					    <% } %>
					</tr>
			    <%
			            }
			        } else {
			    %>
			        <tr><td colspan="17">No records found.</td></tr>
			    <%
			        }
			    %>
			</tbody>

           </table>
           <button class="form-button" onclick="window.location.href='form.html'">Go Back</button>
    </div>
</body>
</html>
