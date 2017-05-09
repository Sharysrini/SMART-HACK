<%@page import="com.javadiscover.login.BillDetails"%>
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
String username = (String)request.getSession().getAttribute("uname");
BillDetails obj=new BillDetails(Integer.parseInt(username));
int meterid=obj.sendMeter();
String name=obj.sendName();
String email=obj.sendEmail();
int month=obj.sendMonth();
double total=obj.sendTotal();
double totalpeak=obj.sendTotalPeak();
double cost=obj.sendCost();
String status; 
if(cost==0)
	status="Paid";
else
	status="Unpaid";
%>
	<div class="wrapper">
	    <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-1.jpg">

			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

			<div class="logo">
				<a href="userDashboard.jsp" class="simple-text">
					Smart Hack
				</a>
			</div>
			
	    	<div class="sidebar-wrapper">
	            <ul class="nav"><li>
	                    <a href="userDashboard.jsp">
	                        <i class="material-icons">dashboard</i>
	                        <p>Dashboard</p>
	                    </a>
	                </li>
	               
	                <li>
	                	 <li class="active">
	                    <a href="billing.jsp">
	                        <i class="material-icons">content_paste</i>
	                        <p>Billing</p>
	                    </a>
	                </li>
	               <li>
	                    <a href="usertariff.jsp">
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
						<a class="navbar-brand" href="#">Billing</a>
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
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">View and Pay Bills</h4>
	                            </div>
	                            <div class="card-content">
									<div id="typography">
											
									<table class="table">
	                                    <thead class="text-primary">
	                                    	<th>Meter Id</th>
	                                    	<th>Name</th>
	                                    	<th>Bill Month</th>
	                                    	<th>Email-id</th>
	                                    	<th>Units consumed</th>
											<th>Peak hour Units</th>
											<th>Cost</th>
											<th>Status</th>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                        	<td><%=meterid %></td>
	                                        	<td><%=name %></td>
	                                        	<td><%=month %></td>
	                                        	<td><%=email %></td>
	                                        	<td><%=total %></td>
	                                        	<td><%=totalpeak %></td>
	                                        	<td><%= cost%></td>
	                                        	<td><%=status %></td>
												
	                                        </tr>
	                                     </tbody>
									</table>
									<%if(status=="Unpaid"){ %>
									<form action="paybill.jsp" method="post">
									<td><button type="submit" class="btn btn-primary pull-right">Pay now</button></td>
	                                       </tr> 
									</form>
									<%} %>
							
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
