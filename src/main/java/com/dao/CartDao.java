package com.dao;

import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

public interface CartDao {

	public int addCart(Cart c);
	
	public List<Cart> getBookByUser(int userId);
	
	public int deleteBook(int bid,int uid,int cid);
}
