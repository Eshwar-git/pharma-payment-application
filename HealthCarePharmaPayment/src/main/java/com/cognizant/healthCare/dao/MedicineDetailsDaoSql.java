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

import com.cognizant.healthCare.model.MedicineDetails;

@Component
public class MedicineDetailsDaoSql {

	public List<MedicineDetails> getMedicineDetails() throws ClassNotFoundException, SQLException, IOException, ParseException{
	        
	        Connection conn = DBConnectionHandler.getConnection();
	        List<MedicineDetails> medicine = new ArrayList<>();
	        String sql = "select * from medicineDetails";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){
	            MedicineDetails medicineDetails = new MedicineDetails();
	            medicineDetails.setMedicineId(rs.getInt(1));
	            medicineDetails.setMedicineName(rs.getString(2));
	            medicineDetails.setManufacturer(rs.getString(3));
	            medicineDetails.setQuantityPerStrip(rs.getString(4));
	            medicineDetails.setMrp(rs.getDouble(5));
	            medicineDetails.setManufacturingDate(rs.getString(6));
	            medicineDetails.setExpiryDate(rs.getString(7));
	            medicineDetails.setType(rs.getString(8));
	            medicineDetails.setDisease(rs.getString(9));
	            medicineDetails.setStock(rs.getInt(10));
	            medicine.add(medicineDetails);
	               
	            }
	        return medicine;  
	}
	
	public int getStockDetails(String medicineName) throws SQLException, ClassNotFoundException, IOException {
		Connection conn = DBConnectionHandler.getConnection();
        String sql = "select stock from medicineDetails where medicineName=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, medicineName);
        ResultSet rs=ps.executeQuery();
        int stock=0;
        while(rs.next()) {
        	stock=rs.getInt(1);
        }
		return stock;
	}
	
	public void updateStockDetails(String medicineName, int stock) throws ClassNotFoundException, SQLException, IOException {
		Connection conn = DBConnectionHandler.getConnection();
        String sql = "update medicineDetails set stock=? where medicineName=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, stock);
        ps.setString(2, medicineName);
        ps.executeUpdate();
	}
	
	public boolean addMedicineDetails(MedicineDetails medicineDetails) throws SQLException, ClassNotFoundException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		String sql="insert into medicineDetails values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, medicineDetails.getMedicineId());
		ps.setString(2, medicineDetails.getMedicineName());
		ps.setString(3, medicineDetails.getManufacturer());
		ps.setString(4, medicineDetails.getQuantityPerStrip());
		ps.setDouble(5, medicineDetails.getMrp());
		ps.setString(6, medicineDetails.getManufacturingDate());
		ps.setString(7, medicineDetails.getExpiryDate());
		ps.setString(8, medicineDetails.getType());
		ps.setString(9, medicineDetails.getDisease());
		ps.setInt(10, medicineDetails.getStock());	
		ps.executeUpdate();
		return true;
	}

	public List<MedicineDetails> getMedicineDetails(String type) throws SQLException, ClassNotFoundException, IOException {
		List<MedicineDetails> medicine = new ArrayList<>();
		Connection con = DBConnectionHandler.getConnection();
		String sql="select * from medicineDetails where type=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, type);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			MedicineDetails detail=new MedicineDetails();
			detail.setMedicineId(rs.getInt(1));
			detail.setMedicineName(rs.getString(2));
			detail.setManufacturer(rs.getString(3));
			detail.setQuantityPerStrip(rs.getString(4));
			detail.setMrp(rs.getDouble(5));
			detail.setManufacturingDate(rs.getString(6));
			detail.setExpiryDate(rs.getString(7));
			detail.setType(rs.getString(8));
			detail.setDisease(rs.getString(9));
			detail.setStock(rs.getInt(10));
			medicine.add(detail);
		}
		return medicine;
	}
	
	public List<MedicineDetails> getMedicineDetailsBySorting(String type) throws SQLException, ClassNotFoundException, IOException {
		List<MedicineDetails> medicine = new ArrayList<>();
		Connection con = DBConnectionHandler.getConnection();
		String sql="select * from medicineDetails Order by "+ type;
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			MedicineDetails detail=new MedicineDetails();
			detail.setMedicineId(rs.getInt(1));
			detail.setMedicineName(rs.getString(2));
			detail.setManufacturer(rs.getString(3));
			detail.setQuantityPerStrip(rs.getString(4));
			detail.setMrp(rs.getDouble(5));
			detail.setManufacturingDate(rs.getString(6));
			detail.setExpiryDate(rs.getString(7));
			detail.setType(rs.getString(8));
			detail.setDisease(rs.getString(9));
			detail.setStock(rs.getInt(10));
			medicine.add(detail);
		}
		return medicine;
	}
	
	
	public boolean deleteMedicineInformation(int medicineId) throws SQLException, ClassNotFoundException, IOException {
		Connection con=DBConnectionHandler.getConnection();
		PreparedStatement ps=con.prepareStatement("delete from medicineDetails where medicineId=?");
		ps.setInt(1, medicineId);
		ps.executeUpdate();
		return true;
	}
	
	public MedicineDetails getMedicineDetailsById(int medicineId) throws SQLException, ClassNotFoundException, IOException {
		MedicineDetails detail=new MedicineDetails();
		Connection con = DBConnectionHandler.getConnection();
		String sql="select * from medicineDetails where medicineId=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, medicineId);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			detail.setMedicineId(rs.getInt(1));
			detail.setMedicineName(rs.getString(2));
			detail.setManufacturer(rs.getString(3));
			detail.setQuantityPerStrip(rs.getString(4));
			detail.setMrp(rs.getDouble(5));
			detail.setManufacturingDate(rs.getString(6));
			detail.setExpiryDate(rs.getString(7));
			detail.setType(rs.getString(8));
			detail.setDisease(rs.getString(9));
			detail.setStock(rs.getInt(10));
		}
		return detail;
	}
	
	public boolean updateMedicineDetails(MedicineDetails medicineDetails) throws SQLException, ClassNotFoundException, IOException {
		Connection con = DBConnectionHandler.getConnection();
		String sql="update medicineDetails set medicineName=?,manufacturer=?,quantityPerStrip=?,manufacturingDate=?,expiryDate=?,type=?,disease=? where medicineName=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, medicineDetails.getMedicineName());
		ps.setString(2, medicineDetails.getManufacturer());
		ps.setString(3, medicineDetails.getQuantityPerStrip());
		ps.setString(4, medicineDetails.getManufacturingDate());
		ps.setString(5, medicineDetails.getExpiryDate());
		ps.setString(6, medicineDetails.getType());
		ps.setString(7, medicineDetails.getDisease());	
		ps.setString(8, medicineDetails.getMedicineName());
		ps.executeUpdate();
		return true;
	}
	
	
}

