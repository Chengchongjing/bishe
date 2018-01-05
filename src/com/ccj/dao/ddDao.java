package com.ccj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ccj.entity.entityDd;
import com.ccj.entity.entityOp;
import com.ccj.util.DBOperation;
import com.sun.crypto.provider.RSACipher;

public class ddDao {
	public  List readDd(String date ){
		List<entityDd> list =new ArrayList<entityDd>();
		List<String> idlist=new ArrayList<String>();
		List<String> projectlist=new ArrayList<String>();
		List<String> pronamelist=new ArrayList<String>();
		System.out.println(date);
		DBOperation.getConnection();
		/* if(date.equals(null)||date.equals("")){
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
			 Date day=new Date(); 
			date = sdf.format(day);
			System.out.println("今天"+date);
		 }*/
		String sql="select * from appointment_info where realtime like '%"+date+"%' and handle=1";
		ResultSet rs= DBOperation.executeQuery(sql);
		try {
			while(rs.next()){
				String id=rs.getString("id");
				System.out.println(id);
				String user_pet_id=rs.getString("user_pet_id");
				Timestamp realtime=rs.getTimestamp("realtime");
				String  project=rs.getString("project");
				//System.out.println(project+"pro");
				
				//分割id
				String[] up = user_pet_id.split("");
				String userid = up[1] + up[2] + up[3] + up[4] + up[5];
				String petid = up[6] + up[7] + up[8];
			
				String petname=null;
				idlist.add(petid);
				projectlist.add(project);
				entityDd dd=new entityDd(id, userid,petname,realtime,project);
				list.add(dd);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		/*  System.out.println("长度"+idlist.size());
		  for(int i=0;i<idlist.size();i++){
			  System.out.println("id"+idlist.get(i));
		  }*/
		  for(int i=0;i<idlist.size();i++){
		       
			  String sql2 = "select pet_type from pet_type where pet_type_id ='"	+ idlist.get(i) + "'";
			  ResultSet rs2 = DBOperation.executeQuery(sql2);
				try {
					while (rs2.next()) {
						String petname = rs2.getString("pet_type");	
						entityDd dd= list.get(i);
						dd.setPetname(petname);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		  }
		  
		  
		 String  projectname="";
		
		  for(int j=0;j<projectlist.size();j++){
			  
			  System.out.println(projectlist.get(j)+"zzz");
			  String s=projectlist.get(j);
			  int a=s.indexOf("+");
					  if(a==-1){
						  String sql3="select * from price_table where p_id='"+s+"'";
						  ResultSet rs3=DBOperation.executeQuery(sql3);
						  try {
							  while(rs3.next()){
								  projectname=rs3.getString("p_name");
						             System.out.println(projectname+"pro");
						  		}
						} catch (Exception e) {
							// TODO: handle exception
						}
					  } 
					  
					  else if(a>=0){
						  projectname="";
						  String[] up =s.split("\\+");
						  System.out.println(up.length+"length");
						  for(int j1=0;j1<up.length;j1++){
							  String sql3="select * from price_table where p_id='"+up[j1]+"'";
							  	ResultSet rs3=DBOperation.executeQuery(sql3);
							 
							  	try {
							  		while(rs3.next()){
							  			String proname=rs3.getString("p_name");
							  			projectname=projectname+"、"+proname;
							  		}
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					}
			   }
						  projectname=projectname.substring(1);
					  }			  
			   pronamelist.add(projectname);
			   
			   
			   
		  }
		  
		  int k=-1;
		    for(String proname :pronamelist){
		    	k++;
		    	entityDd dd= list.get(k);
		    	dd.setProject(proname);
		    }
		  
		  
		return list;
	
	}

}
