package com.cognizant.healthCare.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.cognizant.healthCare.model.AdminDetails;

@Component
public class AdminDetailsDaoSql {

		public boolean updateAdminDetails(AdminDetails adminDetails) throws SQLException, ClassNotFoundException, IOException {
			Connection con = DBConnectionHandler.getConnection();
			String sql="insert into adminDetails values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, adminDetails.getFirstName());
			ps.setString(2, adminDetails.getLastName());
			ps.setInt(3, adminDetails.getAge());
			ps.setString(4, adminDetails.getGender());
			ps.setString(5, adminDetails.getContactNumber());
			ps.setString(6, adminDetails.getEmail());
			ps.setString(7, adminDetails.getAdminId());
			ps.setString(8, adminDetails.getPassword());
			ps.setString(9, adminDetails.getSecurityQuestion());
			ps.setString(10, adminDetails.getSecurityAnswer());
			ps.executeUpdate();
			return true;
		}
	
	public Map<String, String> getAdminIdAndPassword() throws ClassNotFoundException, SQLException, IOException{
		Map<String, String> adminIdAndPassword=new HashMap<>();
		Connection con=DBConnectionHandler.getConnection();
		PreparedStatement ps=con.prepareStatement("select adminId, password from adminDetails");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			adminIdAndPassword.put(rs.getString(1), rs.getString(2));
		}
		return adminIdAndPassword;
	}
	
	public Map<String, String> getSecurityQuestionAndAnswer(String userName) throws ClassNotFoundException, SQLException, IOException{
		Map<String, String> questionAndAnswer=new HashMap<>();
		Connection con=DBConnectionHandler.getConnection();
		PreparedStatement ps=con.prepareStatement("select securityQuestion, securityAnswer from adminDetails where adminId=?");
		ps.setString(1, userName);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			questionAndAnswer.put(rs.getString(1), rs.getString(2));
		}
		return questionAndAnswer;
	}
	
	public boolean updatePassword(String userName, String password) throws SQLException, ClassNotFoundException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		String sql = "update adminDetails set password=? where adminId=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, password);
		ps.setString(2, userName);
		ps.executeUpdate();
		return true;
		
	}

}
