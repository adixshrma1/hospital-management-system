package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDao {
	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean register(Doctor doc) {
		boolean b = false;
		
		try {
			String sql = "insert into doctors(name, dob, qualification, specialist, email, mob_number, password) values (?,?,?,?,?,?,?) ";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, doc.getFullName());
			ps.setString(2, doc.getDob());
			ps.setString(3, doc.getQualification());
			ps.setString(4, doc.getSpecialist());
			ps.setString(5, doc.getEmail());
			ps.setString(6, doc.getMobNumber());
			ps.setString(7, doc.getPassword());
			
			int i = ps.executeUpdate();
			
			if(i == 1) b = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	public List<Doctor> getAll(){
		List<Doctor> doctors = new ArrayList<Doctor>();
		
		Doctor doc = null;
		try {
			
			String sql = "select * from doctors";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				doc = new Doctor();
				doc.setId(rs.getInt(1));
				doc.setFullName(rs.getString(2));
				doc.setDob(rs.getString(3));
				doc.setQualification(rs.getString(4));
				doc.setSpecialist(rs.getString(5));
				doc.setEmail(rs.getString(6));
				doc.setMobNumber(rs.getString(7));
				doc.setPassword(rs.getString(8));
				
				doctors.add(doc);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return doctors;
	}
	
	public Doctor getById(int id){
		
		Doctor doc = null;
		try {
			
			String sql = "select * from doctors where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				doc = new Doctor();
				doc.setId(rs.getInt(1));
				doc.setFullName(rs.getString(2));
				doc.setDob(rs.getString(3));
				doc.setQualification(rs.getString(4));
				doc.setSpecialist(rs.getString(5));
				doc.setEmail(rs.getString(6));
				doc.setMobNumber(rs.getString(7));
				doc.setPassword(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return doc;
	}
	
	public boolean update(Doctor doc) {
		boolean b = false;
		
		try {
			String sql = "update doctors set name=?, dob=?, qualification=?, specialist=?, email=?, mob_number=?, password=? where id=? ";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, doc.getFullName());
			ps.setString(2, doc.getDob());
			ps.setString(3, doc.getQualification());
			ps.setString(4, doc.getSpecialist());
			ps.setString(5, doc.getEmail());
			ps.setString(6, doc.getMobNumber());
			ps.setString(7, doc.getPassword());
			ps.setInt(8, doc.getId());
			
			int i = ps.executeUpdate();
			
			if(i == 1) b = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
}
