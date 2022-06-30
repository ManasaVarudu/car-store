 
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.WebServlet;
import javax.mail.*;
import javax.mail.event.*;
@WebServlet("/Account1")
public class Account1     {

   
    static final String FROM = "ravuri.poojitha123@gmail.com";
    static final String FROMNAME = "Poojitha";

   
    public static   String TO = "poojithaklu792@gmail.com";
   static final String SMTP_USERNAME = "ravuri.poojitha123@gmail.com";
   
   
    static final String SMTP_PASSWORD = "tejasri123";
   
   
    static final String CONFIGSET = "ConfigSet";
   
   
    static final String HOST = "smtp.gmail.com";
   
    static final int PORT = 587;
   
    static final String SUBJECT = "CARS4U";
   
    static final String BODY = String.join(
       System.getProperty("line.separator"),
       "<h1>CARS4U</h1> ",
       "<img src='https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/this-bugatti-chiron-is-displayed-during-the-vienna-autoshow-news-photo-1600106451.jpg' width=\"830\" height=\"400\"/>",
       "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqViK4Nca4hUkjsGZxDaRolH6ufMN4fenU6g&usqp=CAU'/>",
       "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZSVHua7Xu26HqZeCBRonZaHvjCQ6IMWstoA&usqp=CAU'/>",
       "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBTxIm6t6x7Ib7FTafUCZKtJx7acl6FwBetw&usqp=CAU'/>",
       "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLcc1Gf0crJNxlRq3XWcde64adE7tPB3E6mA&usqp=CAU'/>",
       "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRComvonqa5PiDA1ljHlfOX-lmr7FrlAMaKQQ&usqp=CAU'/>",
       "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVGcoRSYGU8nmUITr__0XQShP5refSuDWLuA&usqp=CAU'>/",
       "<br>",
       "<hr>",
       "<p>This email was sent because you created account in our cars4u website</p>",
       "<p>you can rent various cars in our cars4u website at  reasonable prices</p>",
       "<p>CARS4U main theme is even normal people to travel in top rated cars at</p>",
       "<p> low prices . visit our website when you are free.</p>",
       "<hr>",
       "<center><img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjFCw8zcAribeQV9Do5_-GQqtRyy_4Fzek5A&usqp=CAU'width=\"600\" height=\"150\"/></center>",
       "<h2><b><i>Thank you for creating account in our cars4u website</b></i></h2>"
    );

    public static void emsend(String eemail) throws Exception {

 
    Properties props = System.getProperties();
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.port", PORT);
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.auth", "true");

         
    Session session = Session.getDefaultInstance(props);

       
       
    MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(FROM,FROMNAME));
        TO=eemail;
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
        msg.setSubject(SUBJECT);
        msg.setContent(BODY,"text/html");
       
       
        msg.setHeader("X-SES-CONFIGURATION-SET", CONFIGSET);
           
       
        Transport transport = session.getTransport();
         
        try
        {
            System.out.println("Sending...");
           
             transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
       
            transport.sendMessage(msg, msg.getAllRecipients());
            System.out.println("Email sent!");
        }
        catch (Exception ex) {
            System.out.println("The email was not sent.");
            System.out.println("Error message: " + ex.getMessage());
        }
        finally
        {
           
            transport.close();
        }
       
    }
}

