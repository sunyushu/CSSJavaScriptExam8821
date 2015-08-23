package com.hand.sql;

import java.sql.*;

public class MysqlConnection {
	private MysqlConnection(){
		
	}
	public static Connection getConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");//装载驱动程序
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila","root","123456");
		return conn;
	}
}