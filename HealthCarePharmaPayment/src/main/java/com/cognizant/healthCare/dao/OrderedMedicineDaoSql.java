package com.cognizant.healthCare.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

import com.cognizant.healthCare.model.orderedMedicineDetails;

@Component
public class OrderedMedicineDaoSql {
	
	public boolean updateOrderedMedicines(orderedMedicineDetails order) throws ClassNotFoundException, SQLException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		String sql="insert into orderMedicineDetails values(?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, order.getMedicine());
		ps.setInt(2, order.getQuantity());
		ps.setInt(3, order.getOrderId());
		ps.executeUpdate();
		return true;
    }
}
