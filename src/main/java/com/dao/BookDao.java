package com.dao;

import java.util.List;

import com.entity.BookDtls;

public interface BookDao {

	public int addBooks(BookDtls bt);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookDetails(int id);
	
	public int updateBookDetails(BookDtls book);
	
	public int deleteBookDetails(int bookId);
	
	public List<BookDtls> getNewBooks();
	
	public List<BookDtls> getRecentBooks();
	
	public List<BookDtls> getOldBooks();
	
	public List<BookDtls> getAllRecentBooks();
	
	public List<BookDtls> getAllNewBooks();
	
	public List<BookDtls> getAllOldBooks();
	
	public List<BookDtls> getBookByOld(String email,String category);
	
	public int oldBookDelete(String email,String category,int bid);
	
	public List<BookDtls> getBookBySearch(String ch);
}
