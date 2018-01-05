package com.ccj.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBOperation {
  private static Connection conn;
  private static Statement stmt;
  public static void getConnection(){
	  try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("驱动加载成功");
		String url="jdbc:mysql://localhost:3306/pet";
		conn=DriverManager.getConnection(url,"root","root");
		System.out.println("数据库连接成功");
		stmt=conn.createStatement();
		System.out.println("语句对象创建成功");
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
  }
  
  
  public static int executeUpdate(String s) {
		int result = 0;
		try {
			System.out.println("传递过来的更新语句为:"+s);
			result = stmt.executeUpdate(s);
			System.out.println("执行更新成功");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			System.out.println("执行更新错误");
		}
		return result;
	}
  
  public static ResultSet executeQuery(String s) {
		System.out.println("传递过来的查询语句为:"+s);
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(s);
			System.out.println("执行查询成功");
		} catch (Exception e) {
			
			System.out.println(e.getStackTrace());
			System.out.println(e.getClass());
			System.out.println("执行查询错误！");
		}
		return rs;
	}
  
  public static void close()
	{
		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
