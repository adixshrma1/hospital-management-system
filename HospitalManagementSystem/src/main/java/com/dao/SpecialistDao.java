package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class SpecialistDao {
	private Connection conn;

	public SpecialistDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addSpecialist(String specName) {
		boolean bool = false;
		
		try {
			String sql = "insert into specialists(name) values (?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, specName);
			int i = ps.executeUpdate();
			if(i == 1) {
				bool = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bool;
	}
	
	public List<Specialist> getAll(){
		List<Specialist> list = new ArrayList<>();
		Specialist sp = null;
		
		try {
			String sql = "select * from specialists";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sp = new Specialist();
				sp.setId(rs.getInt(1));
				sp.setName(rs.getString(2));
				list.add(sp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
