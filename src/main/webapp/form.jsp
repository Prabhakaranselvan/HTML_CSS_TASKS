<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<% String message = (String) request.getAttribute("message"); %>
<% @SuppressWarnings("unchecked")
List<String[]> records = (List<String[]>) request.getAttribute("records");
boolean editMode = (records != null && !records.isEmpty());
String id = editMode ? records.get(0)[0] : "";
String title = editMode ? records.get(0)[1] : "Mr"; 
String firstName = editMode ? records.get(0)[2] : "";
String lastName = editMode ? records.get(0)[3] : "";
String dob = editMode ? records.get(0)[4] : "";
String gender = editMode ? records.get(0)[5] : "";
String email = editMode ? records.get(0)[6] : "";
String phone = editMode ? records.get(0)[7] : ""; 
String aadhar = editMode ? records.get(0)[8] : "";
String pan = editMode ? records.get(0)[9] : "";
String accountType = editMode ? records.get(0)[10] : "Savings";
String address1 = editMode ? records.get(0)[11] : "";
String address2 = editMode ? records.get(0)[12] : "";
String district = editMode ? records.get(0)[13] : ""; 
String state = editMode ? records.get(0)[14] : "";
String country = editMode ? records.get(0)[15] : "";
String pincode = editMode ? records.get(0)[16] : "";
String nomineeName = editMode ? records.get(0)[17] : "";
String nomineeContact = editMode ? records.get(0)[18] : "";
String password = editMode ? records.get(0)[19] : "";
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Account Form</title>
    <link rel="icon" href="images/favicon.png?v=1"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />
    <link rel="stylesheet" href="form.css"/>
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
        <button type="button" class="view-db-button" onclick="window.location.href='RegisterServlet'"><span title="View Database" class="material-symbols-outlined">groups</span></button>
    </div>
        <form class="form-container" action="RegisterServlet" method="post">
        	<h2 class="form-header">BANK ACCOUNT REGISTRATION</h2>

			<input type="hidden" name="id" value="<%= id %>">
			
			<input type="hidden" name="action" value="<%= editMode ? "update" : "submit" %>">
			
			<!-- Name Section -->
			<label class="form-label" for="title">Name:<span class="required">*</span></label>
            <div class="name-container">
            	<select class="form-input" id="title" name="title" required>
            		<option value="Mr" <%= "Mr".equals(title) ? "selected" : "" %>>Mr</option>
                    <option value="Mrs"<%= "Mrs".equals(title) ? "selected" : "" %>>Mrs</option>
                    <option value="Ms"<%= "Ms".equals(title) ? "selected" : "" %>>Ms</option>
                    <option value="Dr"<%= "Dr".equals(title) ? "selected" : "" %>>Dr</option>
                 </select>
                 <input class="form-input" type="text" id="first-name" name="first_name" placeholder="First Name" value="<%= firstName %>" required autofocus>
                 <input class="form-input" type="text" id="last-name" name="last_name" placeholder="Last Name" value="<%= lastName %>">
            </div>

			<!-- DOB Section -->
			<%
			    LocalDate today = LocalDate.now();
			    LocalDate minEligibleDate = today.minusYears(18);
			%>
            <label class="form-label" for="dob">Date of Birth:<span class="required">*</span></label>
            <input class="form-input" type="date" id="dob" name="date_of_birth" max="<%= minEligibleDate %>" pattern="\d{2}-\d{2}-\d{4}" value="<%= dob %>" required>

			<!-- Gender Section -->
            <label class="form-label" for="gender">Gender:<span class="required">*</span></label>
            <div class="gender">
            	<div class="options">
            		<input class="radio-input" type="radio" id="male" name="gender" value="Male" <%= "Male".equals(gender) ? "checked" : "" %> required>
                	<label class="radio-label" for="male">Male</label>
                </div>
                <div class="options">
                	<input class="radio-input" type="radio" id="female" name="gender" value="Female" <%= "Female".equals(gender) ? "checked" : "" %> required>
                	<label class="radio-label" for="female">Female</label>
               	</div>
               	<div class="options">
					<input class="radio-input" type="radio" id="other" name="gender" value="Other" <%= "Other".equals(gender) ? "checked" : "" %> required>
                	<label class="radio-label" for="other">Other</label>
            	</div>
            </div>

			<!-- Email Section -->
            <label class="form-label" for="email">Email:<span class="required">*</span></label>
            <input class="form-input" type="email" id="email" name="email" value="<%= email %>" required>

			<!-- Phone Number Section -->
            <label class="form-label" for="phone">Phone Number:<span class="required">*</span></label>
            <input class="form-input" type="text" id="phone" name="phone" maxlength="10" pattern="[0-9]{10}" value="<%= phone %>" title="Phone number must be 10 digits"required>

			<!-- Aadhar Number Section -->
            <label class="form-label" for="aadhar">Aadhar Number:</label>
            <input class="form-input" type="text" id="aadhar" name="aadhar" maxlength="12" pattern="[0-9]{12}" value="<%= aadhar %>" title="Aadhar number must be 12 digits" required>

			<!-- PAN Number Section -->
            <label class="form-label" for="pan">PAN Number:<span class="required">*</span></label>
            <input class="form-input" type="text" id="pan" name="pan" maxlength="10" pattern="[A-Z]{5}[0-9]{4}[A-Z]" value="<%= pan %>" title="PAN must be 10 characters: First 5 letters, next 4 digits, and last letter." required>
            
            <!-- Account Type Section -->
            <label class="form-label" for="account-type">Account Type:<span class="required">*</span></label>
            <select class="form-input" id="account-type" name="account_type" required>
                <option value="Savings" <%= "Savings".equals(accountType) ? "selected" : "" %>>Savings</option>
                <option value="Current" <%= "Current".equals(accountType) ? "selected" : "" %>>Current</option>
                <option value="Fixed Deposit" <%= "Fixed Deposit".equals(accountType) ? "selected" : "" %>>Fixed Deposit</option>
            </select>
			
			<!-- Address Section -->
            <label class="form-label">Address:<span class="required">*</span></label>
            <input class="form-input" type="text" id="address-line1" name="address_line1" placeholder="Address Line 1" value="<%= address1 %>" required>
            <input class="form-input" type="text" id="address-line2" name="address_line2" placeholder="Address Line 2" value="<%= address2 %>">
            <div class="row-container">
                    <input class="form-input" type="text" id="district" name="district" placeholder="District" value="<%= district %>" required>
                    <input class="form-input" type="text" id="state" name="state" placeholder="State" value="<%= state %>"required>
            </div>
            <div class="row-container">
            		<input class="form-input" type="text" id="country" name="country" placeholder="Country" value="<%= country %>" required>
               		<input class="form-input" type="text" id="pincode" name="pincode" placeholder="Pincode" maxlength="6" pattern="[0-9]{6}" value="<%= pincode %>" title="Pincode must be 6 digits" required>
            </div>

            <!-- Nominee Details Section -->
            <label class="form-label" for="nominee-name">Nominee Name:</label>
            <input class="form-input" type="text" id="nominee-name" name="nominee_name" value="<%= nomineeName %>">

            <label class="form-label" for="nominee-contact">Nominee Contact No:</label>
            <input class="form-input" type="tel" id="nominee-contact" name="nominee_contact" maxlength="10" pattern="[0-9]{10}" value="<%= nomineeContact %>" title="Phone number must be 10 digits">
	
			<!-- Password Section -->
            <label class="form-label" for="password">Set Password:<span class="required">*</span></label>
            <input class="form-input" type="password" id="password" name="password" maxlength="20" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,20}" value="<%= password %>" title="Password must be 8-20 characters long and include at least one number, one special character, one lowercase, and one uppercase letter."required>

			<!-- Submit Button -->
			<div class="buttons">
	            <button class="form-button" type="submit"><%= editMode ? "Update" : "Submit"%></button>
	            <% if (editMode) { %>
		        	<button class="form-button delete-btn" form="delete-form" type="submit">Delete</button>
			    <% } else { %>
			        <button class="form-button" type="reset">Reset</button>
			    <% } %>
            </div>
        </form>
        <form id=delete-form method="post" action="RegisterServlet" onsubmit="return confirm('Are you sure you want to delete this record?');">
        	<input type="hidden" name="id" value="<%= id %>">
        	<input type="hidden" name="action" value="delete">
	     </form>
</body>

</html>
