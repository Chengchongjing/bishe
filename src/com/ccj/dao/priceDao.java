package com.ccj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ccj.entity.entityPrice;
import com.ccj.util.DBOperation;

public class priceDao {
	 public List readPrice(String key){
		 List<entityPrice> list=new ArrayList<entityPrice>();
		 
		 DBOperation.getConnection();
		 String sql=null;
	     
			 
		if(key != null)
		{
			sql = "select * from price_table where p_id like '%" + key + "%' or p_name like '%" + key + "%'";
		}
		else if(key == null || key =="")
		{
			sql="select * from price_table ";
		}
		 ResultSet rs=DBOperation.executeQuery(sql);
		 try {
			while(rs.next()){
				 int p_id=rs.getInt("p_id");
				 String p_name=rs.getString("p_name");
				 double price=rs.getDouble("price");	
				 entityPrice ep=new entityPrice(p_id, p_name, price);
				 list.add(ep);	 
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 DBOperation.close();
		return list;
		

	}
 }

