import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginpage")
public class login extends HttpServlet
{
public void service(HttpServletRequest req,HttpServletResponse res)throws IOException
{
  res.setContentType("text/html");
  PrintWriter out=res.getWriter();
  String uname=req.getParameter("uname");
  String lpwd=req.getParameter("psrwd");
  try
  {
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    System.out.println("Driver class loaded");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bhavya","bhavya");
    PreparedStatement psmt=con.prepareStatement("select email,pwd from register");
    ResultSet rs=psmt.executeQuery();
    HttpSession session=req.getSession();
    int f=0;
    while(rs.next()) {
    if(rs.getString("uname").equals(uname) &&rs.getString("pswrd").equals(lpwd)) {
    f=1;
    res.sendRedirect("index.html");
    session.setAttribute("uname", uname);
    }
    }
    if(f==0)
    {
      out.println("<h1 align='center'>Invalid credentials</h1>");
      RequestDispatcher rd=req.getRequestDispatcher("login.html");
      rd.include(req, res);
      

    }
  }
    catch(Exception e)
    {
      System.out.println(e);
    }
}
}