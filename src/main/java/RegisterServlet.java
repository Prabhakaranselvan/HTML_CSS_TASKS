import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iamservices.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	CRUDOperation crud= new CRUDOperation();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");
		boolean isView = "edit".equals(action);
		if (isView) 
		{
			String id = request.getParameter("id");
			User user = crud.ViewUser(id);
			request.setAttribute("user", user);
			request.getRequestDispatcher("form.jsp").forward(request, response);
		} 
		else 
		{
			List<User> records = crud.ShowUsers();
			request.setAttribute("records", records);
			request.getRequestDispatcher("database.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");
		boolean isDelete = "delete".equals(action);
		boolean isUpdate = "update".equals(action);
		User user = new User();
		
		if (isDelete) 
		{
			String id = request.getParameter("id");
			crud.deleteUser(id);
			request.setAttribute("message", "Deleted Successfully");
			doGet(request, response);
			return;
		}
		else 
		{
			user = getUserDetails(request);
			StringBuilder errorMsg = UserValidator.checkUser(user);
			if (errorMsg.length() > 0) 
			{
				request.setAttribute("user", user);
				request.setAttribute("message", errorMsg.toString());
				request.getRequestDispatcher("form.jsp").forward(request, response);
				return;
			}
		}
		
		if (isUpdate)
		{
			crud.updateUser(user);
			request.setAttribute("message", "Updated Successfully");
			doGet(request, response);
			return;
		}
		else 
		{
			crud.insertUser(user);
			request.setAttribute("message", "Submitted Successfully");
			request.getRequestDispatcher("form.jsp").forward(request, response);
		}	
	}
	
	private User getUserDetails(HttpServletRequest request)
	{
		return new User( request.getParameter("id"), request.getParameter("title"), request.getParameter("first_name"),
				request.getParameter("last_name"), request.getParameter("date_of_birth"), request.getParameter("gender"),
				request.getParameter("email"), request.getParameter("phone"), request.getParameter("aadhar"), request.getParameter("pan"),
				request.getParameter("account_type"), request.getParameter("address_line1"), request.getParameter("address_line2"),
				request.getParameter("district"), request.getParameter("state"), request.getParameter("country"),
				request.getParameter("pincode"), request.getParameter("nominee_name"), request.getParameter("nominee_contact"),
				request.getParameter("password") );
	}
	
}