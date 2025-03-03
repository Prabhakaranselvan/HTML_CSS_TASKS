<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />
    <link rel="stylesheet" href="template.css"/>
</head>
<body>
	<% String message = (String)  request.getAttribute("message"); %>
    <% if (message != null) { %>
        <dialog open class="popup-message">
            <p><%= message %></p>
            <form method="dialog">
                <button>OK</button>
            </form>
        </dialog>
    <% } %>
	<% 
    int buttonCount = (int) request.getAttribute("buttonCount"); 
	String[] buttonIcons = (String[]) request.getAttribute("buttonIcons");
	String[] onClick = (String[]) request.getAttribute("onClick");
	String[] iconTitle = (String[]) request.getAttribute("iconTitle");
    %>

    <div class="banner">
        <div class="logo-container">
            <img src="images/zoho-logo-512.png" alt="Company Logo" class="logo"/>
            <span class="company-name">IAM Services</span>
        </div>
        
        <div class="banner-buttons">
            <%
            for (int i = 0; i < buttonCount; i++) { 
           	%>
            	<button class="banner-button" onclick="<%= onClick[i] %>"><span title="<%= iconTitle[i] %>" class="material-symbols-outlined"><%=  buttonIcons[i] %></span></button>
            <% } %>
        </div>
	</div>
	 <footer class="footer">
			<span class="material-symbols-outlined">copyright</span> 
	    	<p>2025 IAM Services. All Rights Reserved.</p>
	</footer>
</body>
</html>