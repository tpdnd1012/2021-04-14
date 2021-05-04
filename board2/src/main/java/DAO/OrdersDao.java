package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BoardDto;
import DTO.OrdersDto;

public class OrdersDao {

	// DAO : DB 접근 객체

	private Connection conn; // DB 연결 인터페이스
	private ResultSet rs; // SQL 실행 후 결과 연결 인터페이스

	public OrdersDao() {

		try {

			Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 연결

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/web?serverTime=UTC", "root", "1234");

		} catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
	}

	// 다른 클래스에서 DB 사용하기 위한 객체 선언
	private static OrdersDao instance = new OrdersDao();

	// DB 객체 반환 해주는 메소드
	public static OrdersDao getinstance() {

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
	
	public int Orderadd(OrdersDto dto) {
		
		String sql = "insert into orders(orders_memberid, orders_date, orders_name, orders_address, orders_request, orders_fee)" + "values(?,?,?,?,?,?)";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getOrders_memberid());
			pstmt.setString(2, getDate());
			pstmt.setString(3, dto.getOrders_name());
			pstmt.setString(4, dto.getOrders_address());
			pstmt.setString(5, dto.getOrders_request());
			pstmt.setInt(6, dto.getOrders_fee());
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return 0;
	}
}
