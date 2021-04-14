package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BoardDto;

public class BoardDao {

	// DAO : DB 접근 객체

	private Connection conn; // DB 연결 인터페이스
	private ResultSet rs; // SQL 실행 후 결과 연결 인터페이스

	public BoardDao() {

		try {

			Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 연결

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/web?serverTime=UTC", "root", "1234");

		} catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
	}

	// 다른 클래스에서 DB 사용하기 위한 객체 선언
	private static BoardDao instance = new BoardDao();

	// DB 객체 반환 해주는 메소드
	public static BoardDao getinstance() {

		return instance;

	}
	
	// 게시물 등록 날짜 메소드
	public String getDate() {
		
		String sql = "select now()"; // DB함수 = NOW() : 현재날짜
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			// 결과물 ------------> PreparedStatement -> SQL -> conn 인터페이스 -> DriverManager클래스 -> 드라이버 -> SQL DB
			// ResultSet인터페이스	SQL 조작 인터페이스					연결 인터페이스
			
			if(rs.next()) {
				
				return rs.getString(1); // 성공하면 날짜 반환
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return ""; // DB 오류
	}
	
	// 게시물 번호 메소드 // 오토키x => 수동 넣기
		// 마지막 게시물 번호 가져오기 +1
			// 삭제시 : 삭제 게시불 번호 뒤로 한칸씩 -1
	public int getnext() {
		
		String sql = "select max(board_id) from Board"; // DB 함수 = MAX(필드명) : 해당 필드의 최대값
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				return rs.getInt(1) + 1; // 마지막 게시물 번호 + 1
				
			}
			
			return 1; // 첫 게시물
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return -1; // 실패(DB 오류)
	}
	
	// 게시물 등록 메소드
	public int write(BoardDto dto) {
		
		String sql = "insert into Board values(?,?,?,?,?,?,?)";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, getnext()); // 만들어 놓은 게시물 번호 메소드 넣기
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContents());
			pstmt.setString(4, dto.getUserID());
			pstmt.setString(5, getDate()); // 만들어 놓은 게시물 등록 메소드 호출
			pstmt.setInt(6, dto.getAvailable());
			pstmt.setString(7, dto.getFile());
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	
	// 게시물 수정 메소드
	public int updateboard(String title, String contents, String file, int id) {
		
		String sql = "update board set board_title = ?, board_contents = ?, board_file = ? where board_id=?";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setString(3, file);
			pstmt.setInt(4, id);
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	
	// 게시물 삭제 메소드 ?? 일반 사용자 -> 삭제 [ 비활성화 = 0 ]
	public int delete(int id) {
		
		String sql = "update board set board_available = 0 where board_id = ?";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, id);
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return -1;
	}
	
	// 게시물 모든 조회 메소드
	public ArrayList<BoardDto> boardlist(){
		
		ArrayList<BoardDto> list = null;
		
		String sql = "select * from board where board_available = 1";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList();
			
			while(rs.next()) {
				
				BoardDto dto = new BoardDto();
				
				dto.setID(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContents(rs.getString(3));
				dto.setUserID(rs.getString(4));
				dto.setDate(rs.getString(5));
				dto.setAvailable(rs.getInt(6));
				dto.setFile(rs.getString(7));
				
				list.add(dto);
			}
			
			return list;
			
		}catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return list;
	}
	
	// 게시물 개별 조회 메소드
	public BoardDto getboard(int id) {
		
		String sql = "select * from board where board_id=?";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				BoardDto dto = new BoardDto();
				
				dto.setID(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContents(rs.getString(3));
				dto.setUserID(rs.getString(4));
				dto.setDate(rs.getString(5));
				dto.setAvailable(rs.getInt(6));
				dto.setFile(rs.getString(7));
				
				return dto;
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
}
