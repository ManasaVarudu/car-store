<%@ page import="java.sql.*"%>
 <%@page import="java.security.*"
 %>
<%!
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
%>
<%
	String email = request.getParameter("email");


Connection con=null;
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver class loaded");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ep","ep");
System.out.println("connection");
  	PreparedStatement pstmt = con.prepareStatement("select * from cars where email=?");
  	pstmt.setString(1,email);
  	ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		 
		 if(email.equals(email)) {
			 
			 session = request.getSession();
			 session.setAttribute("email", email);
			 session.setMaxInactiveInterval(100);
			 response.sendRedirect("changepwd.html");
				
				 }
	
	  }
	  else
	  {
		  out.println("The email doesnot exit. Try again!");
		 
	  }
	  
%>