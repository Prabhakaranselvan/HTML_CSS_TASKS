import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bank_user_registration";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "root";
    
    @Override
    public void init() throws ServletException 
    {
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } 
        catch (ClassNotFoundException e) 
        {
            throw new ServletException("JDBC Driver not found", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {	
    	String action = request.getParameter("action");
    	String id = request.getParameter("id");
        String title = request.getParameter("title");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String dob = request.getParameter("date_of_birth");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String aadhar = request.getParameter("aadhar");
        String pan = request.getParameter("pan");
        String accountType = request.getParameter("account_type");
        String address1 = request.getParameter("address_line1");
        String address2 = request.getParameter("address_line2");
        String district = request.getParameter("district");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String pincode = request.getParameter("pincode");
        String nomineeName = request.getParameter("nominee_name");
        String nomineeContact = request.getParameter("nominee_contact");
        String password = request.getParameter("password");
        
        boolean isUpdate = "update".equals(action);
        boolean isDelete = "delete".equals(action);
        String sql;
        
        if (isDelete)
        {
        	sql = "DELETE FROM user_details WHERE id = ?";
        }
        else if(isUpdate)
        {
        	sql = "UPDATE user_details SET title = ?, first_name = ?, last_name = ?, date_of_birth = ?, gender = ?, email = ?, phone = ?, " 
        		    + "aadhar = ?, pan = ?, account_type = ?, address_line1 = ?, address_line2 = ?, district = ?, state = ?, country = ?, " 
        		    + "pincode = ?, nominee_name = ?, nominee_contact = ?, password = ? WHERE id = ?";
        }
        else
        {
        	sql = "INSERT INTO user_details (title, first_name, last_name, date_of_birth, gender, email, phone, aadhar, pan, account_type, "
            		+ "address_line1, address_line2, district, state, country, pincode, nominee_name, nominee_contact, password)" 
            		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        }
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                PreparedStatement pstmt = conn.prepareStatement(sql)) 
        {
        	if(isDelete) 
        	{
        		pstmt.setString(1, id);
        	}
        	else
        	{
	        	pstmt.setString(1, title);
			    pstmt.setString(2, firstName);
			    pstmt.setString(3, lastName);
			    pstmt.setString(4, dob);
			    pstmt.setString(5, gender);
			    pstmt.setString(6, email);
			    pstmt.setString(7, phone);
			    pstmt.setString(8, aadhar);
			    pstmt.setString(9, pan);
			    pstmt.setString(10, accountType);
			    pstmt.setString(11, address1);
			    pstmt.setString(12, address2);
			    pstmt.setString(13, district);
			    pstmt.setString(14, state);
			    pstmt.setString(15, country);
			    pstmt.setString(16, pincode);
			    pstmt.setString(17, nomineeName);
			    pstmt.setString(18, nomineeContact);
			    pstmt.setString(19, password);
			    if (isUpdate)
			    {
			    	pstmt.setString(20, id);
			    }
        	}
		
		    int rowsInserted = pstmt.executeUpdate();
		    if (isDelete)
		    {
		        request.setAttribute("message", rowsInserted > 0 ? "Deleted Successfully" : "Error: Unable to Delete.");
		        doGet(request,response);
		    }
		    
		    else if (isUpdate) 
		    {
		        request.setAttribute("message", rowsInserted > 0 ? "Updated Successfully" : "Error: Unable to update.");		
		        doGet(request,response);
		    }

		    else 
		    { 
		        request.setAttribute("message", rowsInserted > 0 ? "Submitted Successfully" : "Error: Unable to register.");
		        request.getRequestDispatcher("form.jsp").forward(request, response);
		    }
		    
        } 
        catch (Exception e) 
        {
        	e.printStackTrace();
            response.getWriter().println("Database Connection Error!" + e.getMessage());
        }
       }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String action = request.getParameter("action");
        String id = request.getParameter("id");
        String sql;
        boolean isView = "edit".equals(action);
        List<String[]> records = new ArrayList<>();
        if (isView) 
        {
            sql = "SELECT * FROM user_details WHERE id = ?";
        } 
        else 
        {
        	
            sql = "SELECT * FROM user_details";
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
        		PreparedStatement pstmt = conn.prepareStatement(sql)) 
        {
	        if (isView) 
	        {
	            pstmt.setString(1, id);
	        }
	        try (ResultSet rs = pstmt.executeQuery())
	        {
	            while (rs.next()) 
	            {
	                String[] row = {
	                    rs.getString("id"),
	                    rs.getString("title"),
	                    rs.getString("first_name"),
	                    rs.getString("last_name"),
	                    rs.getString("date_of_birth"),
	                    rs.getString("gender"),
	                    rs.getString("email"),
	                    rs.getString("phone"),
	                    rs.getString("aadhar"),
	                    rs.getString("pan"),
	                    rs.getString("account_type"),
	                    rs.getString("address_line1"),
	                    rs.getString("address_line2"),
	                    rs.getString("district"),
	                    rs.getString("state"),
	                    rs.getString("country"),
	                    rs.getString("pincode"),
	                    rs.getString("nominee_name"),
	                    rs.getString("nominee_contact"),
	                    rs.getString("password")
	                };
	                records.add(row);
	            }
            }
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        request.setAttribute("records", records);
        if (isView) 
        {
        	
            request.getRequestDispatcher("form.jsp").forward(request, response);
        } 
        else 
        {
        	
            request.getRequestDispatcher("viewDataBase.jsp").forward(request, response);
            
        }
    }
}