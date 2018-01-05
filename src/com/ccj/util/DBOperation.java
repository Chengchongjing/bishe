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
		System.out.println("�������سɹ�");
		String url="jdbc:mysql://localhost:3306/pet";
		conn=DriverManager.getConnection(url,"root","root");
		System.out.println("���ݿ����ӳɹ�");
		stmt=conn.createStatement();
		System.out.println("�����󴴽��ɹ�");
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
  }
  
  
  public static int executeUpdate(String s) {
		int result = 0;
		try {
			System.out.println("���ݹ����ĸ������Ϊ:"+s);
			result = stmt.executeUpdate(s);
			System.out.println("ִ�и��³ɹ�");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			System.out.println("ִ�и��´���");
		}
		return result;
	}
  
  public static ResultSet executeQuery(String s) {
		System.out.println("���ݹ����Ĳ�ѯ���Ϊ:"+s);
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(s);
			System.out.println("ִ�в�ѯ�ɹ�");
		} catch (Exception e) {
			
			System.out.println(e.getStackTrace());
			System.out.println(e.getClass());
			System.out.println("ִ�в�ѯ����");
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
