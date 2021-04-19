package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.ReplyDto;

public class ReplyDao {
	
	// DAO : DB 접근 객체

		private Connection conn; // DB 연결 인터페이스
		private ResultSet rs; // SQL 실행 후 결과 연결 인터페이스

		public ReplyDao() {

			try {

				Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 연결

				conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/web?serverTime=UTC", "root", "1234");

			} catch (Exception e) {
				e.getMessage();
				e.getStackTrace();
			}
		}

		// 다른 클래스에서 DB 사용하기 위한 객체 선언
		private static ReplyDao instance = new ReplyDao();

		// DB 객체 반환 해주는 메소드
		public static ReplyDao getinstance() {

			return instance;

		}
		
		// 댓글 등록 메소드
		public int re_write(ReplyDto replyDto) {
			
			String sql = "insert into reply(reply_boardid, reply_userid, reply_contents)" + "values(?,?,?)";
			
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, replyDto.getReply_boardid());
				pstmt.setString(2, replyDto.getReply_userid());
				pstmt.setString(3, replyDto.getReply_contents());
				
				pstmt.executeUpdate();
				
				return 1;
				
			}catch (Exception e) {
				e.getMessage();
				e.getStackTrace();
			}
			return -1;
		}
		
		// 해당 게시물의 댓글 출력 메소드
		public ArrayList<ReplyDto> getreplylist(int id) {
			
			String sql = "select * from reply where reply_boardid = ? order by reply_num desc";
			
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, id);
				
				rs = pstmt.executeQuery();
				
				ArrayList<ReplyDto> list = new ArrayList<>();
				
				while(rs.next()) {
					
					ReplyDto replyDto = new ReplyDto();
					
					replyDto.setReply_userid(rs.getString(3));
					replyDto.setReply_contents(rs.getString(4));
					
					list.add(replyDto);
					
				}
				return list;
				
			}catch (Exception e) {
				e.getMessage();
				e.getStackTrace();
			}
			return null;
		}

}
