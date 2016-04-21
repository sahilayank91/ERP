<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.*"%>
<%@page import="postgreSQLDatabase.attendance.Allocation"%>
<%@page import="postgreSQLDatabase.attendance.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="postgreSQLDatabase.attendance.Attendance"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Data Tables</title>
<script type="text/javascript" src="js/jquery-1.12.1.min.js">
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#semester_selected').change(function() {
			var semester_selected = $('#semester_selected').val();
			$.ajax({
				type : 'Post',
				data : {
					faculty : 'EC101',
					semester : semester_selected,
					action : 'getBranchList'
				},
				url : 'http://localhost:8086/erp/AjaxController',
				success : function(result) {
					$('#branch_selected').html(result);
				}
			});
		});
		$('#branch_selected').change(function() {
			var semester_selected = $('#semester_selected').val();
			var branch_selected = $('#branch_selected').val();
			$.ajax({
				type : 'Post',
				data : {
					faculty : 'EC101',
					semester : semester_selected,
					branch : branch_selected,
					action : 'getCourseList'
				},
				url : '../AjaxController',
				success : function(result) {
					$('#course_list').html(result);
				}
			});
		});
		$('#course_list').change(function() {
			var course = $('#course_list').val();
			var branch_selected = $('#branch_selected').val();
			$.ajax({
				type : 'Post',
				data : {
					course_code : course,
					branch : branch_selected,
					action : 'getStudentList'
				},
				url : 'http://localhost:8086/erp/AjaxController',
				success : function(result) {
					$('#attendance_table').html(result);
				}
			});
		});
	});
</script>
<script type="text/javascript">
	function genAttendanceList() {
		var table = document.getElementById('attendance_table');
		var j_array = [];
		for (var i = 0, row; row = table.rows[i]; i++) {
			//iterate through rows
			//rows would be accessed using the "row" variable assigned in the for loop

			//iterate through columns
			//columns would be accessed using the "col" variable assigned in the for loop
			var j_object = {};

			j_object["student_id"] = table.rows[i].cells[0].innerHTML;
			if (table.rows[i].cells[2].getElementsByTagName("input")[0].checked)
				j_object["attendance_status"] = "present";
			else if (table.rows[i].cells[3].getElementsByTagName("input")[0].checked)
				j_object["attendance_status"] = "absent";
			else
				j_object["attendance_status"] = "leave";
			j_array.push(j_object);

		}
		JSONToCSVConvertor(j_array, "Attendance Report", true);
	}

	function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
		//If JSONData is not an object then JSON.parse will parse the JSON string in an Object
		var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData)
				: JSONData;

		var CSV = '';
		//Set Report title in first row or line

		CSV += ReportTitle + '\r\n\n';

		//This condition will generate the Label/Header
		if (ShowLabel) {
			var row = "";

			//This loop will extract the label from 1st index of on array
			for ( var index in arrData[0]) {

				//Now convert each value to string and comma-seprated
				row += index + ',';
			}

			row = row.slice(0, -1);

			//append Label row with line break
			CSV += row + '\r\n';
		}

		//1st loop is to extract each row
		for (var i = 0; i < arrData.length; i++) {
			var row = "";

			//2nd loop will extract each column and convert it in string comma-seprated
			for ( var index in arrData[i]) {
				row += '"' + arrData[i][index] + '",';
			}

			row.slice(0, row.length - 1);

			//add a line break after each row
			CSV += row + '\r\n';
		}

		if (CSV == '') {
			alert("Invalid data");
			return;
		}

		//Generate a file name
		var fileName = "MyReport_";
		//this will remove the blank-spaces from the title and replace it with an underscore
		fileName += ReportTitle.replace(/ /g, "_");

		//Initialize file format you want csv or xls
		var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);

		// Now the little tricky part.
		// you can use either>> window.open(uri);
		// but this will not work in some browsers
		// or you will not get the correct file extension    

		//this trick will generate a temp <a /> tag
		var link = document.createElement("a");
		link.href = uri;

		//set the visibility hidden so it will not effect on your web-layout
		link.style = "visibility:hidden";
		link.download = fileName + ".csv";

		//this part will append the anchor tag and remove it after automatic click
		document.body.appendChild(link);
		link.click();
		document.body.removeChild(link);
	}
</script>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="../plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="../index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Admin</b>LTE</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->
						<li class="dropdown messages-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa fa-envelope-o"></i> <span class="label label-success">4</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 4 messages</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li>
											<!-- start message --> <a href="#">
												<div class="pull-left">
													<img src="../dist/img/user2-160x160.jpg" class="img-circle"
														alt="User Image">
												</div>
												<h4>
													Support Team <small><i class="fa fa-clock-o"></i> 5
														mins</small>
												</h4>
												<p>Why not buy a new awesome theme?</p>
										</a>
										</li>
										<!-- end message -->
										<li><a href="#">
												<div class="pull-left">
													<img src="../dist/img/user3-128x128.jpg" class="img-circle"
														alt="User Image">
												</div>
												<h4>
													AdminLTE Design Team <small><i
														class="fa fa-clock-o"></i> 2 hours</small>
												</h4>
												<p>Why not buy a new awesome theme?</p>
										</a></li>
										<li><a href="#">
												<div class="pull-left">
													<img src="../dist/img/user4-128x128.jpg" class="img-circle"
														alt="User Image">
												</div>
												<h4>
													Developers <small><i class="fa fa-clock-o"></i>
														Today</small>
												</h4>
												<p>Why not buy a new awesome theme?</p>
										</a></li>
										<li><a href="#">
												<div class="pull-left">
													<img src="../dist/img/user3-128x128.jpg" class="img-circle"
														alt="User Image">
												</div>
												<h4>
													Sales Department <small><i class="fa fa-clock-o"></i>
														Yesterday</small>
												</h4>
												<p>Why not buy a new awesome theme?</p>
										</a></li>
										<li><a href="#">
												<div class="pull-left">
													<img src="../dist/img/user4-128x128.jpg" class="img-circle"
														alt="User Image">
												</div>
												<h4>
													Reviewers <small><i class="fa fa-clock-o"></i> 2
														days</small>
												</h4>
												<p>Why not buy a new awesome theme?</p>
										</a></li>
									</ul>
								</li>
								<li class="footer"><a href="#">See All Messages</a></li>
							</ul></li>
						<!-- Notifications: style can be found in dropdown.less -->
						<li class="dropdown notifications-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa fa-bell-o"></i> <span class="label label-warning">10</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 10 notifications</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li><a href="#"> <i class="fa fa-users text-aqua"></i>
												5 new members joined today
										</a></li>
										<li><a href="#"> <i class="fa fa-warning text-yellow"></i>
												Very long description here that may not fit into the page
												and may cause design problems
										</a></li>
										<li><a href="#"> <i class="fa fa-users text-red"></i>
												5 new members joined
										</a></li>

										<li><a href="#"> <i
												class="fa fa-shopping-cart text-green"></i> 25 sales made
										</a></li>
										<li><a href="#"> <i class="fa fa-user text-red"></i>
												You changed your username
										</a></li>
									</ul>
								</li>
								<li class="footer"><a href="#">View all</a></li>
							</ul></li>
						<!-- Tasks: style can be found in dropdown.less -->
						<li class="dropdown tasks-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa fa-flag-o"></i> <span class="label label-danger">9</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 9 tasks</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Design some buttons <small class="pull-right">20%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-aqua"
														style="width: 20%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">20% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Create a nice theme <small class="pull-right">40%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-green"
														style="width: 40%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">40% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Some task I need to do <small class="pull-right">60%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-red"
														style="width: 60%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">60% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Make beautiful transitions <small class="pull-right">80%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-yellow"
														style="width: 80%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">80% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
									</ul>
								</li>
								<li class="footer"><a href="#">View all tasks</a></li>
							</ul></li>
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="../dist/img/user2-160x160.jpg" class="user-image"
								alt="User Image"> <span class="hidden-xs">Alexander
									Pierce</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="../dist/img/user2-160x160.jpg" class="img-circle"
									alt="User Image">

									<p>
										Alexander Pierce - Web Developer <small>Member since
											Nov. 2012</small>
									</p></li>
								<!-- Menu Body -->
								<li class="user-body">
									<div class="row">
										<div class="col-xs-4 text-center">
											<a href="#">Followers</a>
										</div>
										<div class="col-xs-4 text-center">
											<a href="#">Sales</a>
										</div>
										<div class="col-xs-4 text-center">
											<a href="#">Friends</a>
										</div>
									</div> <!-- /.row -->
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">Profile</a>
									</div>
									<div class="pull-right">
										<a href="#" class="btn btn-default btn-flat">Sign out</a>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
						<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="../dist/img/user2-160x160.jpg" class="img-circle"
							alt="User Image">
					</div>
					<div class="pull-left info">
						<p>Alexander Pierce</p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- search form -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="Search..."> <span class="input-group-btn">

							<div class="btn-group pull-right">
								<button type="button" name="submit1"
									class="btn btn-block btn-danger">Submit</button>
							</div>
						</span>
					</div>
				</form>
				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-dashboard"></i> <span>Dashboard</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="../index.html"><i class="fa fa-circle-o"></i>
									Dashboard v1</a></li>
							<li><a href="../index2.html"><i class="fa fa-circle-o"></i>
									Dashboard v2</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
							<span>Layout Options</span> <span
							class="label label-primary pull-right">4</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="../layout/top-nav.html"><i
									class="fa fa-circle-o"></i> Top Navigation</a></li>
							<li><a href="../layout/boxed.html"><i
									class="fa fa-circle-o"></i> Boxed</a></li>
							<li><a href="../layout/fixed.html"><i
									class="fa fa-circle-o"></i> Fixed</a></li>
							<li><a href="../layout/collapsed-sidebar.html"><i
									class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
						</ul></li>
					<li><a href="../widgets.html"> <i class="fa fa-th"></i> <span>Widgets</span>
							<small class="label pull-right bg-green">new</small>
					</a></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span>Charts</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="../charts/chartjs.html"><i
									class="fa fa-circle-o"></i> ChartJS</a></li>
							<li><a href="../charts/morris.html"><i
									class="fa fa-circle-o"></i> Morris</a></li>
							<li><a href="../charts/flot.html"><i
									class="fa fa-circle-o"></i> Flot</a></li>
							<li><a href="../charts/inline.html"><i
									class="fa fa-circle-o"></i> Inline charts</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
							<span>UI Elements</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="../general.html"><i class="fa fa-circle-o"></i>
									General</a></li>
							<li><a href="../icons.html"><i class="fa fa-circle-o"></i>
									Icons</a></li>
							<li><a href="../buttons.html"><i class="fa fa-circle-o"></i>
									Buttons</a></li>
							<li><a href="../sliders.html"><i class="fa fa-circle-o"></i>
									Sliders</a></li>
							<li><a href="../timeline.html"><i class="fa fa-circle-o"></i>
									Timeline</a></li>
							<li><a href="../modals.html"><i class="fa fa-circle-o"></i>
									Modals</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
							<span>Forms</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="../forms/general.html"><i
									class="fa fa-circle-o"></i> General Elements</a></li>
							<li><a href="../forms/advanced.html"><i
									class="fa fa-circle-o"></i> Advanced Elements</a></li>
							<li><a href="../forms/editors.html"><i
									class="fa fa-circle-o"></i> Editors</a></li>
						</ul></li>
					<li class="treeview active"><a href="#"> <i
							class="fa fa-table"></i> <span>Tables</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="simple.html"><i class="fa fa-circle-o"></i>
									Simple tables</a></li>
							<li class="active"><a href="data.html"><i
									class="fa fa-circle-o"></i> Data tables</a></li>
						</ul></li>
					<li><a href="../calendar.html"> <i class="fa fa-calendar"></i>
							<span>Calendar</span> <small class="label pull-right bg-red">3</small>
					</a></li>
					<li><a href="../mailbox/mailbox.html"> <i
							class="fa fa-envelope"></i> <span>Mailbox</span> <small
							class="label pull-right bg-yellow">12</small>
					</a></li>
					<li class="treeview"><a href="#"> <i class="fa fa-folder"></i>
							<span>Examples</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="../examples/invoice.html"><i
									class="fa fa-circle-o"></i> Invoice</a></li>
							<li><a href="../examples/profile.html"><i
									class="fa fa-circle-o"></i> Profile</a></li>
							<li><a href="../examples/login.html"><i
									class="fa fa-circle-o"></i> Login</a></li>
							<li><a href="../examples/register.html"><i
									class="fa fa-circle-o"></i> Register</a></li>
							<li><a href="../examples/lockscreen.html"><i
									class="fa fa-circle-o"></i> Lockscreen</a></li>
							<li><a href="../examples/404.html"><i
									class="fa fa-circle-o"></i> 404 Error</a></li>
							<li><a href="../examples/500.html"><i
									class="fa fa-circle-o"></i> 500 Error</a></li>
							<li><a href="../examples/blank.html"><i
									class="fa fa-circle-o"></i> Blank Page</a></li>
							<li><a href="../examples/pace.html"><i
									class="fa fa-circle-o"></i> Pace Page</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-share"></i>
							<span>Multilevel</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
							<li><a href="#"><i class="fa fa-circle-o"></i> Level One
									<i class="fa fa-angle-left pull-right"></i></a>
								<ul class="treeview-menu">
									<li><a href="#"><i class="fa fa-circle-o"></i> Level
											Two</a></li>
									<li><a href="#"><i class="fa fa-circle-o"></i> Level
											Two <i class="fa fa-angle-left pull-right"></i></a>
										<ul class="treeview-menu">
											<li><a href="#"><i class="fa fa-circle-o"></i> Level
													Three</a></li>
											<li><a href="#"><i class="fa fa-circle-o"></i> Level
													Three</a></li>
										</ul></li>
								</ul></li>
							<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
						</ul></li>
					<li><a href="../documentation/index.html"><i
							class="fa fa-book"></i> <span>Documentation</span></a></li>
					<li class="header">LABELS</li>
					<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
					<li><a href="#"><i class="fa fa-circle-o text-yellow"></i>
							<span>Warning</span></a></li>
					<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Attendance(Page-1)</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Tables</a></li>
					<li class="active">Data tables</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<div class="col-md-12">
									<div class="col-md-3">
										<div class="form-group">
											<label>Academic Year:</label><select class="form-control"
												disabled>
												<option selected>2016</option>
												<option>2017</option>
												<option>2018</option>
											</select>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label>Semester:</label><select class="form-control"
												id="semester_selected">
												<option>Semester</option>
												<%
													ArrayList<Allocation> db_list = Query.getAllocationList("EC101");
													/*			ArrayList<String>list=new ArrayList<String>();
													db_list.sort(new Comparator<Allocation>(){
													    
													    
													    public int compare(Allocation o1, Allocation o2) {
													    	if(o1.getSemester()>o2.getSemester())
													        return -1;
													    	else return 0;
													    }
													
													});
													
													Iterator<Allocation>db_iterator=db_list.iterator();
													while(db_iterator.hasNext()){
														Allocation db_current=db_iterator.next();
														if(!list.contains(db_current)){list.add(db_current);
														System.out.println(db_current);}
													}*/
													Iterator<Allocation> iterator = db_list.iterator();
													while (iterator.hasNext()) {
														Allocation current = iterator.next();
												%>
												<option value="<%=current.getSemester()%>"><%=current.getSemester()%></option>

												<%
													}
												%>
											</select>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label>Branch Name:</label><select class="form-control"
												id="branch_selected">

											</select>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label>Course-code:</label><select class="form-control"
												id="course_list">

											</select>
										</div>
									</div>
									<%
										GregorianCalendar gcalendar = new GregorianCalendar();

										String mydate = 0 + (gcalendar.get(Calendar.MONTH) + 1) +"/" +(gcalendar.get(Calendar.DATE) + "/" + 	+ gcalendar.get(Calendar.YEAR)).toString();
										//System.out.print(mydate);
									%>
									<div class="col-md-3">
										<div class="form-group">
											<label>Date</label> <input type="date" value="<%=mydate%>" />
										</div>
									</div>
								</div>
								<div class="col-xs-12">
									<div class="col-md-4">
										<div class="form-group">
											<label>From</label> <input type="time" name="fromTime" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>To</label> <input type="time" name="toTime" />
										</div>
									</div>

								</div>
							</div>

							<div class="box-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Student Id</th>
											<th>Student Name</th>
											<th>Present</th>
											<th>Absent</th>
											<th>Leave</th>
										</tr>
									</thead>
									<tbody id="attendance_table">

									</tbody>
									<%-- Comment 

											<%
												ArrayList<Attendance> student_list = Query.getAttendanceList("CST-301");
												Iterator<Attendance> student_iterator = student_list.iterator();
												while (student_iterator.hasNext()) {
													Attendance current = student_iterator.next();
											%>
											<tr>
												<td><%=current.getStudent_id()%></td>
												<td><%=current.getStudent_name()%></td>

												<td><label> <input type="radio"
														name="attendance_<%=current.getStudent_id()%>"
														id="optionsRadios1" value="op1">
												</label></td>
												<td><label> <input type="radio"
														name="attendance_<%=current.getStudent_id()%>"
														id="optionsRadios2" value="op2">
												</label></td>
												<td><label> <input type="radio"
														name="attendance_<%=current.getStudent_id()%>"
														id="optionsRadios3" value="op3">
												</label></td>

											</tr>
											<%
												}
											%>
--%>



								</table>

								<br> <br>
								<div class="btn-group pull-right">
									<button type="submitButton" class="btn btn-block btn-danger"
										onclick="getAttendanceList()">Submit</button>
									<button class='gen_btn' id="genFileButton"
										onclick="genAttendanceList()"
										style="padding: 5px; background-color: #743ED9; color: white; font-family: arial; font-size: 13px; border: 2px solid black">Generate
										File</button>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
						class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-user bg-yellow"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His
										Profile</h4>

									<p>New phone +1(800)555-1234</p>
								</div>
						</a></li>
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing
										List</h4>

									<p>nora@example.com</p>
								</div>
						</a></li>
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254
										Executed</h4>

									<p>Execution time 5 seconds</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span
										class="label label-danger pull-right">70%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Update Resume <span class="label label-success pull-right">95%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success"
										style="width: 95%"></div>
								</div>
						</a></li>
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Laravel Integration <span
										class="label label-warning pull-right">50%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning"
										style="width: 50%"></div>
								</div>
						</a></li>
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Back End Framework <span class="label label-primary pull-right">68%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary"
										style="width: 68%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Allow mail
								redirect <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Other sets of options are available</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Expose author
								name in posts <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Allow the user to show his name in blog posts</p>
						</div>
						<!-- /.form-group -->

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Show me as
								online <input type="checkbox" class="pull-right" checked>
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Turn off
								notifications <input type="checkbox" class="pull-right">
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Delete chat
								history <a href="javascript::;" class="text-red pull-right"><i
									class="fa fa-trash-o"></i></a>
							</label>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.1.4 -->
	<script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="../plugins/fastclick/fastclick.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../dist/js/demo.js"></script>
	<script src="../dist/js/attendanceList.js"></script>
	<!-- page script -->
	<script>
		$(function() {

			$('#example1').DataTable({
				"paging" : false,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : false,
				"info" : true,
				"autoWidth" : true
			});
		});
	</script>
</body>
</html>