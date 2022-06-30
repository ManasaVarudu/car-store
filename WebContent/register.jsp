<%@page import="java.sql.*"
 %>
 <%@page import="java.security.*"
 %>
  <%@page import="java.time.*"  
  
 %>
<%
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String uname=request.getParameter("uname");
String passwd=request.getParameter("passwd");
String cp=request.getParameter("cp");
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

if(passwd.equals(cp)){
try{
      Connection con=null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      System.out.println("Driver class loaded");
      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ep","ep");
      System.out.println("connection");
      PreparedStatement psmt=con.prepareStatement("insert into cars values(?,?,?,?,?,?,?)");
    psmt.setString(2,fname);
    psmt.setString(3,lname);
    psmt.setString(4,email);
    psmt.setString(1,uname);
   String saltedPassword = SALT + passwd;
   	String hashedPassword = hash(saltedPassword);
     System.out.print("Registration: "+uname+" "+passwd+" "+hashedPassword);
    psmt.setString(5,hashedPassword);
    psmt.setString(6,hashedPassword); 
    LocalDate today = LocalDate.now();
     
    psmt.setString(7, today.toString() );
    int n=psmt.executeUpdate();
     if(n>0)
    {            
    
      response.sendRedirect("userlogin.html");
    }
    else
    {
      out.println("check your details");
      response.sendRedirect("signup.html");
    
    }
}
catch(Exception e)
{
  out.println(e);
}
}
else{
  out.println("password not matching");
}
    %>