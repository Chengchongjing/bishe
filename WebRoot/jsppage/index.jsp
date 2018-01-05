<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="java.sql.*" %>    

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
                       
                    
                    
                    
                  
                </li>
              
            </ul>
           

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
                                    <a href="flot.html">销售额明细</a>
                                </li>
                                <li>
                                    <a href="morris.html">员工业绩查询</a>
                                </li>
                                <li>
                                    <a href="flot.html">宠物用品使用情况</a>
                                </li>
                               
                            </ul>
                       
                        </li>
                        <li>
                            <a href="../opServlet?action=find&timedate="><i class="fa fa-table fa-fw"></i> 实时预约情况</a>
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
                                    <a href="panels-wells.html">宠物病历汇总</a>
                                </li>
                                <li>
                                    <a href="buttons.html">订单明细</a>
                                </li>
                                
                            </ul>
                           
                        </li>
                    </ul>
                </div>
                
            </div>
            
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="color: blue;">欢迎，工号为<%=session.getAttribute("id")%>的工作人员</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>当前时段预约人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left" >查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>正在接受服务人数</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>今日订单列表</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">查看订单明细</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right" onclick="h()">
                                    <div class="huge">13</div>
                                    <div>创建订单</div>
                                </div>
                            </div>
                        </div>
                        <a href="priceTab.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">价格列表</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>          
                    </div>
               
                </div>
               
               
   

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>
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
   
   
   <script type="text/javascript">
     function h(){
      window.location.href="../ddServlet?action=find&timedate=";
     }
   
   </script>
</html>
