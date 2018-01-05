<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@page import="com.ccj.dao.userDao,com.ccj.entity.entityUser"%>
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
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
		#tbSearch{
			width:400px; !important
		}
		#btnSearch{
			height:34px;!important
		}
	</style>
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
                        <li><a href="infor.jsp"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                        </li>
                        <li><a href="lock.jsp"><i class="fa fa-gear fa-fw"></i> 锁定界面</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
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
                            <a href="tables.jsp"><i class="fa fa-table fa-fw"></i> 实时预约情况</a>
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
                    <h1 class="page-header" style="color: blue">员工账户一览表</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            
                 <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" >
                            	注：-为该系统用户未完善的信息，请店长尽快督促其完善！
                           
                            <!-- /input-group -->
                       
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>员工编号</th>
                                        <th>姓名</th>
                                        <th>身份证号</th>
                                        <th>联系电话</th>
                                        <th>出生日期</th>
                                        <th>注册时间</th>
                                        <th>用户类型</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <%
                                   userDao u=new userDao();
                                   List<entityUser> list=u.readUser();
                                   for(entityUser p:list)
                                 
                                 {%>
                                    <tr class="gradeX">
                                        <td width="100" id=<%=p.getId()%>><%=p.getId()%></td>
                                        <td width="100" id=<%=p.getName()%>><%=p.getName()%></td>
                                        <td width="100" id=<%=p.getCard_id()%>><%=p.getCard_id()%></td>
                                        <td width="100" id=<%=p.getPhone()%>><%=p.getPhone()%></td>
                                        <td width="100" id=<%=p.getBirthdate()%>><%=p.getBirthdate()%></td>  
                                        <td width="100" id=<%=p.getTime()%>><%=p.getTime()%></td>
                                        <td width="100" id=<%=p.getTyp()%>><%=p.getTyp()%></td>
                                     </tr>
                                    <%}                                      
                                   %>
                             
                                   
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <div class="well">
                                <label>将工号为<input type="text" id="idType" >的员工角色修改为
                                 	<select name="user_type" id="user_type">
                      	     	 		<option value="1">普通员工(接待)</option>
                      	      			<option value="2">普通员工（医生、护士）</option>
                      	      			<option value="3">店长</option>
                      	   			</select>
                      	   			<input type="button" value="确认修改" onclick="upd()">
                      	   		</label>
                          		 
                            </div>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
               
  
            
              
            
            
        </div>
    

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

  <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
    
<script type="text/javascript">
      function type_sure(){
     
         var type=document.getElementById("type").value;
          //alert(type);
         if(type==1||type==2||type==null){
         window.location.href="noaccess.jsp";
         }
         if(type==3||type==4){
          window.location.href="count.jsp";
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
          window.location.href="userTab.jsp";
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
          window.location.href="../PriceServlet?action=find&key=";
         }
      }
   </script>
</body>

        
   <script type="text/javascript">
      function upd(){
         var idtype=document.getElementById("idType").value;
         var user_type=document.getElementById("user_type").value;
          var url = "../UserServlet?action=upd&id=" + idtype+"&type="+user_type;
          window.location.href=url;
      }
   </script>
        
</html>
