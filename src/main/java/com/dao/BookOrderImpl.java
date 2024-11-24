package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;
import com.entity.BookOrder;

public class BookOrderImpl implements BookOrderDao{

	
	private final String INSERT_QUERY = "insert into book_order(order_id,username,email,address,phone,book_name,author,price,payment ) values(?,?,?,?,?,?,?,?,?)";
	private final String DISPLAY_ALL_ORDER_BOOK_BY_EMAIL = "select * from book_order where email=?";
	
	private final String DISPLAY_ALL_ORDER_BOOK = "select * from book_order";
	
	
	
	@Override
	public boolean saveOrder(List<BookOrder> books) {
		boolean f=false;
		try(Connection conn = DBConnect.getConn();	
			 )
			{    
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(INSERT_QUERY);
			   for(BookOrder b : books) {
				   ps.setString(1, b.getOrderId());
				   ps.setString(2, b.getUserName());
				   ps.setString(3, b.getEmail());
				   ps.setString(4, b.getFullAdd());
				   ps.setString(5, b.getPhno());
				   ps.setString(6, b.getBookName());
				   ps.setString(7, b.getAuthor());
				   ps.setDouble(8, b.getPrice());
				   ps.setString(9, b.getPaymentType());
				   ps.addBatch();
				   
			   }
			  int[] count = ps.executeBatch();
			  conn.commit();
			  f=true;
			  conn.setAutoCommit(true);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		return f;
	}
	
	
	@Override
	public List<BookOrder> getOrderedBookDtls(String email) {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder bo = null;
		try(Connection conn = DBConnect.getConn();
			PreparedStatement ps = conn.prepareStatement(DISPLAY_ALL_ORDER_BOOK_BY_EMAIL);)
		{
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bo= new BookOrder();
				bo.setId(rs.getInt("id"));
				bo.setOrderId(rs.getString("order_id"));
				bo.setUserName(rs.getString("username"));
				bo.setEmail(rs.getString("email"));
				bo.setFullAdd(rs.getString("address"));
				bo.setPhno(rs.getString("phone"));
				bo.setBookName(rs.getString("book_name"));
				bo.setAuthor(rs.getString("author"));
				bo.setPrice(rs.getDouble("price"));
				bo.setPaymentType(rs.getString("payment"));
				
				list.add(bo);		
			}
		} catch (Exception e) {
			
		}
		return list;
	}
	
	public List<BookOrder> getOrderedBookDtls() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder bo = null;
		try(Connection conn = DBConnect.getConn();
			PreparedStatement ps = conn.prepareStatement(DISPLAY_ALL_ORDER_BOOK);)
		{
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bo= new BookOrder();
				bo.setId(rs.getInt("id"));
				bo.setOrderId(rs.getString("order_id"));
				bo.setUserName(rs.getString("username"));
				bo.setEmail(rs.getString("email"));
				bo.setFullAdd(rs.getString("address"));
				bo.setPhno(rs.getString("phone"));
				bo.setBookName(rs.getString("book_name"));
				bo.setAuthor(rs.getString("author"));
				bo.setPrice(rs.getDouble("price"));
				bo.setPaymentType(rs.getString("payment"));
				
				list.add(bo);		
			}
		} catch (Exception e) {
			
		}
		return list;
	}
	
	
	
}
