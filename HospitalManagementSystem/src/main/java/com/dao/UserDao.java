package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;

public class UserDao {
	private Connection conn;
	
	public UserDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean register(User u) {
		boolean bool = false;
		
		try {
			String sql = "insert into users(fullname, email, password) values (?,?,?) ";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, u.getFullname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int i = ps.executeUpdate();
			if(i==1) bool = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bool;
	}
	
	public User login(String email, String pass) {
		User user = null;
		
		try {
			String sql = "select * from users where email = ? and password = ? ";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean checkPassword(int id, String pass) {
		boolean b = false;
		
		try {
			String sql = "select * from users where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	public boolean changePassword(int id, String pass) {
		boolean b = false;
		
		try {
			String sql = "update users set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pass);
			ps.setInt(2, id);
			int i = ps.executeUpdate();
			if(i==1) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	
}
