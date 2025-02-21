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
    
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Bank_User_Registration";
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
        String title = request.getParameter("Title");
        String firstName = request.getParameter("First_Name");
        String lastName = request.getParameter("Last_Name");
        String dob = request.getParameter("DOB");
        String gender = request.getParameter("Gender");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        String aadhar = request.getParameter("Aadhar");
        String pan = request.getParameter("PAN");
        String accountType = request.getParameter("Account_Type");
        String address1 = request.getParameter("Address_Line1");
        String address2 = request.getParameter("Address_Line2");
        String district = request.getParameter("District");
        String state = request.getParameter("State");
        String country = request.getParameter("Country");
        String pincode = request.getParameter("Pincode");
        String nomineeName = request.getParameter("Nominee_Name");
        String nomineeContact = request.getParameter("Nominee_Contact");
        String password = request.getParameter("Password");

        String sql = "INSERT INTO bank_accounts (Title, First_Name, Last_Name, DOB, Gender, Email, Phone, Aadhar, PAN, Account_Type, "
        		+ "Address_Line1, Address_Line2, District, State, Country, Pincode, Nominee_Name, Nominee_Contact, Password)" 
        		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                PreparedStatement pstmt = conn.prepareStatement(sql)) 
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
		
		    int rowsInserted = pstmt.executeUpdate();
		
		    response.setContentType("text/html");
		    response.getWriter().println(rowsInserted > 0 ? "Submitted Successfully" : "Error: Unable to register.");
        } 
        catch (Exception e) 
        {
        	e.printStackTrace();
            response.getWriter().println("Database Connection Error!" + e.getMessage());
        }
       }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        List<String[]> records = new ArrayList<>();
        String sql = "SELECT * FROM bank_accounts";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) 
        {
            
            while (rs.next()) 
            {
                String[] row = {
                    rs.getString("Title"),
                    rs.getString("First_Name"),
                    rs.getString("Last_Name"),
                    rs.getString("DOB"),
                    rs.getString("Gender"),
                    rs.getString("Email"),
                    rs.getString("Phone"),
                    rs.getString("Aadhar"),
                    rs.getString("PAN"),
                    rs.getString("Account_Type"),
                    rs.getString("Address_Line1"),
                    rs.getString("District"),
                    rs.getString("State"),
                    rs.getString("Country"),
                    rs.getString("Pincode"),
                    rs.getString("Nominee_Name"),
                    rs.getString("Nominee_Contact")
                };
                records.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("records", records);
        request.getRequestDispatcher("viewDataBase.jsp").forward(request, response);
    }
}
