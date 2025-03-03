import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.servlet.ServletException;

import com.iamservices.User;

public class CRUDOperation 
{
    private Connection getConnection() throws Exception 
    {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MyDB");
        return ds.getConnection();
    }
	
	public User ViewUser(String id) 
	{
		String sql = "SELECT * FROM user_details WHERE id = ?";
		User selectedUser = new User();
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) 
		{
			pstmt.setString(1, id);
			try (ResultSet rs = pstmt.executeQuery()) 
			{
				rs.next();
				selectedUser.setId(rs.getString("id"));
				selectedUser.setTitle(rs.getString("title"));
				selectedUser.setFirstName(rs.getString("first_name"));
				selectedUser.setLastName(rs.getString("last_name"));
				selectedUser.setDob(rs.getString("date_of_birth"));
				selectedUser.setGender(rs.getString("gender"));
				selectedUser.setEmail(rs.getString("email"));
				selectedUser.setPhone(rs.getString("phone"));
				selectedUser.setAadhar(rs.getString("aadhar"));
				selectedUser.setPan(rs.getString("pan"));
				selectedUser.setAccountType(rs.getString("account_type"));
				selectedUser.setAddress1(rs.getString("address_line1"));
				selectedUser.setAddress2(rs.getString("address_line2"));
				selectedUser.setDistrict(rs.getString("district"));
				selectedUser.setState(rs.getString("state"));
				selectedUser.setCountry(rs.getString("country"));
				selectedUser.setPincode(rs.getString("pincode"));
				selectedUser.setNomineeName(rs.getString("nominee_name"));
				selectedUser.setNomineeContact(rs.getString("nominee_contact"));
				selectedUser.setPassword(rs.getString("password"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return selectedUser;
	}

	public List<User> ShowUsers() 
	{
		String sql = "SELECT * FROM user_details";
		List<User> records = new ArrayList<>();
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) 
		{
			try (ResultSet rs = pstmt.executeQuery()) 
			{
				while (rs.next()) 
				{
					User newUser = new User( rs.getString("id"), rs.getString("title"), rs.getString("first_name"),
							rs.getString("last_name"), rs.getString("date_of_birth"), rs.getString("gender"),
							rs.getString("email"), rs.getString("phone"), rs.getString("aadhar"), rs.getString("pan"),
							rs.getString("account_type"), rs.getString("address_line1"), rs.getString("address_line2"),
							rs.getString("district"), rs.getString("state"), rs.getString("country"),
							rs.getString("pincode"), rs.getString("nominee_name"), rs.getString("nominee_contact"),
							rs.getString("password") );
					records.add(newUser);
				}
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return records;
	}
	
	public boolean deleteUser(String id) 
	{
		String sql = "DELETE FROM user_details WHERE id = ?";
		int rowsInserted = 0;
		
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) 
		{
			pstmt.setString(1, id);
			rowsInserted = pstmt.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return rowsInserted > 0 ? true : false;
	}
	
	public void updateUser(User user) throws ServletException, IOException 
	{
		String sql = "UPDATE user_details SET title = ?, first_name = ?, last_name = ?, date_of_birth = ?, gender = ?, email = ?, phone = ?, "
				+ "aadhar = ?, pan = ?, account_type = ?, address_line1 = ?, address_line2 = ?, district = ?, state = ?, country = ?, "
				+ "pincode = ?, nominee_name = ?, nominee_contact = ?, password = ? WHERE id = ?";
		
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql))
		{
			pstmt.setString(1, user.getTitle());
			pstmt.setString(2, user.getFirstName());
			pstmt.setString(3, user.getLastName());
			pstmt.setString(4, user.getDob());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getEmail());
			pstmt.setString(7, user.getPhone());
			pstmt.setString(8, user.getAadhar());
			pstmt.setString(9, user.getPan());
			pstmt.setString(10, user.getAccountType());
			pstmt.setString(11, user.getAddress1());
			pstmt.setString(12, user.getAddress2());
			pstmt.setString(13, user.getDistrict());
			pstmt.setString(14, user.getState());
			pstmt.setString(15, user.getCountry());
			pstmt.setString(16, user.getPincode());
			pstmt.setString(17, user.getNomineeName());
			pstmt.setString(18, user.getNomineeContact());
			pstmt.setString(19, user.getPassword());
			pstmt.setString(20, user.getId());
			
			pstmt.executeUpdate();	
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public void insertUser(User user) throws ServletException, IOException 
	{
		String sql = "INSERT INTO user_details (title, first_name, last_name, date_of_birth, gender, email, phone, aadhar, pan, account_type, "
					+ "address_line1, address_line2, district, state, country, pincode, nominee_name, nominee_contact, password)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) 
		{
			pstmt.setString(1, user.getTitle());
			pstmt.setString(2, user.getFirstName());
			pstmt.setString(3, user.getLastName());
			pstmt.setString(4, user.getDob());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getEmail());
			pstmt.setString(7, user.getPhone());
			pstmt.setString(8, user.getAadhar());
			pstmt.setString(9, user.getPan());
			pstmt.setString(10, user.getAccountType());
			pstmt.setString(11, user.getAddress1());
			pstmt.setString(12, user.getAddress2());
			pstmt.setString(13, user.getDistrict());
			pstmt.setString(14, user.getState());
			pstmt.setString(15, user.getCountry());
			pstmt.setString(16, user.getPincode());
			pstmt.setString(17, user.getNomineeName());
			pstmt.setString(18, user.getNomineeContact());
			pstmt.setString(19, user.getPassword());
		
			pstmt.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
}
