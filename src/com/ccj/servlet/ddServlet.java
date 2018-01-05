package com.ccj.servlet;

import java.io.IOException;
import com.ccj.dao.ddDao;
import com.ccj.entity.entityDd;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ddServlet extends HttpServlet {
     
	private  ddDao dd=new ddDao();
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
		}
	}

	private void find(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		  response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8"); 
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			String timedate= new String(request.getParameter("timedate").getBytes("iso-8859-1"),"utf-8");
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
				List<entityDd> list = dd.readDd(timedate);
				request.setAttribute("list",list);
				request.getRequestDispatcher("/jsppage/dd.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
	}

}
