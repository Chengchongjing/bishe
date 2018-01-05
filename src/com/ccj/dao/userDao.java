package com.ccj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ccj.entity.entityUser;
import com.ccj.util.DBOperation;

public class userDao {
	public List readUser(){
		 List<entityUser> list=new ArrayList<entityUser>();
		 
		 DBOperation.getConnection();
		 String sql;
		 
		 sql="select * from user_info";
		 ResultSet rs=DBOperation.executeQuery(sql);
		 try {
			while(rs.next()){
				 String id=rs.getString("id");
				 String name=rs.getString("name");
				 String card_id=rs.getString("card_id");
				 String phone=rs.getString("phone");
				 String time=rs.getString("register_time");
				 String birthdate=rs.getString("birthdate");
				 int val=rs.getInt("user_type");
				 String typ = "";
				 if(name==null)
				 {
					 name="-";
				 }
				 if(card_id==null)
				 {
					 card_id="-";
				 }
				 
				 if(phone==null)
				 {
					 phone="-";
				 }
				 
				 if(time==null)
				 {
					 time="-";
				 }
				 if(birthdate==null)
				 {
					 birthdate="-";
				 }
				 if(val==1){
					typ="前台接待";
				 }
				 else if(val==2){
					 typ="医护人员";
				 } else if(val==3){
					 typ="店长";
				 }  else if(val==4){
					 typ="超级管理员";
				 }
				 
				 entityUser eu=new entityUser(id, name, phone, card_id, birthdate, time, val, typ);
				 list.add(eu);
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 DBOperation.close();
		return list;
		

	}
}
