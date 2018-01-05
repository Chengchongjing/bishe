<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>宠物诊所服务系统登录</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

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

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="text-align: center;">     宠物诊所服务系统店员端</h3>
                    </div>
                    <div class="panel-body">
                        <form action="userServlet?action=login" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="工号" name="id" type="text" id="id">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="请输入密码" name="pwd" type="password"  id="pwd" >
                                </div>
                               
                                <!-- Change this to a button or input when using this as a form -->
                                <a class="btn btn-lg btn-success btn-block" onClick="login()">登录</a>
                            </fieldset>
                            <br/>
                         		<div style="text-align: center;color: blue;"  onclick="test()"> 没有账号？联系管理员</div>
                        </form>
                        
                        <script type="text/javascript">
                        
                           function login()
                           {
                             	var id=document.getElementById("id");
                             	var pwd=document.getElementById("pwd");
                             	var url = "../UserServlet?action=login&id=" + id.value + "&pwd="+ pwd.value;
                             	if (id.value == "") {
									alert("工号不能为空");
			
									} else if (pwd.value == "") {
												alert("密码不能为空");
			
										} else{
		 									 window.location.href=url;
										} 
       					       }
                        
                        </script>
                        
                        
                        <script type="text/javascript">
	
						function test()
							{
								alert("如账号失效，请与0311-123456电话联系！");
							}
						</script>
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

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
