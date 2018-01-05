<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@page import="com.ccj.dao.opDao,com.ccj.entity.entityOp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

   <title>宠物诊所服务系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


<link rel="stylesheet" href="css/dcalendar.picker.css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">宠物诊所服务系统店员客户端</a>
            </div>
         

            <ul class="nav navbar-top-links navbar-right">
               
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="jsppage/infor.jsp"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                        </li>
                        <li><a href="jsppage/lock.jsp"><i class="fa fa-gear fa-fw"></i> 锁定界面</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="jsppage/login.jsp"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                     
                        <li>
                            <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i> 订单管理</a>
                        </li>
                        
                        
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 订单盘点<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.jsp">销售额明细</a>
                                </li>
                                <li>
                                    <a href="morris.jsp">员工业绩查询</a>
                                </li>
                                <li>
                                    <a href="flot.jsp">宠物用品使用情况</a>
                                </li>
                               
                            </ul>
                       
                        </li>
                        <li>
                            <a href="opServlet?action=find&timedate="><i class="fa fa-table fa-fw"></i> 实时预约情况</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i> 后台数据管理<span class="fa arrow"></span></a>
                             <input type="hidden"  value="<%=session.getAttribute("type")%>" id="type"> 
                            
                             <ul class="nav nav-second-level">
                                <li>
                                    <a onclick="type_sure()" >创建新用户</a>
                                </li>
                                <li>
                                    <a onclick="type_sure1()">员工信息及权限管理</a>
                                </li>
                                <li>
                                    <a onclick="typeSurePrice()">服务项目管理</a>
                                </li>
                                
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> 病历及订单明细<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.jsp">宠物病历汇总</a>
                                </li>
                                <li>
                                    <a href="buttons.jsp">订单明细</a>
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                       
                       
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header" style="color: blue">预约情况柱状图与统计表</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
                 <div class="row">
              	  <div class="col-lg-12">
                    <div class="panel panel-default">
                      <div class="panel-heading" >
                    说明：      默认显示今日预约情况，提供查询功能
                       </div>
                          
                        <canvas id="a_canvas" width="800" height="500"></canvas>
                        <%  int[] num=(int[])request.getAttribute("num");
                         %>
                         <input type="hidden" id="t1" value="<%=num[0]%>">
                          <input type="hidden" id="t2" value="<%=num[1]%>">
                           <input type="hidden" id="t3" value="<%=num[2]%>">
                            <input type="hidden" id="t4" value="<%=num[3]%>">
                             <input type="hidden" id="t5" value="<%=num[4]%>">
                              <input type="hidden" id="t6" value="<%=num[5]%>">
                               <input type="hidden" id="t7" value="<%=num[6]%>">
                                <input type="hidden" id="t8" value="<%=num[7]%>">
                                 <input type="hidden" id="t9" value="<%=num[8]%>">
                                  <input type="hidden" id="t10" value="<%=num[9]%>">
                
                 <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>预约编号</th>
                                        <th>预约时间</th>
                                        <th>用户名</th>
                                        <th>宠物类型</th> 
                                        <th>预约工作人员编号</th> 
                                        <th>预约状态</th> 
                                        <th>确认预约时间</th>                   
                                    </tr>
                                </thead>
                                <tbody>
                                 <%
                                    List<entityOp> list= (List<entityOp>)request.getAttribute("list");
                                   for(entityOp p1:list)
                                 
                                 {%>
                                    <tr class="gradeX">
                                        <td width="100" id=<%=p1.getOpid()%>><%=p1.getOpid()%></td>
                                        <td width="150" id=<%=p1.getOpid()+3%>><%=p1.getOptime()%></td>
                                        <td width="100" id=<%=p1.getOpuser()%>><%=p1.getOpuser()%></td>
                                        <td width="100" id=<%=p1.getPettype()%>><%=p1.getPettype()%></td>
                                        <td width="120" id=<%=p1.getOpid()+2%>><%=p1.getDocid()%></td>
                                        <td width="100" id=<%=p1.getOpid()+1%>  onclick="ophandle()"><%=p1.getHandleop()%></td>
                                        <td width="120" id=<%=p1.getOpid()+4%>><%=p1.getTruetime()%></td>
                                        <td><input type="button" value="拒绝预约" class="btn btn-default" onclick="refuse()" id=<%=p1.getOpid()+5%>></td>
                                         </tr>
                                    <%}                                      
                                   %>
                             
                                   
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <div class="well">
                             <div class="input-group custom-search-form">
                                <label> 按日期查询： <input id='mydatepicker2' type='text' /></label>	 
                                <button class="btn btn-default" type="button" id="btnSearch" onclick="search()">
                                    <i class="fa fa-search"></i>
                                </button>
                                <span class="input-group-btn">
                               <label> <button id="zxca" class="btn btn-default" onclick="showall()">显示全部</button></label>
                            </span>
                                	
                            </div>
                             
                            </div>
                           
                        </div>
                
                </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

   


  <!-- DataTables JavaScript -->
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

	<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/dcalendar.picker.js"></script>
	<script type="text/javascript">
	$('#mydatepicker').dcalendarpicker(); 
	$('#mydatepicker2').dcalendarpicker({
		format:'yyyy-mm-dd'
	}); 
	$('#mycalendar').dcalendar();
</script>
</body>

 <script type="text/javascript">
      function type_sure(){
     
         var type=document.getElementById("type").value;
          //alert(type);
         if(type==1||type==2||type==null){
         window.location.href="noaccess.jsp";
         }
         if(type==3||type==4){
          window.location.href="jsppage/count.jsp";
         }
      }
   </script>
   
     <script type="text/javascript">
      function type_sure1(){
     
         var type=document.getElementById("type").value;
          //alert(type);
         if(type==1||type==2||type==null){
         window.location.href="noaccess.jsp";
         }
         if(type==3||type==4){
          window.location.href="jsppage/userTab.jsp";
         }
      }
   </script>
   
   
   
   <script type="text/javascript">
      function typeSurePrice(){
     
         var type=document.getElementById("type").value;
          //alert(type);
         if(type==1||type==2||type==null){
         window.location.href="noaccess.jsp";
         }
         if(type==3||type==4){
          window.location.href="PriceServlet?action=find&key=";
         }
      }
   </script>
   
   
   
   <script type="text/javascript">
           function ophandle(){
           	$(document).click(function(e){
			var id = $(e.target).attr("id");
		    var x=document.getElementById(id).innerHTML; 
			var tureid=id.substring(0, 11);
			var timeid=tureid+3;
			var x2=document.getElementById(timeid).innerHTML; 
			//alert(x2);
			if(x=="未处理预约")		    
			{   
			     
				var sure=confirm("接受预约？");
				
				if(sure==true)
				 	{
				 		 var  latetime=window.prompt("用户预约时间为"+x2+",将该时间推迟(分钟)为正式预约时间","0"); 
				 		 var url = "opServlet?action=sureop&id=" +tureid+"&latetime="+latetime+"&time="+x2+"";
				 		 if(latetime!=null)
				 			{
				 		 window.location.href=url;
				 		 }
				}
			     else if(sure==false||latetime==null){
			     	location.reload();
			     }
			}
			
			
			   
			/*else if(x=="预约已处理"){
			   var realtime=document.getElementById(tureid+4).value;
			   alert("该预约已处理,预约时间为"+realtime);
			   location.reload();
			}*/
			});
		}             
        </script>
      
      <script  type="text/javascript">
         function search(){
           var timedate=document.getElementById("mydatepicker2").value;
           //alert(timedate);
           var url="opServlet?action=find&timedate="+timedate+"";
            window.location.href=url;
            
         }
      </script>
      
       <script  type="text/javascript">
         function showall(){
          // alert("1");
           var url="opServlet?action=find&timedate=all";
           window.location.href=url;
            
         }
      </script>
      
      
      <script>
    (function (){
 
        window.addEventListener("load", function(){
              var t1=document.getElementById("t1").value;
              var t2=document.getElementById("t2").value;
              var t3=document.getElementById("t3").value;
              var t4=document.getElementById("t4").value;
              var t5=document.getElementById("t5").value;
              var t6=document.getElementById("t6").value;
              var t7=document.getElementById("t7").value;
              var t8=document.getElementById("t8").value;
              var t9=document.getElementById("t9").value;
              var t10=document.getElementById("t10").value;
              
          var data = [t1,t2,t3,t4,t5,t6,t7,t8,t9,t10];
          var xinforma = ['8:00-9:00','9:00-10:00','10:00-11:00','11:00-12:00','14:00-15:00','15:00-16:00','16:00-17:00','19:00-20:00','20:00-21:00','急诊'];
 
          // 获取上下文
          var a_canvas = document.getElementById('a_canvas');
          var context = a_canvas.getContext("2d");
 
 
          // 绘制背景
          var gradient = context.createLinearGradient(0,0,0,300);
 
 
          gradient.addColorStop(0,"#e0e0e0");
          gradient.addColorStop(1,"#ffffff");
 
 
          context.fillStyle = gradient;
 
          context.fillRect(0,0,a_canvas.width,a_canvas.height);
 
          var realheight = a_canvas.height-15;
          var realwidth = a_canvas.width-40;
          // 描绘边框
          var grid_cols = data.length + 1;
          var grid_rows = 4;
          var cell_height = realheight / grid_rows;
          var cell_width = realwidth / grid_cols;
          context.lineWidth = 1;
          context.strokeStyle = "#a0a0a0";
 
          // 结束边框描绘
          context.beginPath();
         
          
            //划横线
            context.moveTo(0,realheight);
            context.lineTo(realwidth,realheight);
                
             
            //画竖线
          context.moveTo(0,20);
           context.lineTo(0,realheight);
          context.lineWidth = 1;
          context.strokeStyle = "black";
          context.stroke();
              
 
          var max_v =0;
          
          for(var i = 0; i<data.length; i++){
            if (data[i] > max_v) { max_v =data[i]};
          }
          max_v = max_v * 1.1;
          // 将数据换算为坐标
          var points = [];
          for( var i=0; i < data.length; i++){
            var v= data[i];
            var px = cell_width * (i +1);
            var py = realheight - realheight*(v / max_v);
            //alert(py);
            points.push({"x":px,"y":py});
          }
 
          //绘制坐标图形
          for(var i in points){
            var p = points[i];
            context.beginPath();
            context.fillStyle="pink";
            
            context.fillRect(p.x,p.y,15,realheight-p.y);
             
            context.fill();
          }
          //添加文字
          for(var i in points)
          {  var p = points[i];
            context.beginPath();
            context.fillStyle="blue";
            context.fillText(data[i], p.x + 1, p.y - 15);
             context.fillText(xinforma[i],p.x + 1,realheight+12);
             context.fillText('预约人数',realwidth,realheight+12);
             context.fillText('时间段',0,10);
              }
        },false);
      })();
       
</script>

<script type="text/javascript">
    function refuse(){
      		$(document).click(function(e){
			var id = $(e.target).attr("id");
			var trueid=id.substring(0, 11);
			var timeid=trueid+1;
		    var x=document.getElementById(timeid).innerHTML; 
		      if(x=="预约已处理"){
		        alert("该预约已处理，无法进行该操作，若有特殊情况请联系顾客");
		        location.reload();
		      }
		      if(x=="未处理预约")
		      {
		       var sure=confirm("拒绝预约?");
		       if(sure==true){
		       		var  reason=window.prompt("请输入拒绝原因","预约时段人数过多请重新选择时段");
		       		var url="opServlet?action=refuse&reason="+reason+"&id="+trueid+"";
		       		  window.location.href=url;
		       	
		         } 
		        else if(sure==false){
		          location.reload();
		        }
		      }
		    
		    });
		    
    }

</script>

</html>
