package com.ccj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ccj.util.DBOperation;


public class UserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			response.setContentType("text/html;charset=utf-8");
			request.setCharacterEncoding("utf-8"); 
			this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		
		System.out.print(action);
		
		switch(action)
		{
			case "login":
				login(request,response);
				break;
			case "exit":
				exit(request,response);
				break;
			case "lock":
				lock(request,response);
				break;
			case "add":
				add(request,response);
				break;
			case "count":
			   count(request,response);
			   	break;
			case "upd":
				updateUser(request,response);
				break;
		}
	}
	
	
	
	
	private void updateUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8"); 
		 PrintWriter out=response.getWriter();
		 String id= new String(request.getParameter("id").getBytes("iso-8859-1"),"utf-8");
		 String type= new String(request.getParameter("type").getBytes("iso-8859-1"),"utf-8");
	    DBOperation.getConnection();
	    try {
			String sql="update user_info set user_type='"+type+"'where id='"+id+"'";
			int rs=DBOperation.executeUpdate(sql);
		     if(rs==1){
		    	 response.sendRedirect("jsppage/userTab.jsp");
		     } else {
		    	 out.println("<script language='javascript' type='text/javascript'>alert('修改失败，请确认编号是否输入正确');window.location.href='jsppage/userTab.jsp'</script>");
		     }
		} catch (Exception e) {
			// TODO: handle exception
		 e.printStackTrace();
		}
	}


	private void count(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8"); 
		 PrintWriter out=response.getWriter();
		 
		 
		 String id= new String(request.getParameter("id1").getBytes("iso-8859-1"),"utf-8");
		 String pwd= new String(request.getParameter("pwd").getBytes("iso-8859-1"),"utf-8");
		 String user_type= new String(request.getParameter("user_type").getBytes("iso-8859-1"),"utf-8");
		 DBOperation.getConnection();
		 String sql = "select * from user_info where id = '"+id+"'";
		 ResultSet rs=DBOperation.executeQuery(sql);
		 try {
			if(rs.next())
			{
				out.write("<script language='javascript' type='text/javascript'>alert('该id已存在，请确认后重新输入');window.location.href='jsppage/count.jsp'</script>");
			}
			else {
				String sql2="insert into user_info(id,pwd,user_type) values('"+id+"','"+pwd+"','"+user_type+"')";
				int rs2=DBOperation.executeUpdate(sql2);
				if(rs2==1){
					out.write("<script language='javascript' type='text/javascript'>alert('创建账号成功');window.location.href='jsppage/count.jsp'</script>");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 DBOperation.close();
		 
		 
		//           System.out.println(id+" "+pwd+" "+user_type);
	}


	private void add(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8"); 
		 PrintWriter out=response.getWriter();
		 HttpSession session = request.getSession();
		 String id=(String) session.getAttribute("id");
		 
		 System.out.println(id+"haha");
		 String name= new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
	     String card_id=new String(request.getParameter("card_id").getBytes("iso-8859-1"),"utf-8");
	     String time=new String(request.getParameter("time").getBytes("iso-8859-1"),"utf-8");
	     String phone=new String(request.getParameter("phone").getBytes("iso-8859-1"),"utf-8");
	     String birthdate=new String(request.getParameter("birthdate").getBytes("iso-8859-1"),"utf-8");
	     
	    //System.out.println(name+" "+card_id+" "+time+"  "+phone+" "+birthdate);
	     DBOperation.getConnection();
	    
	     try {
	    	 String sql = "update user_info set name='"+name+"',card_id='"
	    			 	+card_id+"',register_time='"+time+"',phone='"+phone+"',birthdate='"+birthdate+"'where id='"+id+"'";
		     int rs=DBOperation.executeUpdate(sql);
		     if(rs==1){
		    	 out.println("<script language='javascript' type='text/javascript'>alert('编辑成功');window.location.href='jsppage/index.jsp'</script>");
		     }
		       
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	     DBOperation.close();
	}


	private void lock(HttpServletRequest request, 
			HttpServletResponse response)  throws IOException{
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String id=request.getParameter("id");
		System.out.print(id);
		String pass = request.getParameter("pwd");
		
		DBOperation.getConnection();
		String sql = "select * from user_info where id = '"+id+"' and pwd = '"+pass+"'";
		ResultSet rs=DBOperation.executeQuery(sql);
		
		
		
		try {
			if(rs.next()){
				out.write("<script language='javascript' type='text/javascript'>window.location.href='jsppage/index.jsp'</script>");
			}
			else{
				out.write("<script language='javascript' type='text/javascript'>window.location.href='jsppage/lock.jsp'</script>");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBOperation.close();	
	}


	private void exit(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String id=request.getParameter("id");
		System.out.print(id);
		String pass = request.getParameter("pwd");
		
		DBOperation.getConnection();
		String sql = "select * from user_info where id = '"+id+"' and pwd = '"+pass+"'";
		ResultSet rs=DBOperation.executeQuery(sql);
		try {
			if(rs.next()){
				out.write("<script language='javascript' type='text/javascript'>alert('退出成功');window.location.href='jsppage/login.jsp'</script>");
			}
			else{
				out.write("<script language='javascript' type='text/javascript'>alert('退出失败');window.location.href='jsppage/index.jsp'</script>");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBOperation.close();	
	}


	public void login(HttpServletRequest request, HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			out = response.getWriter();
		} catch (IOException e1)
		{
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(id + "     " + pwd);
		
		
		
		
		//打开数据库连接
		DBOperation.getConnection();
		String sql = "select * from user_info where id = '"+id+"' and pwd = '"+pwd+"'";
		//执行查询并返回受影响的行数
		ResultSet rs = DBOperation.executeQuery(sql);
		
		try
		{
			if(rs.next())
			{
				String userId = rs.getString("id");
				String name = rs.getString("name");
				String phone=rs.getString("phone");
				String birthday=rs.getString("birthdate");
				String time=rs.getString("register_time");
				String card=rs.getString("card_id");
				String user_type=rs.getString("user_type");
				
				HttpSession session = request.getSession();
				session.setAttribute("id",userId);
				session.setAttribute("type", user_type);
			
				if(name==null||phone==null||birthday==null||time==null||card==null)
				{out.write("<script language='javascript' type='text/javascript'>alert('您的个人信息不完整，请尽快完善！');</script>");}
				
				out.write("<script language='javascript' type='text/javascript'>window.location.href='index.jsp'</script>");
				
			}
			else
			{
				//JOptionPane.showMessageDialog(null, "添加失败");
				out.write("<script language='javascript' type='text/javascript'>alert('登陆失败');window.location.href='jsppage/login.jsp'</script>");
			}
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//关闭数据库连接
		DBOperation.close();	
	}

}
