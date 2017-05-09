<%@page import="com.javadiscover.login.RegisterUser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../img/apple-icon.png" />
	<link rel="icon" type="image/png" href="../img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Smart Hack</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

   <!-- Bootstrap core CSS     -->
    <link href="css/style.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="css/dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>

<body>
<%
 String msg = "";
 String meterid = request.getParameter("meterid");
 String name = request.getParameter("firstname");
 String umail = request.getParameter("email");
 String uaddress = request.getParameter("address");
 String ucity = request.getParameter("city");
 String upin = request.getParameter("pincode");
 String uphone = request.getParameter("phonenum");
 String uarea = request.getParameter("area");
 

 if(name != null && meterid != null && name.length() > 0 && meterid.length() > 0){
  RegisterUser obj = new RegisterUser();
  boolean flag = obj.registernewuser(meterid,name,umail,uaddress,uphone,uarea,ucity,upin);
  if(flag){
   request.getRequestDispatcher("success.jsp").forward(request, response);
  }else{
	   msg = "Registration unsuccessful";
	  }
 }
%>

	<div class="wrapper">
	    <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-1.jpg">
			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

			<div class="logo">
				<a href="temp.html" class="simple-text">
					Smart Hack
				</a>
			</div>
			
	    	<div class="sidebar-wrapper">
	            <ul class="nav">
	                <li>
	                    <a href="temp.html">
	                        <i class="material-icons">dashboard</i>
	                        <p>Dashboard</p>
	                    </a>
	              
	                <li>
	                    <a href="table.html">
	                        <i class="material-icons">content_paste</i>
	                        <p>Billing</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="typography.html">
	                        <i class="material-icons">library_books</i>
	                        <p>Tariffs</p>
	                    </a>
	                </li>
	                
	                </li>
	                <li class="active">
	                    <a href="user.html">
	                        <i class="material-icons">person</i>
	                        <p>Complaints</p>
	                    </a>
	                </li>
	                <!--<li>
	                    <a href="notifications.html">
	                        <i class="material-icons text-gray">notifications</i>
	                        <p>Notifications</p>
	                    </a>
	                </li>-->
				 </ul>
	    	</div>
	    </div>
	    <div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Profile</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">dashboard</i>
									<p class="hidden-lg hidden-md">Dashboard</p>
								</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">notifications</i>
									<span class="notification">5</span>
									<p class="hidden-lg hidden-md">Notifications</p>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#">Mike John responded to your email</a></li>
									<li><a href="#">You have 5 new tasks</a></li>
									<li><a href="#">You're now friend with Andrew</a></li>
									<li><a href="#">Another Notification</a></li>
									<li><a href="#">Another One</a></li>
								</ul>
							</li>
							<li>
								<a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
	 							   <i class="material-icons">person</i>
	 							   <p class="hidden-lg hidden-md">Profile</p>
	 						   </a>
							</li>
						</ul>

						<form class="navbar-form navbar-right" role="search">
							<div class="form-group  is-empty">
	                        	<input type="text" class="form-control" placeholder="Search">
	                        	<span class="material-input"></span>
							</div>
							<button type="submit" class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i><div class="ripple-container"></div>
							</button>
	                    </form>
					</div>
				</div>
			</nav>

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-8">
	                        <div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">Complaints</h4>
									<p class="category">Write to us</p>
	                            </div>
	                            <div class="card-content">
	                                <form action="user.jsp" method="post" on-submit="validate_register(this)">
	                                    <div class="row">
	                                        <div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label">Meter ID</label>
													<input type="text" name="meterid" id="meterid" class="form-control" >
												</div>
	                                        </div>
	                                        
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Email address</label>
													<input type="email" name="email" id="email" class="form-control" >
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-6">
												<div class="form-group label-floating">
													<label class="control-label">Name</label>
													<input type="text" name="firstname" id="firstname" class="form-control" >
												</div>
	                                        </div>
	                                        
	                                    </div>

	                                   <!-- <div class="row">
	                                        <div class="col-md-12">
												<div class="form-group label-floating">
													<label class="control-label">Address</label>
													<input type="text" name="address" class="form-control" >
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">City</label>
													<input type="text" name="city" class="form-control" >
												</div>
	                                        </div>
	                                        
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Postal Code</label>
													<input type="text" name="pincode" class="form-control" >
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
											<div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Area</label>
													<input type="text" name="area" class="form-control" >
												</div>
	                                        </div>
											<div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Phone num</label>
													<input type="text" name="phonenum" class="form-control" >
												</div>
	                                        </div>
	                                    </div>-->
										
									   <div class="row col-md-4 clearfix" style="padding-left: 13px">
									  
												
													<label class="control-label" style="font-size:15px">Complaint Description</label>
													<br>
													
													<textarea style="width:600px;height:150px" id="complaint"> </textarea>
												
	                                    </div>
										
										
										<div class="row col-md-12">
												
												<button type="submit" class="btn btn-primary pull-right" >Submit </button>
												
	                                        </div>
	                               
	                                </form>
	                            </div>
	                        </div>
	                    </div>
						
	                </div>
	            </div>
	        </div>

	        <footer class="footer">
	            <div class="container-fluid">
	                <nav class="pull-left">
	                    <ul>
	                        <li>
	                            <a href="#">
	                                Home
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#">
	                                Company
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#">
	                                Portfolio
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#">
	                               Blog
	                            </a>
	                        </li>
	                    </ul>
	                </nav>
	                <p class="copyright pull-right">
	                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="temp.html">Smart Hack</a>
	                </p>
	            </div>
	        </footer>
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
