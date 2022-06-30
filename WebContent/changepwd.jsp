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
	String password = request.getParameter("password");
	session = request.getSession();
	String email = request.getParameter("email");	
     System.out.println(password+" "+email);
	  Connection con=null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      System.out.println("Driver class loaded");
      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ep","ep");
      System.out.println("connection");
  	PreparedStatement pstmt = con.prepareStatement("update cars set pswrd=? where email=?");
  	 String saltedPassword = SALT + password;
	 String hashedPassword = hash(saltedPassword);
  	pstmt.setString(2,email);
  	pstmt.setString(1,hashedPassword);
  	pstmt.executeUpdate();
  	out.println("Password reset successfully!");
  	 
	  
%>