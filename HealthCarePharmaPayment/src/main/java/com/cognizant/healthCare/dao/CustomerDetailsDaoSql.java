package com.cognizant.healthCare.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.cognizant.healthCare.model.CustomerDetails;

@Component
public class CustomerDetailsDaoSql {

	public void updateCustomerDetails(CustomerDetails customerDetails)
			throws SQLException, ClassNotFoundException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		PreparedStatement ps = con.prepareStatement(
				"insert into customerDetails values(?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, customerDetails.getFirstName());
		ps.setString(2, customerDetails.getLastName());
		ps.setInt(3, customerDetails.getAge());
		ps.setString(4, customerDetails.getGender());
		ps.setLong(5, customerDetails.getContactNumber());
		ps.setString(6, customerDetails.getEmail());
		ps.setString(7, customerDetails.getUserId());
		ps.setString(8, customerDetails.getPassword());
		ps.setString(9, customerDetails.getSecurityQuestion());
		ps.setString(10, customerDetails.getSecurityAnswer());
		ps.executeUpdate();
	}
	
	public Map<String, String> getCustomerIdAndPassword() throws ClassNotFoundException, SQLException, IOException{
		Map<String, String> customerIdAndPassword=new HashMap<>();
		Connection con=DBConnectionHandler.getConnection();
		PreparedStatement ps=con.prepareStatement("select userId, password from customerDetails");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			customerIdAndPassword.put(rs.getString(1), rs.getString(2));
		}
		return customerIdAndPassword;
	}
	
	public Map<String, String> getSecurityQuestionAndAnswer(String userName) throws ClassNotFoundException, SQLException, IOException{
		Map<String, String> questionAndAnswer=new HashMap<>();
		Connection con=DBConnectionHandler.getConnection();
		PreparedStatement ps=con.prepareStatement("select securityQuestion, securityAnswer from customerDetails where userId=?");
		ps.setString(1, userName);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			questionAndAnswer.put(rs.getString(1), rs.getString(2));
		}
		return questionAndAnswer;
	}
	
	public boolean updatePassword(String userName, String password) throws SQLException, ClassNotFoundException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		String sql = "update customerDetails set password=? where userId=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, password);
		ps.setString(2, userName);
		ps.executeUpdate();
		return true;
		
	}

}
