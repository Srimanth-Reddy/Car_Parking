package login;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginServlet
 */
//@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		
		PreparedStatement stmt;
		ResultSet rs;
		Connection con;
		RequestDispatcher rd;
		int count=0;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/carparking","root","root");
			String sql="select * from login";
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				if(uname.equals(rs.getString("username")) && pass.equals(rs.getString("password"))){
					count=1;
				}
			}
			if(count==1){
				request.setAttribute("status","Login Succesfull as "+uname);
				rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
				count=0;
			}
			else{
				request.setAttribute("status","Failed to Login");
				rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
}
