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

import com.cognizant.healthCare.model.CartDetails;
import com.cognizant.healthCare.model.MedicineDetails;

@Component
public class CartDetalsDaoSql {

	public List<CartDetails> getCartDetails(int orderId) throws ClassNotFoundException, SQLException, IOException{
		List<CartDetails> cart=new ArrayList<>();
		Connection conn = DBConnectionHandler.getConnection();
		String sql="select medicine, quantity from orderMedicineDetails where orderId=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, orderId);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			CartDetails cartDetails=new CartDetails();
			cartDetails.setMedicine(rs.getString(1));
			cartDetails.setQuantity(rs.getInt(2));
			cart.add(cartDetails);
		}
		return cart;
	}
	
	public boolean removeOrderItem(int orderId, String Medicine) throws SQLException, ClassNotFoundException, IOException {
		Connection con=DBConnectionHandler.getConnection();
		PreparedStatement ps=con.prepareStatement("delete from orderMedicineDetails where orderId=? and medicine=?");
		ps.setInt(1, orderId);
		ps.setString(2, Medicine);
		ps.executeUpdate();
		return true;
	}
	
	public double amountOfOrderedItems(List<CartDetails> cartDetails) throws ClassNotFoundException, SQLException, IOException {
		Connection con=DBConnectionHandler.getConnection();
		double mrp=0;
		double price=0;
		for(CartDetails cart:cartDetails) {
			PreparedStatement ps=con.prepareStatement("select mrp from medicineDetails where medicineName=?");
			ps.setString(1, cart.getMedicine());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				mrp=rs.getDouble(1);
			}
			price=price+(mrp*cart.getQuantity());
		}
		return price;
	}
}
