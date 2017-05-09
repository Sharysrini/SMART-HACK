<%@page import="com.javadiscover.login.ChangeTariff"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="assets/img/favicon.png" />
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
   response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
            if(session.getAttribute("uname")==null)
                  {
                  response.sendRedirect("login.jsp");
                 }
            

	String msg="";
 	ChangeTariff obj = new ChangeTariff();
 	double[] utariff = new double[6];
 	utariff[3] =Double.parseDouble(request.getParameter("norm30"));
 	utariff[4] = Double.parseDouble(request.getParameter("norm70"));
 	utariff[5] = Double.parseDouble(request.getParameter("norm100"));
 	utariff[0] = Double.parseDouble(request.getParameter("peak30"));
 	utariff[1] = Double.parseDouble(request.getParameter("peak70"));
 	utariff[2] = Double.parseDouble(request.getParameter("peak100"));
	 	
 	boolean flag = obj.changeTariff(utariff);
 	double[] tariff = obj.showTariff();
	if(flag)
		msg="Updated successfully";
	else
		msg="Update unsuccessful";
	
%>
	<div class="wrapper">
	    <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-1.jpg">

			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

			<div class="logo">
				<a href="dashboard.jsp" class="simple-text">
					Smart Hack
				</a>
			</div>
			
	    	<div class="sidebar-wrapper">
	            <ul class="nav"><li>
	                    <a href="dashboard.jsp">
	                        <i class="material-icons">dashboard</i>
	                        <p>Dashboard</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="usersuccess.jsp">
	                        <i class="material-icons">person</i>
	                        <p>New User</p>
	                    </a>
	                </li>
	               
	                <li class="active">
	                    <a href="tariff.jsp">
	                        <i class="material-icons">library_books</i>
	                        <p>Tariffs</p>
	                    </a>
	                </li>
	           
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
						<a class="navbar-brand" href="#">Tariffs</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
						<li>
								<a href="logout.jsp">
	 							   <p>Logout</p>
		 						</a>
							</li>
						</ul>
							
				</div>
			</nav>

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                 <p align="center"> <b><font color="darkred"><%=msg %></font></b></p>
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">Manage tariffs</h4>
	                            </div>
	                            <div class="card-content">
									<div id="typography">
											<div class="tim-typo">
												<h6><span class="tim-note">Current tariffs:</span></h6>
											</div>
									<table class="table">
	                                    <thead class="text-primary">
	                                    	<th>Units</th>
	                                    	<th>Normal Price/unit</th>
											<th>Peak hour charges</th>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                        	<td>30</td>
	                                        	<td><%=tariff[3] %></td>
												<td><%=tariff[0] %></td>
	                                        </tr>
	                                        <tr>
	                                        	<td>60</td>
	                                        	<td><%=tariff[4] %></td>
												<td><%=tariff[1] %></td>
	                                        </tr>
	                                        <tr>
	                                        	<td>100</td>
	                                        	<td><%=tariff[5] %></td>
												<td><%=tariff[2] %></td>
	                                        </tr>
										</tbody>
									</table>
									
									<div class="card-content">
									<div id="typography">
											<div class="tim-typo">
												<h6><span class="tim-note">Change tariffs:</span></h6>
											</div>
									<table class="table">
									<form name="form1" action="tariffUpdate.jsp" method=post>
									<thead class="text-primary">
	                                    	<th>Units</th>
	                                    	<th>Normal Price/unit</th>
											<th>Peak hour charges</th>
											
											<th><button type="submit" class="btn btn-primary pull-right">Change</button></th>
	                                    </thead>
	                                    <tbody>
	                                        <tr><!--  <form action="tariff.jsp" method=post>
	 -->                                       	<td>30</td>
	                                        	<td><div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label"></label>
													<input type="text" class="form-control" name="norm30" value="<%=tariff[3] %>" required="required">
												</div>
	                                        </div></td>
												<td><div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label"></label>
													<input type="text" class="form-control" name="peak30" value="<%=tariff[0] %>" required="required">
												</div>
	                                        </div></td>
											<!-- 	<td><button type="submit" class="btn btn-primary pull-right">Change</button></td>
	                                       --> </tr><!-- </form> -->
	                                        <tr><!-- <form action="tariff.jsp" method=post>-->
	                                        	<td>60</td>
	                                        	<td><div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label"></label>
													<input type="text" class="form-control" name="norm70" value="<%=tariff[4]%>" required="required">
												</div>
	                                        </div></td>
												<td><div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label"></label>
													<input type="text" class="form-control" name="peak70" value="<%=tariff[1]%>" required="required">
												</div>
	                                        </div></td>
											<!-- 	<td><button type="submit" class="btn btn-primary pull-right">Change</button></td>
	                                       --> </tr><!-- </form>-->
	                                        <tr><!--<form method=post action="tariff.jsp">-->
	                                        	<td>100</td>
	                                        	<td><div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label"></label>
													<input type="text" class="form-control" name="norm100" value="<%=tariff[5] %>" required="required">
												</div>
	                                        </div></td>
												<td><div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label"></label>
													<input type="text" class="form-control" name="peak100" value="<%=tariff[2] %>" required="required">
												</div>
	                                        </div></td>
											<!-- 	<td><button type="submit" class="btn btn-primary pull-right">Change</button></td>
	                                      -->  </tr><!--  </form>-->
										</tbody>
										</form>
									</table>
											
									
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>

	        
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
