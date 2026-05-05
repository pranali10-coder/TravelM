package com.ac.travel.servlet;

//The Code I'm Using to send a simple mail

import javax.mail.*;
import javax.mail.internet.*;

import java.util.*;

public class SendMailUsingAuthentication
{
	private static final String SMTP_HOST_NAME = "smtp.gmail.com";
	private static final String SMTP_AUTH_USER = "pranalimore9696@gmail.com";
	private static final String SMTP_AUTH_PWD  = "przf rpty pqex negr";

  public static void main(String args[]) throws Exception
  {

  }

  public boolean postMail( String recipients[ ], String subject ,String body, String from) throws MessagingException
  {
	  
	
	  boolean result=false;
     try {
        boolean debug = false;
       

        Properties props = System.getProperties();
        props.put("mail.smtp.host", SMTP_HOST_NAME);// SMTP host
        props.put("mail.smtp.port", "587");  // TLS port
        props.put("mail.smtp.starttls.enable", "true");// Enable STARTTLS
        props.put("mail.smtp.auth", "true");// Enable authentication
        
        Authenticator auth = new SMTPAuthenticator();
        Session session = Session.getDefaultInstance(props, auth);
        session.setDebug(debug);

        Message msg = new MimeMessage(session);

        InternetAddress addressFrom = new InternetAddress(from);
        msg.setFrom(addressFrom);
        InternetAddress[] addressTo = new InternetAddress[recipients.length];
        for (int i = 0; i < recipients.length; i++) {
            addressTo[i] = new InternetAddress(recipients[i]);
        }
        msg.setRecipients(Message.RecipientType.TO, addressTo);

        msg.setSubject(subject);
       
        MimeBodyPart imagePart = new MimeBodyPart();

        MimeMultipart multipart = new MimeMultipart("related");
 
        BodyPart messageBodyPart = new MimeBodyPart();
        
       
       messageBodyPart.setContent(body, "text/html");
       multipart.addBodyPart(messageBodyPart);

        msg.setContent(multipart);
        Transport.send(msg);

        System.out.println("Sent message successfully....");
        
        result=true;

    } 
    catch (Throwable e) 
    {
        e.printStackTrace();
        result=false;
    }
    
    return result;
 }
/**
* SimpleAuthenticator is used to do simple authentication
* when the SMTP server requires it.
*/
private class SMTPAuthenticator extends javax.mail.Authenticator
{
    public PasswordAuthentication getPasswordAuthentication()
    {
        String username = SMTP_AUTH_USER;
        String password = SMTP_AUTH_PWD;
        return new PasswordAuthentication(username, password);
    }
}

}