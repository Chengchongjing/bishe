<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@page import="com.ccj.dao.priceDao,com.ccj.entity.entityPrice"%>
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
                    <h1 class="page-header" style="color: blue">各项目及药品收费一览表</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            
                 <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="查询.." width="25px" id="tbSearch">
                                &nbsp;&nbsp;&nbsp;
                                <button class="btn btn-default" type="button" id="btnSearch" onclick="search()">
                                    <i class="fa fa-search"></i>
                                </button>
                                <span class="input-group-btn">
                            </span>
                            </div>
                            <!-- /input-group -->
                       
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>项目编号</th>
                                        <th>项目名称</th>
                                        <th>价格(元)</th>
                                        <th></th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                 <%
                                   List<entityPrice> list= (List<entityPrice>)request.getAttribute("list");
                                   for(entityPrice p1:list)
                                      
                                 {%>
                                    <tr class="gradeX">
                                        <td width="250" id=<%=p1.getP_id()%>><%=p1.getP_id()%></td>
                                        <td width="350" id=<%=p1.getP_name()%>><%=p1.getP_name()%></td>
                                        <td width="200" id=<%=p1.getPrice()%>><%=p1.getPrice()%></td>
                                        <td><input id=<%=p1.getP_id()%> type="button" value="修改价格" onclick="rePrice()"></td>
                                        <td><input id=<%=p1.getP_id()%> type="button" value="删除" onclick="delProject()"></td>
                                         </tr>
                                    <%}                                      
                                   %>
                             
                                   
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <div class="well">
                                
                                 <label>项目编号：<input type="text" id="addpid"></label>
                           		 <label>项目名称：<input type="text" id="addpname"></label>
                          		 <label>价格（元）：<input type="text" id="addprice"></label>
                          		 <label>  <input type="button" value="新建收费项" onclick="addproject()"></label>
                          		 
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
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

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
 function rePrice(){
 	$(document).click(function(e){
		var id = $(e.target).attr("id");
		//var cssclass = $(e.target).attr("class");
		//var code = $(e.target).attr("value");
		//alert("id:" + id + ",class:" + cssclass + ",code:" + code); 
		var newprice=window.prompt("请输入新的价格",""); 
		//alert(newprice);
	    var url = "PriceServlet?action=rePrice&id=" + id+"&newprice="+newprice;
	    if(newprice!=null){
	    		window.location.href=url;
			}else if(newprice==null){
						location.reload();
						
 			}
	});
	}                       			
   </script>
        
        
        
        <script type="text/javascript">
         function addproject(){
         //alert("1");
           var addpid=document.getElementById("addpid");
           var addpname=document.getElementById("addpname");
           var addprice=document.getElementById("addprice");
           var url = "PriceServlet?action=add&addpid=" + addpid.value+"&addpname="+addpname.value+"&addprice="+addprice.value;
           if(addpid.value!=""&&addpname.value!=""&&addprice.value!=""){
             window.location.href=url;
           }
           else {
             alert("注意输入数据的完整性");
           }
         }

        </script>
        
        
        <script type="text/javascript">
           function delProject(){
           	$(document).click(function(e){
			var id = $(e.target).attr("id");		    
			var sure=confirm("确认删除？");
			if(sure==true){
	        var url = "PriceServlet?action=del&id=" + id;
	     	if(id!=null){
	    		window.location.href=url;
			}else if(newprice==null){
						location.reload();				
 			}
			}
			});
		}             
        </script>
        
        <script type="text/javascript">
            function search(){
               var keyword =document.getElementById("tbSearch");
               if(keyword.value==""){
               alert("请输入查询内容");
               }else {
                    var url = "PriceServlet?action=find&key="+keyword.value;
                    window.location.href=url;
               }
            
            }
        
        </script>
        
</body>

        
        
</html>
