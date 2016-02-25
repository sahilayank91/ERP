<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>ERP IIITK</title>
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
		<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../plugins/iCheck/flat/blue.css">
		<link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
		<link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
		<script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
		<link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker-bs3.css">
		<link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
		
		<script type="text/javascript">
		    $(document).ready(function(){
		    	$("#step-2").hide();
		    	$("#step-3").hide();
		    	$("#step-4").hide();
		    	
		    	$("#title-1").click(function(){
		    				  $("#step-1").toggle("slide","left",500);
		    				  $("#step-2").hide();
		    				  $("#step-3").hide();
		    				  $("#step-4").hide();
		    				  				  });
		    	$("#step1").click(function(){
		    				$("#step-1").hide();
		    			 	$("#step-2").toggle("slide","right",500);
		    								});
		    	
		    	
		    	
		    	$("#title-2").click(function(){
		    				  $("#step-2").toggle("slide","left",500);
		    				  $("#step-1").hide();
		    				  $("#step-3").hide();
		    				  $("#step-4").hide();
		    				  				  });
		    	$("#step2").click(function(){
		    				$("#step-2").hide();
		    				$("#step-3").toggle("slide","right",500);
		    								});
		    	$("#step_2").click(function(){
		    				 $("#step-2").hide();
		    				 $("#step-1").toggle("slide","left",500);
		    				 				 });
		    	
		    	
		    	$("#title-3").click(function(){
		    				  $("#step-3").toggle("slide","left",500);
		    				  $("#step-1").hide();
		    				  $("#step-2").hide();
		    				  $("#step-4").hide();
		    				  				  });
		    	$("#step3").click(function(){
		    				$("#step-3").hide();
		    				$("#step-4").toggle("slide","right",500);
		    								});
		    	$("#step_3").click(function(){
		    				 $("#step-3").hide();
		    				 $("#step-2").toggle("slide","left",500);
		    				 				 });
		    	
		    	
		    	$("#title-4").click(function(){
		    				  $("#step-4").toggle("slide","left",500);
		    				  $("#step-1").hide();
		    				  $("#step-2").hide();
		    				  $("#step-3").hide();
		    				  				  });		    	
		    	$("#step_4").click(function(){
		    				 $("#step-4").hide();
		    				 $("#step-3").toggle("slide","left",500);
		    				 				 });
		    });
		</script>
		
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	
    <body class="hold-transition skin-blue sidebar-mini" style="background:url('../image/image.jpg');background-size:cover;">
        <div class="wrapper">
            <%@ include file="../student/header.jsp" %>
 			
 			
 <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar col-xs-6">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <br>
      <div class="small-box bg-aqua" id="title-1">
            <div class="inner">
              <h3>Step 1</h3>

              <p>Title 1</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
       
       <div class="small-box bg-green" id="title-2">
            <div class="inner">
              <h3>Step 2</h3>

              <p>Title 2</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
      
       <div class="small-box bg-yellow" id="title-3">
            <div class="inner">
              <h3>Step 3</h3>

              <p>Title 3</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
          
       <div class="small-box bg-red" id="title-4">
            <div class="inner">
              <h3>Step 4</h3>

              <p>Title 4</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>          
      
    </section>
    <!-- /.sidebar -->
  </aside> 			 			
			
			<div class="content-wrapper" style="min-height: 901px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
      	<div class="col-md-12">
      	    <div class="col-md-3"></div>
      	    
      	    <div class="col-md-6">
      	    <div id="step-1">
      	    	<div class="box box-primary">
      			<!-- /.register-box -->
		<div class="register-logo">
                <a href="#"><b>ERP</b></a>
                 <h4>Update your profile</h4>
                 <h3>Step 1</h3>
            </div>
        <div class="register-box">
            <div class="register-box-body">
               	<form action="" method="post">
					<div class="form-group has-feedback">
						<input type="text" name="std_id" class="form-control" placeholder="Sudent ID">
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="std_main" class="form-control" placeholder="JEE Main Roll No.">
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="std_advanced" class="form-control" placeholder="JEE Advanced Roll No.">
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="name" class="form-control" placeholder="Sudent Name">
					</div>
					
					<div class="form-group has-feedback">
						<select class="form-control" name="category">
							<option value="">Category</option>
							<option value="General">General</option>
							<option value="OBC">OBC</option>
							<option value="SC">SC</option>
							<option value="ST">ST</option>
						</select>
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="pwd" class="form-control" placeholder="PWD">
					</div>
					
					<div class="row">
						<div class="col-xs-4 pull-right">
							<input type="button" name="step-1" id="step1" value="Next" class="btn btn-primary btn-block btn-flat"/>
						</div>
						<!-- /.col -->
					</div>
					
				</form>
					</div>
			<!-- /.form-box -->
        </div>
        
        
      		</div>
      	    </div>
      	    
      	    <div id="step-2">
      	    <div class="box box-primary">
      			<!-- /.register-box -->
		<div class="register-logo">
                <a href="#"><b>ERP</b></a>
                 <h4>Update your profile</h4>
                 <h3>Step 2</h3>
            </div>
        <div class="register-box">
            <div class="register-box-body">
               	<form action="" method="post">
               	
               		<div class="form-group has-feedback">
						<input type="text" name="gender" class="form-control" placeholder="Gender">
					</div>
               	
					<div class="form-group has-feedback">
						<input type="date" name="dob" class="form-control" placeholder="Date of Birth">
					</div>
      
					<div class="form-group has-feedback">
						<input type="text" name="state" class="form-control" placeholder="State">
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="is_prep" class="form-control" placeholder="Is Prep">
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="nationality" class="form-control" placeholder="Nationality">
					</div>
					
					<div class="form-group has-feedback">
						<select class="form-control" name="p_category">
							<option value="">Program Allocated</option>
							<option value="CSE">Computer Science & Engineering</option>
							<option value="ECE">Electronice & Communication Engineering</option>
						</select>
					</div>
					
					
					<div class="row">
						<div class="col-xs-4">
							<input type="button" name="step_2" id="step_2" value="Prev" class="btn btn-warning btn-block btn-flat"/>
						</div>
						<div class="col-xs-4 pull-right">	
							<input type="button" name="step-2" id="step2" value="Next" class="btn btn-primary btn-block btn-flat"/>
						</div>
						<!-- /.col -->
					</div>
					
				</form>
					</div>
			<!-- /.form-box -->
        </div>
        
        
      		</div>
  
  			</div>
  			
  			<div id="step-3">
  
  			<div class="box box-primary">
      			<!-- /.register-box -->
		<div class="register-logo">
                <a href="#"><b>ERP</b></a>
                 <h4>Update your profile</h4>
                 <h3>Step 3</h3>
            </div>
        <div class="register-box">
            <div class="register-box-body">
               	<form action="" method="post">
               					
					<div class="form-group has-feedback">
						<select class="form-control" name="a_category">
							<option value="">Allocated Category</option>
							<option value="Open">Open</option>
							<option value="Close">Close</option>
						</select>
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="rank" class="form-control" placeholder="Allocated Rank">
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="choice" class="form-control" placeholder="Choice No.">
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="quota" class="form-control" placeholder="Quota">
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="round" class="form-control" placeholder="Round">
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="willingness" class="form-control" placeholder="Willingness">
					</div>
					
					<div class="row">
						<div class="col-xs-4">
							<input type="button" name="step_3" id="step_3" value="Prev" class="btn btn-warning btn-block btn-flat"/>
						</div>
						<div class="col-xs-4 pull-right">
							<input type="button" name="step-3" id="step3" value="Next" class="btn btn-primary btn-block btn-flat"/>
						</div>
						<!-- /.col -->
					</div>
					
				</form>
					</div>
			<!-- /.form-box -->
        </div>
        
        
      		</div>
      		
      		</div>
      		
      		<div id="step-4">
      		<div class="box box-primary">
      			<!-- /.register-box -->
		<div class="register-logo">
                <a href="#"><b>ERP</b></a>
                 <h4>Update your profile</h4>
                 <h3>Step 4</h3>
            </div>
        <div class="register-box">
            <div class="register-box-body">
               	<form action="" method="post">
               		
					<div class="form-group has-feedback">
						<input type="text" name="status" class="form-control" placeholder="Status">
					</div>
					
					<div class="form-group has-feedback">
						<input type="text" name="mobile" class="form-control" placeholder="Mobile">
					</div>
					
					<div class="form-group has-feedback">
						<input type="email" name="email" class="form-control" placeholder="Email">
					</div>
					
					<div class="form-group has-feedback">
						<textarea name="address" placeholder="Address..." class="form-control"/></textarea>
					</div>
					
					<div class="form-group has-feedback">
						<textarea name="rcname" placeholder="RC Name" class="form-control"/></textarea>
					</div>
					
					<div class="form-group has-feedback">
						<textarea name="sign" placeholder="Signature" class="form-control"/></textarea>
					</div>
					
					<div class="row">
						<div class="col-xs-4">
							<input type="button" name="step_4" id="step_4" value="Prev" class="btn btn-warning btn-block btn-flat"/>
						</div>
						<div class="col-xs-4 pull-right">
							<input type="button" name="step-4" id="step4" value="Submit" class="btn btn-primary btn-block btn-flat"/>
						</div>
						<!-- /.col -->
					</div>
					
				</form>
					</div>
			<!-- /.form-box -->
        </div>
        
        
      		</div>
      	    
      	    </div>
      	    
      	    </div>
      	    <div class="col-md-3"></div>
      		
      	</div>
      </div>
    </section>
    <!-- /.content -->
  </div>
		</div>
        
				
		<script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
		<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<script src="../bootstrap/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
		<script src="../plugins/morris/morris.min.js"></script>
		<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
		<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
		<script src="../plugins/knob/jquery.knob.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
		<script src="../plugins/daterangepicker/daterangepicker.js"></script>
		<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
		<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<script src="../plugins/fastclick/fastclick.min.js"></script>
		<script src="../dist/js/app.min.js"></script>
		<script src="../dist/js/pages/dashboard.js"></script>
		<script src="../dist/js/demo.js"></script>
	</body>
	
</html>