import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
  
public class sendmail extends HttpServlet {  
public void doGet(HttpServletRequest request,  
 HttpServletResponse response)  
    throws ServletException, IOException {  
  
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
      
    String to=request.getParameter("email");  
    String subject="Hope u will work";
    String msg="Hello testing";  
          
    Mailer.send(to, subject, msg);  
    out.print("message has been sent successfully");  
    out.close();  
    }  
  
}  