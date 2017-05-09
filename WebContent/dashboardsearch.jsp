<%@page import="com.javadiscover.login.DasboardDetails"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png" />
	<link rel="icon" type="image/png" href="img/favicon.png" />
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
    
    <style>

	.axis {
	  font: 10px sans-serif;
	}

	.axis path,
	.axis line {
	  fill: none;
	  stroke: #000;
	  shape-rendering: crispEdges;
	}

	</style>
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
            

 /*String username = (String)session.getAttribute("uname");
//System.out.println(username);
if(username==null || username== " "){
	    response.sendRedirect("login.jsp");
	 }*/
String username = (String)session.getAttribute("uname");
String meter_id = request.getParameter("searchuser");
DasboardDetails obj=new DasboardDetails(Integer.parseInt(meter_id));
int meterid=obj.sendMeter();
String name=obj.sendName();
String time=obj.sendTime();
int pincode=obj.sendPin();
double peakunit=obj.sendPeak();  
double unitsconsumed=obj.sendUnit();

%>
<div class="wrapper">

	    <div class="sidebar" data-color="purple" data-image="img/sidebar-1.jpg">
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
	                <li class="active">
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
	               <!--  <li>
	                    <a href="table.html">
	                        <i class="material-icons">content_paste</i>
	                        <p>Billing</p>
	                    </a>
	                </li> -->
	                <li>
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
						<a class="navbar-brand" href="#">Dashboard</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
						
							<li>
								<a href="logout.jsp">
	 							   <p>Logout</p>
		 						</a>
							</li>
						
						</ul>
					
						<form class="navbar-form navbar-right" role="search"action = "dasboardsearch.jsp">
							<div class="form-group  is-empty">
								<input type="text" class="form-control" name= "searchuser" placeholder="Search using meterid">
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
				<div class="col-md-12">
	              <div class="card">
				 <div class="card-header" data-background-color="purple">
	                                <h4 class="title">Search Results for <%=meter_id %></h4>
	                            </div>
	                 </div>
	                 </div>           
	                         
	                <div class="row">
						<div class="col-lg-4 col-md-8 col-sm-8">
							<div class="card card-stats">
								<div class="card-header" data-background-color="orange">
									<i class="material-icons">store</i>
								</div>
								<div class="card-content">
									<p>Peak unit usage</p><br>
									<h3 class="title"><small><%=peakunit%></small></h3>
								</div>
								
							</div>
						</div>
						<div class="col-lg-4 col-md-8 col-sm-8">
							<div class="card card-stats">
								<div class="card-header" data-background-color="red">
									<i class="material-icons">info_outline</i>
								</div>
								<div class="card-content">
									<p>Peak hour observed</p><br>
									<h3 class="title"><small><%=time%></small></h3>
								</div>
								
							</div>
						</div>
						<div class="col-lg-4 col-md-8 col-sm-8">
							<div class="card card-stats">
								<div class="card-header" data-background-color="green">
									<i class="material-icons">content_copy</i>
								</div>
								<div class="card-content">
									<p>Total unit usage</p><br>
									<h3 class="title"><small><%=unitsconsumed%></small></h3>
								</div>
								
							</div>
						</div>
						

					
					</div>
					
					<div clas="row">
						<div class="card">
						
							<div class="ct-chart" id="areastat"></div>
								<div class="card-content">
									<h4 class="title">Usage Statistics</h4>
									<p class="category">for each day</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> updated 1 day ago
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
					
					
	
<script src="http://d3js.org/d3.v3.min.js"></script>

<script>

var margin = {top: 20, right: 20, bottom: 70, left: 40},
    width = 600 - margin.left - margin.right,
    height = 300 - margin.top - margin.bottom;

// Parse the date / time
//var	parseDate = d3.time.format("%Y-%m").parse;

var x = d3.scale.ordinal().rangeRoundBands([0, width], .05);

var y = d3.scale.linear().range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom")
    .ticks(10);

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left")
    .ticks(10);

var svg = d3.select("#areastat").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", 
          "translate(" + margin.left + "," + margin.top + ")");

d3.tsv("d3/<%=meter_id%>.tsv", function(error, data) {

    data.forEach(function(d) {
        d.date = +d.date;
        d.value = +d.value;
		console.log(d);
    });
	
  x.domain(data.map(function(d) { return d.date; }));
  y.domain([0, d3.max(data, function(d) { return d.value; })]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
    .selectAll("text")
      .style("text-anchor", "end")
      .attr("dx", "-.8em")
      .attr("dy", "-.55em")
      .attr("transform", "rotate(-90)" );

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Power (Units)");

  svg.selectAll("bar")
      .data(data)
    .enter().append("rect")
      .style("fill", "steelblue")
      .attr("x", function(d) { return x(d.date); })
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.value); })
      .attr("height", function(d) { return height - y(d.value); });

});

</script>

</body>
	
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

	<script type="text/javascript">
    	$(document).ready(function(){

			// Javascript method's body can be found in assets/js/demos.js
        	demo.initDashboardPageCharts();

    	});
	</script>
</html>