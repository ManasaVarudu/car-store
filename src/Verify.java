

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Verify")
public class Verify extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter())
		{
			String name=request.getParameter("uname");
			String email=request.getParameter("email");
			System.out.println(name+" "+email);
			
			sendEmail sm=new sendEmail();
         	String code=sm.getRandom();
         	User user=new User(name,email,code);
         	//System.out.println(user);
         	boolean test=sm.sendEmail1(user);
         	System.out.println(test);
         	if(test)
         	{
         		out.println("Hello");
         		HttpSession session=request.getSession();
         		session.setAttribute("authcode", user);
         		response.sendRedirect("verify.jsp");
         	}
         	else
         	{
         		out.println("Failed to send verification code");
         		
         	}
		}
		 
	}

 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
