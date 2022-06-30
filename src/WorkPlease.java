import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WorkPlease extends HttpServlet
{
  public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
    res.setContentType("text/html");
    PrintWriter out=res.getWriter();
    out.println("Service method");
   
  }
}