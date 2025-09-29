package com.cognizant.healthCare.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.cognizant.healthCare.model.helpDetails;

@Component
public class helpDetailsDaoSql {

	public boolean updatehelpDetails(helpDetails helpDetails)
			throws SQLException, ClassNotFoundException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		String sql = "insert into helpDetails (customerName,issue,description,dateOfIssue,reply) values(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, helpDetails.getCustomerName());
		ps.setString(2, helpDetails.getIssue());
		ps.setString(3, helpDetails.getDescription());
		ps.setString(4, helpDetails.getDateOfIssue());
		ps.setString(5, helpDetails.getReply());
		ps.executeUpdate();
		return true;
	}
	
	public List<helpDetails> getHelpDetails()
			throws ClassNotFoundException, SQLException, IOException, ParseException {

		Connection conn = DBConnectionHandler.getConnection();
		List<helpDetails> helps = new ArrayList<>();
		String sql = "select * from helpDetails";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			helpDetails helpDetails = new helpDetails();
			helpDetails.setId(rs.getInt(1));
			helpDetails.setCustomerName(rs.getString(2));
			helpDetails.setIssue(rs.getString(3));
			helpDetails.setDescription(rs.getString(4));
			helpDetails.setDateOfIssue(rs.getString(5));
			helpDetails.setReply(rs.getString(6));
			helps.add(helpDetails);
		}
		return helps;
	}
	
	public boolean updateHelp(int ticketId, String reply)
			throws SQLException, ClassNotFoundException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		String sql = "update helpDetails set reply=? where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, reply);
		ps.setInt(2, ticketId);
		ps.executeUpdate();
		return true;
	}


}
