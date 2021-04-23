package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.ProductDto;
import DTO.ReplyDto;

public class ProductDao {
	
	// DAO : DB 접근 객체

		private Connection conn; // DB 연결 인터페이스
		private ResultSet rs; // SQL 실행 후 결과 연결 인터페이스

		public ProductDao() {

			try {

				Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 연결

				conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/web?serverTime=UTC", "root", "1234");

			} catch (Exception e) {
				e.getMessage();
				e.getStackTrace();
			}
		}

		// 다른 클래스에서 DB 사용하기 위한 객체 선언
		private static ProductDao instance = new ProductDao();

		// DB 객체 반환 해주는 메소드
		public static ProductDao getinstance() {

			return instance;

		}
		
		// 제품 등록
		public int productadd(ProductDto dto) {
			
			String sql = "insert into product(product_name, product_price, product_manufacturer, product_category, product_stock, product_conditions, product_file, product_activation, product_salesrate)" + "values(?,?,?,?,?,?,?,?,?)";
			
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getProduct_name());
				pstmt.setInt(2, dto.getProduct_price());
				pstmt.setString(3, dto.getProduct_manufacturer());
				pstmt.setString(4, dto.getProduct_category());
				pstmt.setInt(5, dto.getProduct_stock());
				pstmt.setInt(6, dto.getProduct_conditions());
				pstmt.setString(7, dto.getProduct_file());
				pstmt.setInt(8, dto.getProduct_activation());
				pstmt.setInt(9, dto.getProduct_salesrate());
				
				pstmt.executeUpdate();
				
				return 1;
				
			}catch (Exception e) {
				e.getMessage();
				e.getStackTrace();
			}
			return -1;
		}
		
		// 모든 제품 조회
		public ArrayList<ProductDto> productalllist() {
			
			ArrayList<ProductDto> list = new ArrayList<ProductDto>();
			
			String sql = "select * from product";
			
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					ProductDto dto = new ProductDto(
							rs.getString(2),
							rs.getInt(3),
							rs.getString(4),
							rs.getString(5),
							rs.getInt(6),
							rs.getInt(7),
							rs.getString(8),
							rs.getInt(9),
							rs.getInt(10));
					
					dto.setProduct_id(rs.getInt(1)); // 제품번호
					
					list.add(dto);
					
				}
				
				return list;
				
			}catch (Exception e) {
				e.getMessage();
				e.getStackTrace();
			}
			return list;
		}

}
