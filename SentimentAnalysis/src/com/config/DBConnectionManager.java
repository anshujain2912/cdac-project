package com.config;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class DBConnectionManager{
	private Connection connection;
	public DBConnectionManager(String dbUrl,String dbUser,String dbPassword) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		this.connection=DriverManager.getConnection(dbUrl,dbUser,dbPassword);
	}
	public Connection getConnection() {
		return this.connection;
	}
}
