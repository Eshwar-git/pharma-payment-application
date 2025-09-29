package com.cognizant.healthCare.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.cognizant.healthCare.model.CartDetails;
import com.cognizant.healthCare.model.MedicineDetails;
import com.cognizant.healthCare.model.orderDetails;
import com.cognizant.healthCare.model.orderedMedicineDetails;

@Component
public class OrderDetailsDaoSql {
	public boolean updateOrderDetails(orderDetails orderDetails)
			throws SQLException, ClassNotFoundException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		String sql = "insert into orderDetails (patientName,age,doctorName,dateOfOrder,customerName) values(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, orderDetails.getPatientName());
		ps.setInt(2, orderDetails.getAge());
		ps.setString(3, orderDetails.getDoctorName());
		ps.setString(4, orderDetails.getDateOfOrder());
		ps.setString(5, orderDetails.getCustomerName());
		ps.executeUpdate();
		return true;
	}

	public int getOrderId(String customerName) throws SQLException, ClassNotFoundException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		String sql = "select orderId from orderDetails where customerName=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customerName);
		ResultSet rs = ps.executeQuery();
		int orderId = 0;
		while (rs.next()) {
			orderId = rs.getInt(1);
		}
		return orderId;
	}

	public List<orderDetails> getOrderDetails()
			throws ClassNotFoundException, SQLException, IOException, ParseException {

		Connection conn = DBConnectionHandler.getConnection();
		List<orderDetails> orders = new ArrayList<>();
		String sql = "select * from orderDetails";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			orderDetails orderDetails = new orderDetails();
			orderDetails.setOrderId(rs.getInt(1));
			orderDetails.setPatientName(rs.getString(2));
			orderDetails.setAge(rs.getInt(3));
			orderDetails.setDoctorName(rs.getString(4));
			orderDetails.setDateOfOrder(rs.getString(5));
			orderDetails.setCustomerName(rs.getString(6));
			orderDetails.setOrderStatus(rs.getString(7));
			orders.add(orderDetails);
		}
		return orders;
	}
	
	public List<HashMap<String, Integer>> getorderedMedicines(List<orderDetails> orderDetails) throws ClassNotFoundException, SQLException, IOException {
		Connection con=DBConnectionHandler.getConnection();
		List<HashMap<String, Integer>> list = new ArrayList<HashMap<String, Integer>>();
		for(orderDetails order:orderDetails) {
			PreparedStatement ps=con.prepareStatement("select medicine, quantity from orderMedicineDetails where orderId=?");
			ps.setInt(1, order.getOrderId());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				HashMap<String, Integer> map=new HashMap<>();
				map.put(rs.getString(1), rs.getInt(2));
				list.add(map);
			}	
		}
		return list;
	}
	
	public boolean updateStatus(int orderId, String status)
			throws SQLException, ClassNotFoundException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		String sql = "update orderDetails set status=? where orderId=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, status);
		ps.setInt(2, orderId);
		ps.executeUpdate();
		return true;
	}
}
