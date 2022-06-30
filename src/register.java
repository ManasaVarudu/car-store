import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
@WebServlet("/first")
public class register extends HttpServlet
{
	public static final String SALT = "my-salt-text";

	public static String hash(String input) {
		StringBuilder hash = new StringBuilder();

		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte[] hashedBytes = sha.digest(input.getBytes());
			char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f' };
			for (int idx = 0; idx < hashedBytes.length; ++idx) {
				byte b = hashedBytes[idx];
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException e) {
			// handle error here.
		}

		return hash.toString();
	}

    public void service(HttpServletRequest req,HttpServletResponse res)throws IOException
    
    {
    res.setContentType("text/html");
    PrintWriter out=res.getWriter();
    String uname=req.getParameter("uname");
    String fname=req.getParameter("fname");
    String lname=req.getParameter("lname");
    String email=req.getParameter("email");
    String pswrd=req.getParameter("pswrd");
    String cpswrd=req.getParameter("cpswrd");
    
    
    
    try 
    {
      
      Connection con=null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      System.out.println("Driver class loaded");
      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ep","ep");
      System.out.println("connection");
      PreparedStatement psmt=con.prepareStatement("insert into user1 values(?,?,?,?,?)");

    //PreparedStatement psmt=con.prepareStatement("insert into user1 values(?,?,?,?,?)");
      
    psmt.setString(1,uname);
    psmt.setString(2,fname);
    psmt.setString(3,lname);
    psmt.setString(4,email);
    String saltedPassword = SALT + pswrd;
	String hashedPassword = hash(saltedPassword);
   
    psmt.setString(5,hashedPassword);
    cpswrd=pswrd;
    psmt.setString(6,hashedPassword);
   
    int n=psmt.executeUpdate();
    if(n>0)
    {
//      RequestDispatcher rd=req.getRequestDispatcher("login.html");
//      rd.forward(req,res);
      res.sendRedirect("login.html");
    }
    else
      System.out.println("Unable to insert");
    con.close();
    }
    
    catch(Exception e)
    {
      System.out.println(e);
    }
    }
  
}