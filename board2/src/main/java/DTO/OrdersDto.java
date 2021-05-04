package DTO;

public class OrdersDto {
	
	private int orders_id;
	private String orders_memberid;
	private String orders_date;
	private String orders_name;
	private String orders_address;
	private String orders_request;
	private int orders_fee;
	
	
	
	public int getOrders_id() {
		return orders_id;
	}
	public void setOrders_id(int orders_id) {
		this.orders_id = orders_id;
	}
	public String getOrders_memberid() {
		return orders_memberid;
	}
	public void setOrders_memberid(String orders_memberid) {
		this.orders_memberid = orders_memberid;
	}
	public String getOrders_date() {
		return orders_date;
	}
	public void setOrders_date(String orders_date) {
		this.orders_date = orders_date;
	}
	public String getOrders_name() {
		return orders_name;
	}
	public void setOrders_name(String orders_name) {
		this.orders_name = orders_name;
	}
	public String getOrders_address() {
		return orders_address;
	}
	public void setOrders_address(String orders_address) {
		this.orders_address = orders_address;
	}
	public String getOrders_request() {
		return orders_request;
	}
	public void setOrders_request(String orders_request) {
		this.orders_request = orders_request;
	}
	public int getOrders_fee() {
		return orders_fee;
	}
	public void setOrders_fee(int orders_fee) {
		this.orders_fee = orders_fee;
	}
	
	
}
