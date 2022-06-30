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
 

  String fname=request.getParameter("fname");
fname= SALT + fname;
fname= hash(fname);
  String email=request.getParameter("email");
  String addr=request.getParameter("addr");
  addr= SALT + addr;
  addr= hash(addr);
  String city=request.getParameter("city");
  city= SALT + city;
  city= hash(city);
  String state=request.getParameter("state");
  state= SALT + state;
  state= hash(state);
  String pincode=request.getParameter("pincode");
  pincode= SALT + pincode;
  pincode= hash(pincode);
  String ncard=request.getParameter("ncard");
  ncard= SALT + ncard;
  ncard= hash(ncard);
  String cnum=request.getParameter("cnum");
  cnum= SALT + cnum;
  cnum= hash(cnum);
  String expm=request.getParameter("expm");
  expm= SALT + expm;
  expm= hash(expm);
  String expy=request.getParameter("expy");
  expy= SALT + expy;
  expy= hash(expy);
  String cvv=request.getParameter("cvv");
  cvv= SALT + cvv;
  cvv= hash(cvv);
  try
  {
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    System.out.println("Driver class loaded");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ep","ep");
    PreparedStatement psmt=con.prepareStatement("insert into payment values(?,?,?,?,?,?,?,?,?,?,?)");
    
    psmt.setString(1,fname);
    psmt.setString(2,email);
    psmt.setString(3,addr);
    psmt.setString(4,city);
    psmt.setString(5,state);
    psmt.setString(6,pincode);
    psmt.setString(7,ncard);
    psmt.setString(8,cnum);
    psmt.setString(9,expm);
    psmt.setString(10,expy);
 //   cvv=hash(cvv);
    psmt.setString(11,cvv);
    
    int n=psmt.executeUpdate();
     if(n>0)
    {            
     response.sendRedirect("ThankYou.html");
    }
    else
    {
      out.println("check your details");
      response.sendRedirect("buy.html");
    
    }
}
catch(Exception e)
{
  out.println(e);
}
  
   
  
  
  
  
  
  
  
  
  
  

 


%>