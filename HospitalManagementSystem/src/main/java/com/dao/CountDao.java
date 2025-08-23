package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CountDao {
	private Connection conn;

	public CountDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public int countDoctors() {
		int i=0;
		
		try {
			String sql = "select * from doctors";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countUsers() {
		int i=0;
		
		try {
			String sql = "select * from users";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countAppointments() {
		int i=0;
		
		try {
			String sql = "select * from appointments";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countAppointmentsByDoctorId(int id) {
		int i=0;
		
		try {
			String sql = "select * from appointments where doc_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countSpecialists() {
		int i=0;
		
		try {
			String sql = "select * from specialists";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
}
