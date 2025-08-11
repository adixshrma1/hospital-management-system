package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	
}
