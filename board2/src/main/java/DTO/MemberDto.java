package DTO;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MemberDto {
	
	String member_id;
	String member_password;
	String member_name;
	String member_phone;
	String member_email;
	String member_address;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	
	// 회원가입시 메일 보내기
	public static void mailSend(String toEmail) { // 인수로 메일을 입력받아 메일 보내기
		
		String host = "smtp.naver.com"; // 네이버, 구글, 다음 등 호스트
		String user = "tpdnd1012@naver.com"; // 보내는 사람 아이디
		String password = "dnd4293^^*"; // 보내는 사람 비밀번호
		
		Properties properties = new Properties();
		
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", 587); // 네이버 smtp port
		properties.put("mail.smtp.auth", "true"); // 인증회원만
		
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			// javax.mail 에 있는 Session
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		
		});
		
		try {
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user)); // 예외발생
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			message.setSubject("가입해주셔서 감사합니다."); // 제목
			message.setText("다양한 이벤트가 제공됩니다."); // 내용
			
			Transport.send(message); // 메일 보내기
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

}
