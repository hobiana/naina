<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootshop online Shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	
<!-- Bootstrap style --> 
    <link id="callCss" rel="stylesheet" href="bootstrap/css/bootstrap.min.css" media="screen"/>
    <link id="callCss" rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" media="screen"/>
    <link id="callCss" rel="stylesheet" href="bootstrap/css/font-awesome.css" media="screen"/>
    <link id="callCss" rel="stylesheet" href="bootstrap/css/base.css" media="screen"/>
    <link id="callCss" rel="stylesheet" href="bootstrap/css/style.css" media="screen"/>
  </head>
  <nav class="navbar  navbar-fixed-top my-nav" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar" style="background: white"></span>
                    <span class="icon-bar" style="background: white"></span>
                    <span class="icon-bar" style="background: white"></span>
                </button>
                <a class="navbar-brand" href="#" style="font-family: cursive">E-VAROTRA</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav center-block">
                    <li>
                        <a href="#" class="text-center">About us</a>
                    </li>
                    <li>
                        <a href="#" class="text-center">Services</a>
                    </li>
                    <li>
                        <a href="#" class="text-center">Contact</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#" class="text-center">Jean Rabe</a>
                    </li>
                    <li>
                    	<a href="#myModal" data-toggle="modal"><i class="glyphicon  glyphicon-user" ></i></a>
                    </li>
                    <li>
                        <a href="#" class="text-center" ><i class="glyphicon glyphicon-shopping-cart"></i></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
<body>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
        <div class="modal-content">
	        <div class="modal-header backg-brw">
	            <button type="button" class="close" data-dismiss="modal">&times;</button>
	            <h4 class="modal-title">Sign In :</h4>
	        </div>
	        <div class="modal-body">
	            <div class="form-group">
					<div class="input-group">
				      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				      <input id="email" type="text" class="form-control" name="email" placeholder="Email">
				    </div>
				</div>
				<div class="form-group">
					<div class="input-group">
				      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				      <input id="password" type="password" class="form-control" name="password" placeholder="Password">
				    </div>
				</div>
				<a href="register.jsp" class="my-color">Sign Up</a>
	        </div>
	        <div class="modal-footer">
	            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
	            <button class="btn base-background pull-right">Se connecter</button>
	        </div>
        </div>
      
    </div>
  </div>
<!-- Header End====================================================================== -->
<div id="mainBody">
<div class="container">
        <hr>
	<h1 class="page-header">Visit us</h1>	
	<div class="row">
		<div class="col-md-4">
                    <h4>Contact Details</h4>
                    <p>	18 Fresno,<br/> CA 93727, USA
                            <br/><br/>
                            info@e-varotra.com<br/>
                            Tel: 020 22 685 55<br/>
                            E-varotra.com
                    </p>		
		</div>
			
		<div class="col-md-4">
                    <h4>Opening Hours</h4>
                    <h5><u>Monday - Friday</u></h5>
                    <p>09:00am - 09:00pm<br/><br/></p>
                    <h5><u>Saturday</u></h5>
                    <p>09:00am - 07:00pm<br/><br/></p>
                    <h5><u>Sunday</u></h5>
                    <p>12:30pm - 06:00pm<br/><br/></p>
		</div>
		<div class="col-md-4">
                    <h4>Email Us</h4>
                    <form class="form-horizontal">
                        <fieldset>
                            <div class="control-group">
                                <div class="controls">
                                        <input type="text" class="form-control" id="inputPassword1" placeholder="Name">
                                </div>
                            </div><br>
                            <div class="control-group">
                                <div class="controls">
                                        <input type="text" class="form-control" id="inputPassword1" placeholder="E-mail">
                                </div>
                            </div><br>
                            <div class="control-group">
                                <div class="controls">
                                        <input type="text" class="form-control" id="inputPassword1" placeholder="Subject">
                                </div>
                            </div><br>
                          <div class="control-group">
                              <textarea rows="3"  class="form-control" id="textarea" class="input-xlarge"></textarea>
                          </div><br>

                            <button class="btn btn-large" type="submit">Send Messages</button>

                        </fieldset>
                    </form>
		</div>
	</div>
</div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
	<div  id="footerSection">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h5>ACCOUNT</h5>
				<a href="login.jsp">YOUR ACCOUNT</a>
				<a href="login.jsp">PERSONAL INFORMATION</a> 
				<a href="login.jsp">ADDRESSES</a> 
				<a href="login.jsp">DISCOUNT</a>  
				<a href="login.jsp">ORDER HISTORY</a>
			 </div>
			<div class="col-md-3">
				<h5>INFORMATION</h5>
				<a href="contact.jsp">CONTACT</a>  
				<a href="register.jsp">REGISTRATION</a>  
				<a href="legal_notice.jsp">LEGAL NOTICE</a>  
				<a href="tac.jsp">TERMS AND CONDITIONS</a> 
				<a href="faq.jsp">FAQ</a>
			 </div>
			<div class="col-md-3">
				<h5>OUR OFFERS</h5>
				<a href="#">NEW PRODUCTS</a> 
				<a href="#">TOP SELLERS</a>  
				<a href="special_offer.jsp">SPECIAL OFFERS</a>  
				<a href="#">MANUFACTURERS</a> 
				<a href="#">SUPPLIERS</a> 
			 </div>
			<div id="socialMedia" class="col-md-3 pull-right">
				<h5>SOCIAL MEDIA </h5>
				<a href="#"><img width="60" height="60" src="themes/images/facebook.png" title="facebook" alt="facebook"/></a>
				<a href="#"><img width="60" height="60" src="themes/images/twitter.png" title="twitter" alt="twitter"/></a>
				<a href="#"><img width="60" height="60" src="themes/images/youtube.png" title="youtube" alt="youtube"/></a>
			 </div> 
		 </div>
		<p class="text-center">&copy; E-VAROTRA</p>
	</div><!-- Container End -->
	</div>
<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="bootstrap/js/jquery.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/prettify.js"></script>
	<script src="bootstrap/js/bootshop.js"></script>
    <script src="bootstrap/js/jquery.lightbox-0.5.js"></script>
</body>
</html>