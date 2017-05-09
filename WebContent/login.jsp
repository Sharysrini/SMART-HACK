<%@page import="com.javadiscover.login.LoginValidate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png" />
	<link rel="icon" type="image/png" href="img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Smart Hack</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="css/style.css" rel="stylesheet" type="text/css"/>

    <!--  Material Dashboard CSS    -->
    <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/demo.css" rel="stylesheet" type="text/css" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    <script type="text/javascript">
    function validate_required(field, alerttxt) {
        with (field) {
            if (value == null || value == "") {
                alert(alerttxt);
                return false;
            }
            else {
                return true;
            }
        }
    }

    function validate_Loginform(thisform) {
        with (thisform) {
            if (validate_required(username, "Please enter the username") == false)
            {
                username.focus();
                return false;
            }

            if (validate_required(password, "Please enter the password") == false)
            {
                password.focus();
                return false;
            }
            return true;
        }
    }
 </script>
</head>

<body>
<%

 String msg = "";
	String uname =request.getParameter("username"); 
 String password = request.getParameter("password");
 if(password != null && password.length() > 0){
  LoginValidate obj = new LoginValidate();
  boolean flag = obj.validateUserLogin(Integer.parseInt(uname), password);
  if(flag){
   session.setAttribute("uname",uname); 
   if(Integer.parseInt(uname)==10000)
   request.getRequestDispatcher("dashboard.jsp").forward(request, response);
   else
   request.getRequestDispatcher("userDashboard.jsp").forward(request, response);
  }else{
   msg = "Invalid username or password";
  }
 }
%>
	  <div class="main-panel">
			<div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-5" style="left:18%">
	                        <div class="card">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">Login</h4>
	                            </div>
	                            <div class="card-content">
	                                <form action="login.jsp" method="post" onsubmit="return validate_Loginform(this)">
	                                    <div class="row">
	                                        <div class="col-md-10">
												<div class="form-group label-floating">
													<label class="control-label">Username</label>
													<input name="username" size="20" value="" type="text" class="form-control" >
												</div>
	                                         </div>
	                                     </div>

	                                    <div class="row">
	                                        <div class="col-md-10">
												<div class="form-group label-floating">
													<label class="control-label">Password</label>
													<input name="password" size="20" value="" type="password" class="form-control" >
												</div>
	                                        </div>
	                                     </div>
	                                    <button value="Login" name="B1" type="submit" class="btn btn-primary pull-middle" style="left:35%;">Login</button>
	                                    <div class="clearfix"></div>
	                                </form>
	                            </div>
	                        </div>
	                        <p align="center"> <b><font color="darkred"><%=msg %></font></b></p>
	                    </div>
	                     
				</div>
	       </div>
			</div>
	</div>
	

</body>

	<!--   Core JS Files   -->
	<script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
	<script src="js/min.js" type="text/javascript"></script>
	<script src="js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="js/notify.js"></script>

	<!--  Google Maps Plugin    -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

	<!-- Material Dashboard javascript methods -->
	<script src="js/dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="js/demo.js"></script>


</html>
