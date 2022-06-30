import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class sendEmail {

	 public String getRandom()
	 {
		 Random rnd=new Random();
		 int number=rnd.nextInt(999999);
		 
		 return String.format("%06d", number);
	 }
	 public boolean sendEmail1(User user)
	 {
		 boolean test=false;
		 
		 String fromEmail="ravuri.poojitha123@gmail.com";
		 String password="tejasri123";
		 String toEmail=user.getEmail();
		 System.out.println(toEmail);
		 try {
			 Properties pr=new Properties();
			 pr.put("mail.smtp.host", "smtp.gmail.com");
			 pr.put("mail.smtp.port", "587");
		      pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			 pr.put("mail.smtp.auth", "true");
			 pr.put("mail.smtp.starttls.enable", "true");
			 
			 
			 Authenticator auth = new Authenticator() {
		            public PasswordAuthentication getPasswordAuthentication() {
		                return new PasswordAuthentication(fromEmail, password);
		            }
		        };
		 
		        Session session = Session.getInstance(pr, auth);
		 
		        // creates a new e-mail message
		        Message msg = new MimeMessage(session);
		 
		        msg.setFrom(new InternetAddress(fromEmail));
		        InternetAddress[] toAddresses = { new InternetAddress(toEmail) };
		        msg.setRecipients(Message.RecipientType.TO, toAddresses);
		        msg.setSubject("Pwd verification");
		        msg.setSentDate(new Date());
		        msg.setText("otp"+user.code);
		 
		        // sends the e-mail
		        Transport.send(msg);
			 
			 
			 
//			 // get session
//			 Session session=Session.getInstance(pr, new Authenticator(){
//				 @Override
//				 protected PasswordAuthentication getPasswordAuthentication() {
//					 return new PasswordAuthentication(fromEmail,password);
//				 }
//			 });
//			 
//			 Message msg=new MimeMessage(session);
//			 msg.setFrom(new InternetAddress(fromEmail));
//			 msg.setRecipient(Message.RecipientType.TO,new InternetAddress(toEmail));
//			 msg.setSubject("User Email Verification");
//			 msg.setText("Please use this OTP to reset your password"+user.code);
//			 System.out.println(user.code);
//			 Transport.send(msg);
			 
			 test=true;
			 
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 
		 
		 return test;
	 }
}
