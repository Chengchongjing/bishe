package com.ccj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ccj.entity.entityPrice;
import com.ccj.util.DBOperation;
import com.ccj.dao.priceDao;

public class PriceServlet extends HttpServlet {

	private priceDao priceDao = new priceDao();
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
			case "rePrice":
				rePrice(request,response);
				break;
			case "add":
				addProject(request,response);
				break;
			case "del":
				delProject(request,response);
				break;
			case "find":
				findProject(request,response);
				break;
			
		}
	}


	private void findProject(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String key= new String(request.getParameter("key").getBytes("iso-8859-1"),"utf-8");
		DBOperation.getConnection();
		try {
			List<entityPrice>  list = priceDao.readPrice(key);
			
			request.setAttribute("list",list);
			request.getRequestDispatcher("/jsppage/price.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();}
	}


	private void delProject(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		String id= new String(request.getParameter("id").getBytes("iso-8859-1"),"utf-8");
		DBOperation.getConnection();
		try {
			String sql="delete from price_table where p_id = '"+id+"';";
			int rs=DBOperation.executeUpdate(sql);
			 if(rs==1){
				 out.write("<script language='javascript' type='text/javascript'>alert('项目已删除');window.location.href='PriceServlet?action=find&key='</script>");	
			 }else {
				 out.write("<script language='javascript' type='text/javascript'>alert('删除失败');window.location.href='PriceServlet?action=find&key='</script>");	
			 }
		} catch (Exception e) {
			// TODO: handle exception
		  e.printStackTrace();
		}
		DBOperation.close();
	}


	private void addProject(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		String addpid= new String(request.getParameter("addpid").getBytes("iso-8859-1"),"utf-8");
		String addpname= new String(request.getParameter("addpname").getBytes("iso-8859-1"),"utf-8");
		String addprice= new String(request.getParameter("addprice").getBytes("iso-8859-1"),"utf-8");
	   //System.out.println(addpid+"   "+addpname+" "+addprice);
		DBOperation.getConnection();
		try {
			String sql="insert into price_table(p_id,p_name,price) values('"+addpid+"','"+addpname+"','"+addprice+"')";
			int rs1=DBOperation.executeUpdate(sql);
			if(rs1==1){
				out.write("<script language='javascript' type='text/javascript'>alert('添加项目成功');window.location.href='PriceServlet?action=find&key='</script>");
			} else
			{
					out.write("<script language='javascript' type='text/javascript'>alert('添加失败，请确认填写是否正确');window.location.href='PriceServlet?action=find&key='</script>");	
			}
		} catch (Exception e) {
			// TODO: handle exception
		 e.printStackTrace();
		}
		DBOperation.close();
	}


	private void rePrice(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		
		
		 PrintWriter out=response.getWriter();
		 String id= new String(request.getParameter("id").getBytes("iso-8859-1"),"utf-8");
		 String newprice= new String(request.getParameter("newprice").getBytes("iso-8859-1"),"utf-8");
		// System.out.println(id+"       "+newprice);
		 
		 DBOperation.getConnection();
		 try {
			 String sql="update price_table set price='"+newprice+"'where p_id='"+id+"'";
			 int rs=DBOperation.executeUpdate(sql);
			 if(rs==1){
				 out.println("<script language='javascript' type='text/javascript'>window.location.href='PriceServlet?action=find&key='</script>");
			 }else {
				 out.println("<script language='javascript' type='text/javascript'>alert('修改失败请确认输入数值');window.location.href='PriceServlet?action=find&key='</script>");
			 }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 DBOperation.close();
		 
		 
	}
       
}
