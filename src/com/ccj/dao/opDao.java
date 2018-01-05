package com.ccj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.ccj.entity.entityOp;
import com.ccj.util.DBOperation;

public class opDao {
	public List readOp(String timedate) {
		List<entityOp> list = new ArrayList<entityOp>();
		List<String> petIdlist = new ArrayList<String>();
		DBOperation.getConnection();
		
		String sql ="";
		      if(timedate.equals("")||timedate.equals(null)){
				sql="select * from appointment_info";
		      } else {
		    	  sql="select * from appointment_info where time like '"+timedate+"%'";
		      }
		ResultSet rs = DBOperation.executeQuery(sql);
		try {
			while (rs.next()) {
				String id = rs.getString("id");
				String user_pet_id = rs.getString("user_pet_id");
				Timestamp time = rs.getTimestamp("time");
				String petTpye = null;
				String docid = rs.getString("docter_id");
				int handle=rs.getInt("handle");
				String bz=rs.getString("bz");
				String handleop="";
				Timestamp time2= rs.getTimestamp("realtime");
				 int flag=0;
				 if(handle==0){
					  handleop="未处理预约";
				 } else if(handle==1){
					  handleop="预约已处理";		  
				 } 
				 if(handle==1&&time2==null){
					flag=2;
				}
				 
				
				 if(time2==null&&handle==0){
					 
					 flag=1;
				 }
				 String strtime="";
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 try {
					 if(flag==0)
					 {
						 strtime=sdf.format(time2);
					 }
					 else if(flag==1)
					 {
						 strtime="--";
					 } else if(flag==2){
						 strtime=bz;
					 }
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				 
				 
				String[] up = user_pet_id.split("");
				String opuserid = up[1] + up[2] + up[3] + up[4] + up[5];
				String oppetid = up[6] + up[7] + up[8];
				petIdlist.add(oppetid);
				System.out.println(strtime+"ssss");
				System.out.println(opuserid + "  " + oppetid + "  " + time);
				entityOp op = new entityOp(id, time, opuserid, oppetid, docid,
						petTpye,handleop,strtime);
				list.add(op);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		int i=-1;
		for (String s : petIdlist) {
			i++;
			
			String sql2 = "select pet_type from pet_type where pet_type_id ='"	+ s + "'";

			ResultSet rs2 = DBOperation.executeQuery(sql2);
			try {
				while (rs2.next()) {
					String petType = rs2.getString("pet_type");
					// System.out.println(petType+"aaa");
					entityOp op= list.get(i);
					op.setPettype(petType);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;

	}

	public int[] countnum(String timedate){
		//Date d = new Date(); 
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		//String now = sdf.format(d);
		//System.out.println("格式化后的日期：" + now);
		String sql="select * from appointment_info where realtime like '"+timedate+"%' ";
		List<Timestamp> list =new ArrayList<Timestamp>();
		 
		DBOperation.getConnection();
		ResultSet rs = DBOperation.executeQuery(sql);
		 int t1=0,t2=0,t3=0,t4=0,t5=0,t6=0,t7=0,t8=0,t9=0,t10=0;
		try {
			while(rs.next())
				{
				Timestamp nowtime=rs.getTimestamp("realtime");
				list.add(nowtime);
				}
			for(int i = 0; i < list.size();i++){
			    Timestamp value = list.get(i);                                                 //组下标越界错误
			    
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
				String now = sdf.format(value);
				
				 String[] up = now.split(" ");
				    String nowtime = up[1];
				  
				  String[] up1 = nowtime.split(":");
				    String nowtime1=up1[0];
				    List<String> list2=new ArrayList<String>();
				     list2.add(nowtime1);
				    System.out.println("____________"+nowtime1);
				    
				      if(nowtime1.equals("08")){
				    	  t1++;
				      }  else if(nowtime1.equals("09")){
				    	  t2++;
				      }  else if(nowtime1.equals("10")){
				    	  t3++;
				      } else if(nowtime1.equals("11")){
				    	  t4++;
				      } else if(nowtime1.equals("14")){
				    	  t5++;
				      } else if(nowtime1.equals("15")){
				    	  t6++;
				      } else if(nowtime1.equals("16")){
				    	  t7++;
				      } else if(nowtime1.equals("19")){
				    	  t8++;
				      } else if(nowtime1.equals("20")){
				    	  t9++;
				      } else {
				    	  t10++;
				      }
				      
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 
		System.out.println(t1+""+t2+t3+t4+t5+t6+t7+t8+t9+t10);
		int[] a = {t1,t2,t3,t4,t5,t6,t7,t8,t9,t10};
		return a;
		
	}
	/*public static void main(String[] args) {
		opDao dao = new opDao();
		dao.countnum();
	}*/
}
