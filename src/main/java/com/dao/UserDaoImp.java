package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnect;
import com.entity.User;

public class UserDaoImp  implements UserDao{
	
	
	private final String INSERT_QUERY= "insert into user(name,email,phno,password) values(?,?,?,?)";
	private final String DISPLAY_QUERY = " Select * from user where email =? && password=?";
	private final String CHECK_PWD = "Select * from user where id=? and password = ?";
	private final String UPDATE_QUERY = "update user set name=? , email=?, phno=? where id=? ";
	
	private final String VERIFY_USER = "select * from user where email=?";
	
	
	@Override
	public int userRegister(User user) {
		
		try (Connection conn = DBConnect.getConn();
			 PreparedStatement ps= conn.prepareStatement(INSERT_QUERY);)
		{	
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhno());
			ps.setString(4, user.getPassword());
		    return  ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public User verifyUserDetails(String email, String password) {
		User user = null; 
		try (Connection conn = DBConnect.getConn();
			PreparedStatement ps = conn.prepareStatement(DISPLAY_QUERY);)
		{    	
			
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPhno(rs.getString("phno"));
				user.setPassword(rs.getString("password"));
				user.setAddress(rs.getString("address"));
				user.setCity(rs.getString("city"));
				user.setState(rs.getString("state"));
				user.setPincode(rs.getString("pincode"));
				user.setLandmark(rs.getString("landmark"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return user;
	}
	
	@Override
	public boolean checkPassword(int id,String pwd) {
		boolean f=false;
		try(Connection conn = DBConnect.getConn();
		PreparedStatement ps = conn.prepareStatement(CHECK_PWD);) 
		{
			ps.setInt(1, id);
			ps.setString(2, pwd);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	@Override
	public int updateProfile(User user) {
		try (Connection conn = DBConnect.getConn();
				 PreparedStatement ps= conn.prepareStatement(UPDATE_QUERY);)
			{	
				ps.setString(1, user.getName());
				ps.setString(2, user.getEmail());
				ps.setString(3, user.getPhno());
				ps.setInt(4, user.getId());
			    return ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		
	}
	

	public boolean checkUser(String em) {
		boolean f= true;
		try (Connection conn = DBConnect.getConn();
				 PreparedStatement ps= conn.prepareStatement(VERIFY_USER);)
			{	
				ps.setString(1, em);
				
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					f=false;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return f;
	}
}
