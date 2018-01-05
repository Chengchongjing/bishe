package com.ccj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ccj.dao.opDao;
import com.ccj.entity.entityOp;
import com.ccj.entity.entityPrice;
import com.ccj.util.DBOperation;

public class opServlet extends HttpServlet {
     private opDao op=new opDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		System.out.print(action);
		switch(action){
			case "find":
			find (request,response);break;
			case "sureop":
		    sure(request,response);break;
			case "refuse":
			refuse(request,response);break;
		}

	}
	
	
 private void refuse(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
	    response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		String reason= new String(request.getParameter("reason").getBytes("iso-8859-1"),"utf-8");
		String id=request.getParameter("id");
		//System.out.println(reason);
		DBOperation.getConnection();
		String sql="update appointment_info set handle=1,bz='"+reason+"'where id='"+id+"'";
		try {
			int rs=DBOperation.executeUpdate(sql);
			  if(rs==1){
				  System.out.println("1");
				  out.println("<script language='javascript' type='text/javascript'>alert('该预约已拒绝');window.location.href='opServlet?action=find&timedate='</script>");
			  }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

//处理预约时间
	private void sure(HttpServletRequest request, HttpServletResponse response) 
																	throws IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		//推迟分钟数
		 String lateop=request.getParameter("latetime");
		 int latetime=Integer.parseInt(lateop);
		 
		 
		 String opid=request.getParameter("id");
		 String time=request.getParameter("time");
		 String s=request.getParameter("date");
		 
		 System.out.println(time+"xxx"+s);
		 String[] up = time.split(" ");
		 	String up0=up[0];
		 	String up1=up[1];
		 	  System.out.println(up1+"时间="+up0);
		 	   String[] up_ag=up1.split(":");
		 	      String up_ag0=up_ag[0];
		 	      String up_ag1=up_ag[1];
		 	      String up_ag2=up_ag[2];
		 	       
		 	
		 
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		 java.util.Calendar c = Calendar.getInstance();
		 try {
			c.setTime(sdf.parse(time));
			int m = c.get(Calendar.MINUTE);
			int h=c.get(Calendar.HOUR_OF_DAY);
			int m1=m+latetime;
			//System.out.println("小时："+h+"分钟 ："+m1);
			
			  if(m1>=60){
				  int h_over=m1/60;
				  m1=m1%60;
				  h=h+h_over;
				  //System.out.println(m1+"asda"+h);
			  }
			  
			  //String 转化为date在转化为timestamp
			  String newtime=up0+" "+h+":"+m1+":"+up_ag[2];
			  System.out.println("最终时间为"+newtime);
			  Date date =  sdf.parse(newtime);
			  Timestamp timestamp = new Timestamp(date.getTime());
			  
			  DBOperation.getConnection();
			  String sql="update appointment_info set realtime='"+timestamp+"', handle=1 where id='"+opid+"'";
				try {
					int rs=DBOperation.executeUpdate(sql);
					if(rs==1){
						 response.sendRedirect("opServlet?action=find&timedate=");
					} else {
						 out.println("<script language='javascript' type='text/javascript'>alert('修改失败');window.location.href='opServlet?action=find&timedate='</script>");
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			  
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		   
		 
	}

	
	
	
	
	private void find(HttpServletRequest request,
						HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String timedate= new String(request.getParameter("timedate").getBytes("iso-8859-1"),"utf-8");
		System.out.println("timedate="+timedate+"?");
		  if(timedate.equals(null)||timedate.equals(""))  
		  {
			    Date d = new Date(); 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
				String now = sdf.format(d);
				timedate=now;
		  }
		  if(timedate.equals("all"))
		  {
			  timedate="";
		  }
			  
			  try {
			List<entityOp>  list = op.readOp(timedate);
			int a[]=op.countnum(timedate);
			request.setAttribute("list",list);
			request.setAttribute("num",a);
			 /* for(int i=0;i<a.length;i++){
				  System.out.println("haha"+a[i]);
			  }*/
			request.getRequestDispatcher("/jsppage/table.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
