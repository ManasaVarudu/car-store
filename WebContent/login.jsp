<%@page import="java.sql.*" %>
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

  String uname=request.getParameter("uname");
  String psswd=request.getParameter("passwd");
  try
  {
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    System.out.println("Driver class loaded");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ep","ep");
    PreparedStatement psmt=con.prepareStatement("select uname,pswrd from cars");
    ResultSet rs=psmt.executeQuery();
     session=request.getSession();
    int f=0;
    while(rs.next()) {
    	 String saltedPassword = SALT + psswd;
    	 String hashedPassword = hash(saltedPassword);
    	      System.out.println(uname+" "+rs.getString("pswrd")+"  "+hashedPassword+" "+psswd);
    if(rs.getString("uname").equals(uname) &&rs.getString("pswrd").equals(hashedPassword)) {
    f=1;
    response.sendRedirect("index.html");
    session.setAttribute("uname", uname);
    }
    }
    if(f==0)
    {
      %>
      <h1 align='center'>Invalid credentials</h1>;
      <%
      RequestDispatcher rd=request.getRequestDispatcher("signup.html");
      rd.include(request, response);
      

    }
  }
    catch(Exception e)
    {
      System.out.println(e);
    }


%>