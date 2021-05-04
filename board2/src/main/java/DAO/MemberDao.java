package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BoardDto;
import DTO.MemberDto;

public class MemberDao {

	// DAO : DB 접근 객체

	private Connection conn; // DB 연결 인터페이스
	private ResultSet rs; // SQL 실행 후 결과 연결 인터페이스

	public MemberDao() {

		try {

			Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 연결

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/web?serverTime=UTC", "root", "1234");

		} catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
	}

	// 다른 클래스에서 DB 사용하기 위한 객체 선언
	private static MemberDao instance = new MemberDao();

	// DB 객체 반환 해주는 메소드
	public static MemberDao getinstance() {

		return instance;

	}

	// 회원가입 메소드
	public int signup(MemberDto dto) {

		String sql = "insert into member2 values(?,?,?,?,?,?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getMember_id());
			pstmt.setString(2, dto.getMember_password());
			pstmt.setString(3, dto.getMember_name());
			pstmt.setString(4, dto.getMember_phone());
			pstmt.setString(5, dto.getMember_email());
			pstmt.setString(6, dto.getMember_address());

			pstmt.executeUpdate();

			return 1;

		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	
	// 로그인 메소드
	public int login(String id, String password) {
		
		String sql = "select * from member2 where member_id = ? and member_password = ?";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				return 1; // 로그인 성공
				
			}
			
		}catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return -1; // 실패
	}
	
	// 회원 조회 메소드
		public MemberDto getmember(String id) {
			
			String sql = "select * from member2 where member_id = ?";
			
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					MemberDto dto = new MemberDto();
					
					dto.setMember_id(rs.getString(1));
					dto.setMember_password(rs.getString(2));
					dto.setMember_name(rs.getString(3));
					dto.setMember_phone(rs.getString(4));
					dto.setMember_email(rs.getString(5));
					dto.setMember_address(rs.getString(6));
					
					return dto;
					
				}
				
			}catch (Exception e) {
				e.getMessage();
				e.getStackTrace();
			}
			return null;
		}
}
