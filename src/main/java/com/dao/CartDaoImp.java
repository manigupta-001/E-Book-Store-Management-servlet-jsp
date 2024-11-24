package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

public class CartDaoImp implements CartDao{
	
	
	private final String INSERT_QUERY= "insert into cart(bid,uid,bookName,author,price,total_price) values(?,?,?,?,?,?)";
	private final String GET_BOOK = "Select * from cart where uid=?";
	private final String DELETE_BOOK = "delete from cart where bid=? and uid=? and cid=?";
	
	
	public int addCart(Cart c) {
		try(Connection conn = DBConnect.getConn();
			PreparedStatement ps = conn.prepareStatement(INSERT_QUERY);  )
		{
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	
	public List<Cart> getBookByUser(int userId) {
		Cart c = null;
		List<Cart> l1 = new ArrayList<Cart>();
		double totalPrice=0;
		try(Connection conn = DBConnect.getConn();
				PreparedStatement ps = conn.prepareStatement(GET_BOOK);  )
			{
			     ps.setInt(1, userId);
			     ResultSet rs = ps.executeQuery();
			     while(rs.next()) {
			    	 c = new Cart();
			    	 c.setCid(rs.getInt("cid"));
			    	 c.setBid(rs.getInt("bid"));
			    	 c.setUserId(rs.getInt("uid"));
			    	 c.setBookName(rs.getString("bookName"));
			    	 c.setAuthor(rs.getString("author"));
			    	 c.setPrice(rs.getDouble("price"));
			    	 
			    	 totalPrice= totalPrice+rs.getDouble("total_price");
			    	 c.setTotalPrice(totalPrice);
			    	 l1.add(c);
			     }
			} catch(Exception e) {
				e.printStackTrace();
			}
		return l1;
	}
	
	@Override
	public int deleteBook(int bid,int uid, int cid) {
		try(Connection conn = DBConnect.getConn();
				PreparedStatement ps = conn.prepareStatement(DELETE_BOOK);  )
			{
			     ps.setInt(1, bid);
			     ps.setInt(2, uid);
			     ps.setInt(3, cid);
			     return ps.executeUpdate();
			    
			} catch(Exception e) {
				e.printStackTrace();
			}
		return 0;
	}
}
