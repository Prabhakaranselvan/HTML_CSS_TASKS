<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.iamservices.User" %>
<%@ page import="java.time.LocalDate" %>

<%
request.setAttribute("buttonCount", 1);
request.setAttribute("buttonIcons", new String[]{"groups"});
request.setAttribute("onClick", new String[]{"window.location.href='RegisterServlet'"});
request.setAttribute("iconLabel", new String[]{"Users"});
%>

<%
User user = (User) request.getAttribute("user");
boolean editMode = (user != null);
String id = editMode ? user.getId() : "";
String title = editMode ? user.getTitle() : "Mr"; 
String firstName = editMode ? user.getFirstName() : "";
String lastName = editMode ? user.getLastName() : "";
String dob = editMode ? user.getDob() : "";
String gender = editMode ? user.getGender() : "";
String email = editMode ? user.getEmail() : "";
String phone = editMode ? user.getPhone() : ""; 
String aadhar = editMode ? user.getAadhar() : "";
String pan = editMode ? user.getPan() : "";
String accountType = editMode ? user.getAccountType() : "Savings";
String address1 = editMode ? user.getAddress1() : "";
String address2 = editMode ? user.getAddress2() : "";
String district = editMode ? user.getDistrict() : ""; 
String state = editMode ? user.getState() : "";
String country = editMode ? user.getCountry() : "";
String pincode = editMode ? user.getPincode() : "";
String nomineeName = editMode ? user.getNomineeName() : "";
String nomineeContact = editMode ? user.getNomineeContact() : "";
String password = editMode ? user.getPassword() : "";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>IAM</title>
    <link rel="stylesheet" href="form.css"/>
     <link rel="icon" href="images/favicon.png?v=1"/>
</head>

<body>
    <div class="content">
	    <div class="left-half">
		    <img src="images/grow.jpg" alt="Rise with Us" class="grow-image">
		    <h3 class="quote-msg"><%= editMode ? "Hang tight, Grow right!":"Stay, Grow, Conquer!" %></h3>
		    <h2 class="welcome-msg"><%= editMode ? "Let's Upgrade!" : "Welcome Aboard!" %></h2>
	    </div>
	    
	    <div class="right-half">
	        <form class="form-container" action="RegisterServlet" method="post">
	        	<h2 class="form-header">BANK ACCOUNT REGISTRATION</h2>
	
				<input type="hidden" name="id" value="<%= id %>">
				
				<input type="hidden" name="action" value="<%= editMode ? "update" : "submit" %>">
				
				<!-- Name Section -->
				<label class="form-label" for="title">Name <span class="required">*</span></label>
	            <div class="name-container">
	            	<select class="form-input" id="title" name="title" required>
	            		<option value="Mr" <%= "Mr".equals(title) ? "selected" : "" %>>Mr</option>
	                    <option value="Mrs"<%= "Mrs".equals(title) ? "selected" : "" %>>Mrs</option>
	                    <option value="Ms"<%= "Ms".equals(title) ? "selected" : "" %>>Ms</option>
	                    <option value="Dr"<%= "Dr".equals(title) ? "selected" : "" %>>Dr</option>
	                 </select>
	                 <input class="form-input" type="text" id="first-name" name="first_name" placeholder="First Name" pattern="[A-Za-z]+(?:[\-' ][A-Za-z]+)*" value="<%= firstName %>" required autofocus>
	                 <input class="form-input" type="text" id="last-name" name="last_name" placeholder="Last Name" pattern="[A-Za-z]+(?:[\-' ][A-Za-z]+)*" value="<%= lastName %>">
	            </div>
	
				
				<div class="double-column">
					<!-- DOB Section -->
					<div class = "part">
						<%
						    LocalDate today = LocalDate.now();
						    LocalDate minEligibleDate = today.minusYears(18);
						%>
			            <label class="form-label" for="dob">Date of Birth <span class="required">*</span></label>
			            <input class="form-input" type="date" id="dob" name="date_of_birth" max="<%= minEligibleDate %>" pattern="\d{2}-\d{2}-\d{4}" value="<%= dob %>" required>
					</div>
					
					<!-- Account Type Section -->
					<div class = "part">
			            <label class="form-label" for="account-type">Account Type <span class="required">*</span></label>
			            <select class="form-input" id="account-type" name="account_type" required>
			                <option value="Savings" <%= "Savings".equals(accountType) ? "selected" : "" %>>Savings</option>
			                <option value="Current" <%= "Current".equals(accountType) ? "selected" : "" %>>Current</option>
			                <option value="Fixed Deposit" <%= "Fixed Deposit".equals(accountType) ? "selected" : "" %>>Fixed Deposit</option>
			            </select>
					</div>
				</div>
					
				<!-- Gender Section -->
	            
	            <div class="gender">
	            <label class="form-label" for="gender">Gender <span class="required">*</span></label>
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
	
				<div class="double-column">
					<!-- Email Section -->
					<div class="part-with-icon">
			            <label class="form-label" for="email">Email <span class="required">*</span></label>
			            <input class="form-input" type="text" id="email" name="email" pattern="[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}" value="<%= email %>" required>
						<span class="material-symbols-outlined">mail</span>
					</div>
					
					<!-- Phone Number Section -->
					<div class = "part-with-icon">
			            <label class="form-label" for="phone">Phone Number <span class="required">*</span></label>
			            <input class="form-input" type="text" id="phone" name="phone" maxlength="10" pattern="\d{10}" value="<%= phone %>" oninput="this.value = this.value.replace(/\Dg, '')" title="Phone number must be 10 digits" required>
						<span class="material-symbols-outlined">call</span>
					</div>
				</div>
				
				<div class="double-column">
					<!-- Aadhar Number Section -->
					<div class="part">
			            <label class="form-label" for="aadhar">Aadhar Number <span class="required">*</span></label>
			            <input class="form-input" type="text" id="aadhar" name="aadhar" maxlength="12"  value="<%= aadhar %>" oninput="this.value = this.value.replace(/\D/g, '')" title="Aadhar number must be 12 digits" required>
					</div>
				
					<!-- PAN Number Section -->
					<div class = "part">
			            <label class="form-label" for="pan">PAN Number <span class="required">*</span></label>
			            <input class="form-input" type="text" id="pan" name="pan" maxlength="10" pattern="[A-Z]{5}\d{4}[A-Z]" value="<%= pan %>" oninput="this.value = this.value.toUpperCase();" title="PAN must be 10 characters: First 5 letters, next 4 digits, and last letter." required>
		            </div>
				</div>
				
				<!-- Address Section -->
	            <label class="form-label">Address <span class="required">*</span></label>
	            <input class="form-input" type="text" id="address-line1" name="address_line1" placeholder="Address Line 1" value="<%= address1 %>" required>
	            <input class="form-input" type="text" id="address-line2" name="address_line2" placeholder="Address Line 2" value="<%= address2 %>">
	            <div class="row-container">
	                    <input class="form-input" type="text" id="district" name="district" placeholder="District" value="<%= district %>" required>
	                    <input class="form-input" type="text" id="state" name="state" placeholder="State" value="<%= state %>"required>
	            </div>
	            <div class="row-container">
	            		<input class="form-input" type="text" id="country" name="country" placeholder="Country" value="<%= country %>" required>
	               		<input class="form-input" type="text" id="pincode" name="pincode" placeholder="Pincode" maxlength="6" pattern="\d{6}" value="<%= pincode %>" oninput="this.value = this.value.replace(/\D/g, '')" title="Pincode must be 6 digits" required>
	            </div>
				
				<div class="double-column">
		            <!-- Nominee Details Section -->
		            <div class="part-with-icon">
			            <label class="form-label" for="nominee-name">Nominee Name</label>
			            <input class="form-input" type="text" id="nominee-name" name="nominee_name" pattern="^[A-Za-z]+(?:[\-' ][A-Za-z]+)*" value="<%= nomineeName %>">
			            <span class="material-symbols-outlined">person</span>
					</div>
					<div class="part-with-icon">
			            <label class="form-label" for="nominee-contact">Nominee Contact No</label>
			            <input class="form-input" type="text" id="nominee-contact" name="nominee_contact" maxlength="10" pattern="\d{10}" oninput="this.value = this.value.replace(/\D/g, '')" value="<%= nomineeContact %>" title="Phone number must be 10 digits">
						<span class="material-symbols-outlined">call</span>
					</div>
				</div>
				
				<div class="double-column">
					<!-- Password Section -->
					<div class = "part">
			            <label class="form-label" for="password">Set Password <span class="required">*</span></label>
			            <input class="form-input" type="password" id="password" name="password" maxlength="20" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,20}" value="<%= password %>" title="Password must be 8-20 characters long and include at least one number, one special character, one lowercase, and one uppercase letter." <%= editMode ? "readonly" : "" %> required>
					</div>
					
					<div class = "part">
						<label class="form-label" for="confirm-password">Confirm Password <span class="required">*</span></label>
						<input class="form-input" type="password" id="confirm-password" name="confirm_password" required>
					</div>
				</div>
				<div class="show-password">
				    <input type="checkbox" id="show-password"> <label for="show-password">Show Password</label>
				</div>
				<span id="password-error" class="error-message"></span>

				<script>
				    document.addEventListener("DOMContentLoaded", function () {
				        const password = document.getElementById("password");
				        const confirmPassword = document.getElementById("confirm-password");
				        const showPasswordCheckbox = document.getElementById("show-password");
				        const errorMessage = document.getElementById("password-error");
				        const form = document.querySelector("form");
				        
				        showPasswordCheckbox.addEventListener("change", function () {
				            if (showPasswordCheckbox.checked) {
				                password.type = "text";
				                confirmPassword.type = "text";
				            } else {
				                password.type = "password";
				                confirmPassword.type = "password";
				            }
				        });
				
				        form.addEventListener("submit", function (event) {
				            if (password.value !== confirmPassword.value) {
				                event.preventDefault(); // Prevent form submission
				                errorMessage.textContent = "Passwords do not match!";
				                errorMessage.style.color = "red";
				            } else {
				                errorMessage.textContent = "";
				            }
				        });
				    });
				</script>
				
				<!-- Submit Button -->
				<div class="buttons">
		            <button class="form-button" type="submit"><%= editMode ? "Update" : "Submit"%></button>
		            <% if (editMode) { %>
			        	<button class="delete-button" form="delete-form" type="submit">Delete</button>
				    <% } else { %>
				        <button class="form-button" type="reset">Reset</button>
				    <% } %>
	            </div>
	        </form>
	        <form id=delete-form method="post" action="RegisterServlet" onsubmit="return confirm('Are you sure you want to delete this record?');">
	        	<input type="hidden" name="id" value="<%= id %>">
	        	<input type="hidden" name="action" value="delete">
		     </form>
	     </div>
     </div>
     <%@ include file="template.jsp" %>
</body>

</html>
