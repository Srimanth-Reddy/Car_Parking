package login;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    public signupServlet() {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException         {
		//doGet(request, response);
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String uname=request.getParameter("uname");
		String resadd=request.getParameter("resadd");
		String mobnum=request.getParameter("mobnum");
		String carnum=request.getParameter("carnum");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		
		PreparedStatement stmt;
		Connection con;
		RequestDispatcher rd;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/carparking","root","root");
			String sql="insert into login(firstname,lastname,username,residentialAddress,mobileNumber,carregNum,email,password) values(?,?,?,?,?,?,?,?)";
			stmt=con.prepareStatement(sql);
			stmt.setString(1,fname);
			stmt.setString(2,lname);
			stmt.setString(3,uname);
			stmt.setString(4,resadd);
			stmt.setString(5,mobnum);
			stmt.setString(6,carnum);
			stmt.setString(7,email);
			stmt.setString(8,pass);
			int row=stmt.executeUpdate();
			if(row>0){
				request.setAttribute("status","Successfully Signed up! You can Login.");
				rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}		
			else{
				request.setAttribute("status","Failed to sign up! Please Try again.");
				rd=request.getRequestDispatcher("signup.jsp");
				rd.forward(request, response);		
			}
		} 
		catch (Exception e){
			e.printStackTrace();
		}
	}
}