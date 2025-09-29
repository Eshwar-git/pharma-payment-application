package com.cognizant.healthCare.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class NotificationDaoSql {
	public boolean updateNotification(String medicine) throws SQLException, ClassNotFoundException, IOException {
		Connection conn = DBConnectionHandler.getConnection();
        String sql = "insert into notification (medicine) values(?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, medicine);
        ps.executeUpdate();
		return true;
	}
	
	public List<String> getNotifications() throws ClassNotFoundException, SQLException, IOException{
		List<String> list=new ArrayList<>();
		Connection conn = DBConnectionHandler.getConnection();
        String sql = "select medicine from notification";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs= ps.executeQuery();
        while(rs.next()) {
        	list.add(rs.getString(1));
        }
		return list;
	}
	
	public boolean truncateNotification() throws SQLException, ClassNotFoundException, IOException {
		Connection conn = DBConnectionHandler.getConnection();
        String sql = "TRUNCATE TABLE notification";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.executeUpdate();
		return true;
	}
}
