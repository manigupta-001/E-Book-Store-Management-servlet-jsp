package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;
import com.entity.BookDtls;

public class BookDaoImp implements BookDao {

	private final String INSERT_QUERY = "Insert into book_dtls(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
	private final String DSIPLAY_QUERY = "select * from book_dtls";
	private final String Select_Query = "Select * from book_dtls where bookId= ?";
	private final String UPDATE_QUERY= "Update book_dtls set bookname=? ,author=? , price=?,status=?  where bookId=?";
	private final String DELETE_QUERY = "delete from book_dtls where bookId=?";
	private final String Display_NEW_BOOKS = "select * from book_dtls where bookCategory=? and status=? Order by bookId DESC";
	private final String Display_RECENT_BOOKS = "select * from book_dtls where status=? Order by bookId DESC";
	private final String GET_OLD_BOOK_BY_EMAIL = "select * from book_dtls where email=? and bookCategory=?";
	private final String DELETE_OLD_BOOK_BYEMAIL= "delete from book_dtls where email=? and bookCategory =? and bookId=?";
	private final String Display_OLD_BOOKS = "select * from book_dtls where bookCategory=? and status=? Order by bookId DESC";
	
	private final String SEARCH_BOOK_QUERY = "select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status =? ";
	
	public int addBooks(BookDtls bt) {
		try(Connection conn = DBConnect.getConn();
				PreparedStatement ps = conn.prepareStatement(INSERT_QUERY);) {
			ps.setString(1, bt.getBookName());
			ps.setString(2, bt.getAuthor());
			ps.setDouble(3, bt.getPrice());
			ps.setString(4, bt.getBookCategory());
			ps.setString(5, bt.getStatus());
			ps.setString(6, bt.getPhotoName());
			ps.setString(7, bt.getEmail());
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<BookDtls> getAllBooks() {
		List<BookDtls> l1 = new ArrayList<BookDtls>();
		BookDtls bt = null;
		try(Connection conn = DBConnect.getConn();
		PreparedStatement ps = conn.prepareStatement(DSIPLAY_QUERY);) 
		{
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bt = new BookDtls();
				bt.setBookId(rs.getInt("bookId"));
				bt.setBookName(rs.getString("bookname"));
				bt.setAuthor(rs.getString("author"));
				bt.setPrice(rs.getDouble("price"));
				bt.setBookCategory(rs.getString("bookCategory"));
				bt.setStatus(rs.getString("status"));
				bt.setPhotoName(rs.getString("photo"));
				bt.setEmail(rs.getString("email"));
				l1.add(bt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return l1;
		
	}
	
	
	public BookDtls getBookDetails(int id) {
		try(Connection conn = DBConnect.getConn();
				PreparedStatement ps = conn.prepareStatement(Select_Query);)
		{
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return new BookDtls(rs.getString("bookname"), rs.getString("author"), rs.getDouble("price"), rs.getString("bookCategory"), rs.getString("status"), rs.getString("photo"), rs.getString("email"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	
	public int updateBookDetails(BookDtls book) {
		try(Connection conn = DBConnect.getConn();
				PreparedStatement ps = conn.prepareStatement(UPDATE_QUERY);)
		{
			ps.setString(1, book.getBookName());
			ps.setString(2, book.getAuthor());
			ps.setDouble(3, book.getPrice());
			ps.setString(4, book.getStatus());
			ps.setInt(5, book.getBookId());
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public int deleteBookDetails(int bookId) {
		
		try(Connection conn = DBConnect.getConn();
				PreparedStatement ps = conn.prepareStatement(DELETE_QUERY);) 
		{
			ps.setInt(1, bookId);
			
			return ps.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public List<BookDtls> getNewBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls bt = null;
		try(Connection conn = DBConnect.getConn();
		PreparedStatement ps = conn.prepareStatement(Display_NEW_BOOKS);)
		{
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			 int i=1;
			while(rs.next() && i<=4) {
				bt = new BookDtls();
				bt.setBookId(rs.getInt("bookId"));
				bt.setBookName(rs.getString("bookname"));
				bt.setAuthor(rs.getString("author"));
				bt.setPrice(rs.getDouble("price"));
				bt.setBookCategory(rs.getString("bookCategory"));
				bt.setStatus(rs.getString("status"));
				bt.setPhotoName(rs.getString("photo"));
				bt.setEmail(rs.getString("email"));
				list.add(bt);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	  
	public List<BookDtls> getRecentBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls bt = null;
		try(Connection conn = DBConnect.getConn();
		PreparedStatement ps = conn.prepareStatement(Display_RECENT_BOOKS);)
		{
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			 int i=1;
			while(rs.next() && i<=4) {
				bt = new BookDtls();
				bt.setBookId(rs.getInt("bookId"));
				bt.setBookName(rs.getString("bookname"));
				bt.setAuthor(rs.getString("author"));
				bt.setPrice(rs.getDouble("price"));
				bt.setBookCategory(rs.getString("bookCategory"));
				bt.setStatus(rs.getString("status"));
				bt.setPhotoName(rs.getString("photo"));
				bt.setEmail(rs.getString("email"));
				list.add(bt);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookDtls> getOldBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls bt = null;
		try(Connection conn = DBConnect.getConn();
		PreparedStatement ps = conn.prepareStatement(Display_OLD_BOOKS);)
		{
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			 int i=1;
			while(rs.next() && i<=4) {
				bt = new BookDtls();
				bt.setBookId(rs.getInt("bookId"));
				bt.setBookName(rs.getString("bookname"));
				bt.setAuthor(rs.getString("author"));
				bt.setPrice(rs.getDouble("price"));
				bt.setBookCategory(rs.getString("bookCategory"));
				bt.setStatus(rs.getString("status"));
				bt.setPhotoName(rs.getString("photo"));
				bt.setEmail(rs.getString("email"));
				list.add(bt);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	public List<BookDtls> getAllRecentBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls bt = null;
		try(Connection conn = DBConnect.getConn();
		PreparedStatement ps = conn.prepareStatement(Display_RECENT_BOOKS);)
		{
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			 
			while(rs.next()) {
				bt = new BookDtls();
				bt.setBookId(rs.getInt("bookId"));
				bt.setBookName(rs.getString("bookname"));
				bt.setAuthor(rs.getString("author"));
				bt.setPrice(rs.getDouble("price"));
				bt.setBookCategory(rs.getString("bookCategory"));
				bt.setStatus(rs.getString("status"));
				bt.setPhotoName(rs.getString("photo"));
				bt.setEmail(rs.getString("email"));
				list.add(bt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookDtls> getAllOldBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls bt = null;
		try(Connection conn = DBConnect.getConn();
		PreparedStatement ps = conn.prepareStatement(Display_OLD_BOOKS);)
		{
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				bt = new BookDtls();
				bt.setBookId(rs.getInt("bookId"));
				bt.setBookName(rs.getString("bookname"));
				bt.setAuthor(rs.getString("author"));
				bt.setPrice(rs.getDouble("price"));
				bt.setBookCategory(rs.getString("bookCategory"));
				bt.setStatus(rs.getString("status"));
				bt.setPhotoName(rs.getString("photo"));
				bt.setEmail(rs.getString("email"));
				list.add(bt);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookDtls> getAllNewBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls bt = null;
		try(Connection conn = DBConnect.getConn();
		PreparedStatement ps = conn.prepareStatement(Display_NEW_BOOKS);)
		{
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				bt = new BookDtls();
				bt.setBookId(rs.getInt("bookId"));
				bt.setBookName(rs.getString("bookname"));
				bt.setAuthor(rs.getString("author"));
				bt.setPrice(rs.getDouble("price"));
				bt.setBookCategory(rs.getString("bookCategory"));
				bt.setStatus(rs.getString("status"));
				bt.setPhotoName(rs.getString("photo"));
				bt.setEmail(rs.getString("email"));
				list.add(bt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@Override
	public List<BookDtls> getBookByOld(String email, String category) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls bt= null;
		try(Connection conn = DBConnect.getConn();
				PreparedStatement ps = conn.prepareStatement(GET_OLD_BOOK_BY_EMAIL);) 
		{
			ps.setString(1, email);
			ps.setString(2, category);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bt= new BookDtls();
				bt.setBookId(rs.getInt("bookId"));
				bt.setBookName(rs.getString("bookname"));
				bt.setAuthor(rs.getString("author"));
				bt.setPrice(rs.getDouble("price"));
				bt.setBookCategory(rs.getString("bookCategory"));
				bt.setStatus(rs.getString("status"));
				bt.setPhotoName(rs.getString("photo"));
				bt.setEmail(rs.getString("email"));
				list.add(bt);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	

	public int oldBookDelete(String email, String category,int bid) {
	try(Connection conn = DBConnect.getConn();
			PreparedStatement ps = conn.prepareStatement(DELETE_OLD_BOOK_BYEMAIL);) 
	{
		ps.setString(1, email);
		ps.setString(2, category);
		ps.setInt(3, bid);
		
		return ps.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		return 0;
	}
	
	
	public List<BookDtls> getBookBySearch(String ch) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls bt= null;
		try(Connection conn = DBConnect.getConn();
				PreparedStatement ps = conn.prepareStatement(SEARCH_BOOK_QUERY);) 
		{
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bt= new BookDtls();
				bt.setBookId(rs.getInt("bookId"));
				bt.setBookName(rs.getString("bookname"));
				bt.setAuthor(rs.getString("author"));
				bt.setPrice(rs.getDouble("price"));
				bt.setBookCategory(rs.getString("bookCategory"));
				bt.setStatus(rs.getString("status"));
				bt.setPhotoName(rs.getString("photo"));
				bt.setEmail(rs.getString("email"));
				list.add(bt);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
