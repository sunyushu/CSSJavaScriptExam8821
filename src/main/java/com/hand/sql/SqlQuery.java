package com.hand.sql;

import java.sql.*;

public class SqlQuery {
	private SqlQuery(){}
	//
	////////////////////////////登录查询语句//////////////////////////////////
	//
	public static ResultSet login(Connection conn,String name,String password) throws Exception{
		String sql="SELECT * FROM customer WHERE first_name=? AND last_name=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		return rs;
		
	}
	//
	////////////////////////////登录查询语句//////////////////////////////////
	//
	public static ResultSet selectLanguage(Connection conn) throws Exception{
		String sql="SELECT language_id,name FROM language";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		return rs;
		
	}
	//
	////////////////////////////电影查询语句//////////////////////////////////
	//
	public static ResultSet select_film(Connection conn) throws Exception{
		String sql="SELECT film_id,title,description,`name` FROM film,`language` WHERE film.language_id=`language`.language_id";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		return rs;	
	}
	
	
	
	////////////////////////////customer查询语句//////////////////////////////////
	//
	public static ResultSet select(Connection conn,String name,String password) throws Exception{
		String sql="SELECT first_name,last_name,address_id,email,customer_id,last_update FROM customer WHERE first_name=? and last_name=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		return rs;	
	}
	
	
	public static ResultSet selectWithParam(Connection conn,String line) throws Exception{
		String sql="SELECT film_id,title,description,`name` FROM film,`language` WHERE film.language_id=`language`.language_id AND film_id=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, Integer.parseInt(line));
		ResultSet rs=ps.executeQuery();
		return rs;	
	}
	//
	////////////////////////////电影删除语句//////////////////////////////////
	//
	public static boolean delete_film(Connection conn,String line) throws Exception{
		String sql="SET FOREIGN_KEY_CHECKS = 0;";
		PreparedStatement ps=conn.prepareStatement(sql);
		int i=ps.executeUpdate();

		sql="DELETE FROM film WHERE film_id=?;";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, Integer.parseInt(line));
		i=ps.executeUpdate();
		if(i>=0)
			return true;
		else
			return false;
			
	}
	
	
	
////////////////////////////customer删除语句//////////////////////////////////
//
public static boolean delete(Connection conn,String line) throws Exception{
String sql="SET FOREIGN_KEY_CHECKS = 0;";
PreparedStatement ps=conn.prepareStatement(sql);
int i=ps.executeUpdate();

sql="DELETE FROM customer WHERE customer_id=?";
ps=conn.prepareStatement(sql);
ps.setInt(1, Integer.parseInt(line));
i=ps.executeUpdate();
if(i>=0)
return true;
else
return false;

}
	
	
	
	//
	///////////////////////////customer更新语句//////////////////////////////////
	//
	public static boolean update(Connection conn,String line,String newfirst_name,String newlast_name,String newaddress_id,String newemail,String newlast_update) throws Exception{
//		int newLanguage_id=0;
//		newLanguage=newLanguage.trim();
//		if(newLanguage.equals("English"))
//			newLanguage_id=1;
//		else if(newLanguage.equals("Italian"))
//			newLanguage_id=2;
//		else if(newLanguage.equals("Japanese"))
//			newLanguage_id=3;
//		else if(newLanguage.equals("Mandarin"))
//			newLanguage_id=4;
//		else if(newLanguage.equals("French"))
//			newLanguage_id=5;
//		else if(newLanguage.equals("German"))
//			newLanguage_id=6;
//		else {
//			System.out.println(newLanguage_id);
//			return false;
//		}
			
		
		int i=0;
		String sql="UPDATE customer SET first_name=? WHERE customer_id=?; "; 
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, newfirst_name);
		ps.setInt(2, Integer.parseInt(line));
		i+= ps.executeUpdate();
		
		sql="UPDATE customer SET last_name=? WHERE customer_id=?; ";
		ps=conn.prepareStatement(sql);
		ps.setString(1, newlast_name);
		ps.setInt(2, Integer.parseInt(line));
		i+= ps.executeUpdate();
		
		sql="UPDATE customer SET address_id=? WHERE film_id=?;";
		ps=conn.prepareStatement(sql);
		ps.setString(1, newaddress_id);
		ps.setInt(2, Integer.parseInt(line));
		i+= ps.executeUpdate();
		
		sql="UPDATE customer SET email=? WHERE customer_id=?; ";
		ps=conn.prepareStatement(sql);
		ps.setString(1, newemail);
		ps.setInt(2, Integer.parseInt(line));
		i+= ps.executeUpdate();
		
		sql="UPDATE customer SET last_update=? WHERE customer_id=?; ";
		ps=conn.prepareStatement(sql);
		ps.setString(1, newlast_update);
		ps.setInt(2, Integer.parseInt(line));
		i+= ps.executeUpdate();
			return true;
	}
	//
	////////////////////////////电影插入语句//////////////////////////////////
	//
	public static boolean insert(Connection conn,String newTitle,String newDescription,int newLanguage_id) throws Exception{
		String sql="INSERT INTO film(title,description,language_id) VALUES(?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, newTitle);
		ps.setString(2, newDescription);
		ps.setInt(3, newLanguage_id);
		int i=ps.executeUpdate();

		if(i>=0)
			return true;
		else
			return false;
			
	}

}
