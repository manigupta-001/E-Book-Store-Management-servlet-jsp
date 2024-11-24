package com.dao;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDao {
	
	public boolean saveOrder(List<BookOrder> books);
	
	public List<BookOrder> getOrderedBookDtls(String email );
	
	public List<BookOrder> getOrderedBookDtls();
}
