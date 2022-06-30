
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%	
Class.forName("oracle.jdbc.driver.OracleDriver");

// connection establishment
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ep","ep");
Statement statement = con.createStatement();
String sql ="SELECT * FROM cars";
ResultSet rs = statement.executeQuery(sql);
 
 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ravuri Poojitha</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <!-- CSS only -->
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <link  rel="stylesheet" href="style.css">
     
</head>
<body>

<div class="header">
    
    <div class="container">
        
    <nav id="main-nav" class="flex items-cen justify">
        
        <div class="left flex items-cen">
            <a href="#" style="font-size:22px; font-weight: bold;" >Cars Dunia</a>
         
           <div>  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;
               &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;
               &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; 
               &nbsp;    &nbsp;    &nbsp;  
               <a href="practice.html">Buy a Car</a>
               <a href="sell.html">Sell Cars</a>
               <a href="cart1.html">Buy Car Interiors</a>
               <div class="dropdown">
            <button class="dropbtn">MORE</button>
        
           <div class="dropdown-content">
             <a href="calculator.html">EMI Calculator</a>
             <a href="#">Car News</a>
             <a href="#">Ask A Question</a>
             <a href="memes.html">Write a review</a>
             <a href="contact.html">Contact Us!!</a>
             <a href="about.html">About Us!!</a>
            
           </div>
           </div>
            
           </div>     

   </div>
    </nav>
    </div>
    </div>
<h1>Hello Admin! Checkout the details of Users in your site</h1>
<table class="table">
  <thead>
    <tr>
      
      <th scope="col">UserName</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Email</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody>
<%
 
while(rs.next()){
%>

<tr>
<td><%=rs.getString("uname") %></td>
<td><%=rs.getString("fname") %></td>
<td><%=rs.getString("lname") %></td>
<td><%=rs.getString("email") %></td>
<td><button>Delete</button></td>

</tr>
<%
}
%>
</tbody>
</table>
</body>
<footer class="bg-dark text-center text-white">
  <!-- Grid container -->
  <div class="container p-4">
    <!-- Section: Social media -->
  
    <!-- Section: Form -->

    <!-- Section: Text -->
    <section class="mb-4">
      <p>
         Car store: Through our website you can easily buy Cars. Introducing “Click to Buy” - India’s 1st end to end online car buying platform. With “Click to Buy” you can have complete car buying process online by selecting your car, comparing and choosing the right variants...  
      </p>
    </section>
    <!-- Section: Text -->

    <!-- Section: Links -->
    <section class="">
      <!--Grid row-->
      <div class="row">
        <!--Grid column-->
        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Links</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a href="buy.html" class="text-white">Buy Cars</a>
            </li>
            <li>
              <a href="#!" class="text-white">Sell Cars</a>
            </li>
            <li>
              <a href="#!" class="text-white">Link 3</a>
            </li>
            <li>
              <a href="#!" class="text-white">Link 4</a>
            </li>
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Know About Us</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a href="about.html" class="text-white">About Us</a>
            </li>
            <li>
              <a href="news.html" class="text-white">News</a>
            </li>
            <li>
              <a href="contact.html" class="text-white">Contact Us</a>
            </li>
           
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Connect With Us</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a href="#!" class="text-white">Facebook</a>
            </li>
            <li>
              <a href="#!" class="text-white">LinkedIn</a>
            </li>
            <li>
              <a href="#!" class="text-white">Twitter</a>
            </li>
            
          </ul>
        </div>
       
      <!--Grid row-->
    </section>
    <!-- Section: Links -->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2021 Copyright:
    <a class="text-white" href="">Cars Dunia</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
</html>
</html>











