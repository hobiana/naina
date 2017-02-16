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
	<div class="row">
<!-- Sidebar ================================================== -->
	<div id="sidebar" class="col-md-3">
		<div class="well well-small"><a id="myCart" href="product_summary.jsp"><img src="themes/images/ico-cart.png" alt="cart">3 Items in your cart  <span class="badge badge-warning pull-right">$155.00</span></a></div>
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
			<li class="subMenu open"><a> ELECTRONICS [230]</a>
				<ul>
				<li><a class="active" href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Cameras (100) </a></li>
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Computers, Tablets & laptop (30)</a></li>
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Mobile Phone (80)</a></li>
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Sound & Vision (15)</a></li>
				</ul>
			</li>
			<li class="subMenu"><a> CLOTHES [840] </a>
			<ul style="display:none">
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Women's Clothing (45)</a></li>
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Women's Shoes (8)</a></li>												
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Women's Hand Bags (5)</a></li>	
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Men's Clothings  (45)</a></li>
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Men's Shoes (6)</a></li>												
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Kids Clothing (5)</a></li>												
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Kids Shoes (3)</a></li>												
			</ul>
			</li>
			<li class="subMenu"><a>FOOD AND BEVERAGES [1000]</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Angoves  (35)</a></li>
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Bouchard Aine & Fils (8)</a></li>												
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>French Rabbit (5)</a></li>	
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Louis Bernard  (45)</a></li>
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>BIB Wine (Bag in Box) (8)</a></li>												
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Other Liquors & Wine (5)</a></li>												
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Garden (3)</a></li>												
				<li><a href="products.jsp"><i class="glyphicon glyphicon-chevron-right"></i>Khao Shong (11)</a></li>												
			</ul>
			</li>
			<li><a href="products.jsp">HEALTH & BEAUTY [18]</a></li>
			<li><a href="products.jsp">SPORTS & LEISURE [58]</a></li>
			<li><a href="products.jsp">BOOKS & ENTERTAINMENTS [14]</a></li>
		</ul>
		<br/>
		  <div class="thumbnail">
			<img src="themes/images/products/panasonic.jpg" alt="Bootshop panasonoc New camera"/>
			<div class="caption">
			  <h5>Panasonic</h5>
				<h4 style="text-align:center">
					<a class="btn my-color" href="product_details.jsp"><i class="glyphicon glyphicon-plus-sign"></i></a> 
					<a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i></a> 
					<a class="btn my-btn" href="#">$222.00</a>
				</h4>
			</div>
		  </div><br/>
			<div class="thumbnail">
				<img src="themes/images/products/kindle.png" title="Bootshop New Kindel" alt="Bootshop Kindel">
				<div class="caption">
				  <h5>Kindle</h5>
				    <h4 style="text-align:center">
					    <a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> 
					    <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i></a> 
					    <a class="btn my-btn" href="#">$222.00</a>
				    </h4>
				</div>
			  </div><br/>
			<div class="thumbnail">
				<img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
				<div class="caption">
				  <h5>Payment Methods</h5>
				</div>
			</div>
	</div>
<!-- Sidebar end=============================================== -->
	<div class="col-md-9">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider"></span></li>
		<li class="active">Products Name</li>
    </ul>
	<h3> Products Name <small class="pull-right"> 40 products are available </small></h3>	
	<hr class="soft"/>
	<p>
		Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - that is why our goods are so popular and we have a great number of faithful customers all over the country.
	</p>
	<hr class="soft"/>
	<form class="form-horizontal span6">
		<div class="control-group">
		  <label class="control-label alignL">Sort By </label>
			<select>
              <option>Priduct name A - Z</option>
              <option>Priduct name Z - A</option>
              <option>Priduct Stoke</option>
              <option>Price Lowest first</option>
            </select>
		</div>
	  </form>
	  
<div id="myTab" class="pull-right">
 <a href="#listView" data-toggle="tab"><span class="btn btn-large my-color"><i class="glyphicon glyphicon-th-list"></i></span></a>
 <a href="#blockView" data-toggle="tab"><span class="btn btn-large my-btn"><i class="glyphicon glyphicon-th-large"></i></span></a>
</div>
<br class="clr"/>
<div class="tab-content">
	<div class="tab-pane" id="listView">
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small my-color pull-right" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
                        <div class="span3 alignR">
                            <form class="form-horizontal qtyFrm">
                                <h3> $222.00</h3>
                                <div class="btn-group">
                                    <a href="product_details.jsp" class="btn btn-large my-btn"> Add to <i class="glyphicon glyphicon-shopping-cart"></i></a>
                                    <a href="product_details.jsp" class="btn btn-large my-color"><i class="glyphicon glyphicon-plus-sign"></i></a>
                                </div>
                            </form>
			</div>
		</div>
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/1.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn my-color btn-small pull-right" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
                            <form class="form-horizontal qtyFrm">
                                <h3> $222.00</h3>
                                <div class="btn-group">
                                    <a href="product_details.jsp" class="btn btn-large my-btn"> Add to <i class="glyphicon glyphicon-shopping-cart"></i></a>
                                    <a href="product_details.jsp" class="btn btn-large my-color"><i class="glyphicon glyphicon-plus-sign"></i></a>
                                </div>
                            </form>
			</div>
		</div>
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right my-color" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
                            <form class="form-horizontal qtyFrm">
                                <h3> $222.00</h3>
                                <div class="btn-group">
                                    <a href="product_details.jsp" class="btn btn-large my-btn"> Add to <i class="glyphicon glyphicon-shopping-cart"></i></a>
                                    <a href="product_details.jsp" class="btn btn-large my-color"><i class="glyphicon glyphicon-plus-sign"></i></a>
                                </div>
                            </form>
			</div>
		</div>
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right my-color" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
                            <form class="form-horizontal qtyFrm">
                                <h3> $222.00</h3>
                                <div class="btn-group">
                                    <a href="product_details.jsp" class="btn btn-large my-btn"> Add to <i class="glyphicon glyphicon-shopping-cart"></i></a>
                                    <a href="product_details.jsp" class="btn btn-large my-color"><i class="glyphicon glyphicon-plus-sign"></i></a>
                                </div>
                            </form>
			</div>
		</div>
	
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right my-color" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
                            <form class="form-horizontal qtyFrm">
                                <h3> $222.00</h3>
                                <div class="btn-group">
                                    <a href="product_details.jsp" class="btn btn-large my-btn"> Add to <i class="glyphicon glyphicon-shopping-cart"></i></a>
                                    <a href="product_details.jsp" class="btn btn-large my-color"><i class="glyphicon glyphicon-plus-sign"></i></a>
                                </div>
                            </form>
			</div>
		</div>
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right my-color" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
                            <form class="form-horizontal qtyFrm">
                                <h3> $222.00</h3>
                                <div class="btn-group">
                                    <a href="product_details.jsp" class="btn btn-large my-btn"> Add to <i class="glyphicon glyphicon-shopping-cart"></i></a>
                                    <a href="product_details.jsp" class="btn btn-large my-color"><i class="glyphicon glyphicon-plus-sign"></i></a>
                                </div>
                            </form>
			</div>
		</div>
		<hr class="soft"/>
	</div>

	<div class="tab-pane  active" id="blockView">
		<ul class="list-product">
			<li class="col-md-4">
			  <div class="thumbnail">
				<a href="product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>Manicure &amp; Pedicure</h5>
				  <p> 
					I'm a paragraph. Click here 
				  </p>
				   <h4 style="text-align:center">
                                        <a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> 
                                        <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i>
                                        </a> <span class="my-btn" href="#">$222.00</span>
                                    </h4>
				</div>
			  </div>
			</li>
			<li class="col-md-4">
			  <div class="thumbnail">
				<a href="product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>Manicure &amp; Pedicure</h5>
				  <p> 
					I'm a paragraph. Click here 
				  </p>
				  <h4 style="text-align:center">
                                        <a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> 
                                        <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i>
                                        </a> <span class="my-btn" href="#">$222.00</span>
                                    </h4>
				</div>
			  </div>
			</li>
			<li class="col-md-4">
			  <div class="thumbnail">
				<a href="product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>Manicure &amp; Pedicure</h5>
				  <p> 
					I'm a paragraph. Click here 
				  </p>
				    <h4 style="text-align:center">
                                        <a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> 
                                        <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i>
                                        </a> <span class="my-btn" href="#">$222.00</span>
                                    </h4>
				</div>
			  </div>
			</li>
			<li class="col-md-4">
			  <div class="thumbnail">
				<a href="product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>Manicure &amp; Pedicure</h5>
				  <p> 
					I'm a paragraph. Click here 
				  </p>
				   <h4 style="text-align:center">
                                        <a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> 
                                        <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i>
                                        </a> <span class="my-btn" href="#">$222.00</span>
                                    </h4>
				</div>
			  </div>
			</li>
			<li class="col-md-4">
			  <div class="thumbnail">
				<a href="product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>Manicure &amp; Pedicure</h5>
				  <p> 
					I'm a paragraph. Click here 
				  </p>
				    <h4 style="text-align:center">
                                        <a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> 
                                        <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i>
                                        </a> <span class="my-btn" href="#">$222.00</span>
                                    </h4>
				</div>
			  </div>
			</li>
			<li class="col-md-4">
			  <div class="thumbnail">
				<a href="product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>Manicure &amp; Pedicure</h5>
				  <p> 
					I'm a paragraph. Click here 
				  </p>
				    <h4 style="text-align:center">
                                        <a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> 
                                        <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i>
                                        </a> <span class="my-btn" href="#">$222.00</span>
                                    </h4>
				</div>
			  </div>
			</li>
		  </ul>
	<hr class="soft"/>
	</div>
</div>
			<br class="clr"/>
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