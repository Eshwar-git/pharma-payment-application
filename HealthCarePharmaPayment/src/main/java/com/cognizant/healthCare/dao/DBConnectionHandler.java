package com.cognizant.healthCare.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnectionHandler {
	private static Connection con = null;
	private static Properties props = new Properties();

	public static Connection getConnection() throws ClassNotFoundException, SQLException, IOException {
		FileInputStream fis = null;
		fis = new FileInputStream("src/main/resources/database.properties");
		props.load(fis);
		Class.forName(props.getProperty("driver"));
		con = DriverManager.getConnection(props.getProperty("url"), props.getProperty("username"),
				props.getProperty("password"));

		return con;
	}
}
