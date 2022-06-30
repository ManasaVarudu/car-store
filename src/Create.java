import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Create 
{
  public static void main(String args[])
  {
    try
    {
      Connection con=null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      System.out.println("Driver class loaded");
      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ep","ep");
      System.out.println("connection established");
      Statement stmt = con.createStatement();
      String qry="create table cars(uname varchar(30) not null,fname varchar(30),lname varchar(30),email varchar(40),pswrd varchar(30),cpswrd varchar(30))";
      stmt.executeUpdate(qry);
      System.out.println("Table created");
    }
    catch(Exception e)
    {
      System.out.println(e);
    }
  }
}