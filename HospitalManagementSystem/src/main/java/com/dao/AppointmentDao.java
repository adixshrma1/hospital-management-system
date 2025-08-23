package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDao {
	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addAppointment(Appointment apt) {
		boolean b = false;
		
		try {
			String sql = "insert into appointments(user_id,fullname,gender,age,apt_date,email,ph_no,disease,doc_id,address,status)"
					+ " values (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, apt.getUserId());
			ps.setString(2, apt.getFullName());
			ps.setString(3, apt.getGender());
			ps.setString(4, apt.getAge());
			ps.setString(5, apt.getAptDate());
			ps.setString(6, apt.getEmail());
			ps.setString(7, apt.getPhNo());
			ps.setString(8, apt.getDisease());
			ps.setInt(9, apt.getDoctorId());
			ps.setString(10, apt.getAddress());
			ps.setString(11, apt.getStatus());
			
			int i = ps.executeUpdate();
			if(i == 1) b = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	public List<Appointment> getAllAppointment(){
		List<Appointment> appointments = new ArrayList<Appointment>();
		
		Appointment ap = null;
		try {
			
			String sql = "select * from appointments ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAptDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDisease(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
				appointments.add(ap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return appointments;
	}
	
	public List<Appointment> getAllAppointmentByUserId(int userId){
		List<Appointment> appointments = new ArrayList<Appointment>();
		
		Appointment ap = null;
		try {
			
			String sql = "select * from appointments where user_id = " + userId;
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAptDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDisease(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
				appointments.add(ap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return appointments;
	}
	
	public List<Appointment> getAllAppointmentByDoctorId(int docId){
		List<Appointment> appointments = new ArrayList<Appointment>();
		
		Appointment ap = null;
		try {
			
			String sql = "select * from appointments where doc_id = " + docId;
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAptDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDisease(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
				appointments.add(ap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return appointments;
	}
	
	public Appointment getAppointmentById(int id){	
		Appointment ap = null;
		try {
			String sql = "select * from appointments where id = " + id;
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAptDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDisease(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ap;
	}
	
	public boolean updateStatus(int id, String comment) {
		boolean b = false;
		
		try {

			String sql = "update appointments set status=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comment);
			ps.setInt(2, id);
			int i = ps.executeUpdate();
			if(i==1) b = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return b;
	}
}
