<%@page import="mapping.Panier"%>
<%@page import="mapping.Client"%>
<%@page import="mapping.Article2"%>
<%@page import="fonction.Fonction"%>
<%
    Fonction f = new Fonction();
    Article2[] art = f.listArticle();

    Panier panier = null;
    Client c = null;
    boolean checksession = false;
    if (null != session.getAttribute("client")) {
        checksession = true;
        c = (Client) session.getAttribute("client");
        panier = (Panier) session.getAttribute("panier");
    }

    String id_article = request.getParameter("id");

    int id = Integer.parseInt(request.getParameter("id"));
    Article2 fiche_art = f.get_FicheArticle(id);
    
    String url = request.getRequestURI();
    String query=request.getQueryString();
    
    
    String addpanier = "AddArticleToPanier";
    String target = "";
    String submit = "submit";
    if (checksession == false) {
        addpanier = "#myModal";
        target = "#myModal";
        submit = "button";
    }
%>
?<!DOCTYPE html>
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
                <a class="navbar-brand" href="index.jsp" style="font-family: cursive">E-VAROTRA</a>
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
                    <% if (checksession == false) { %>
                    <li>
                        <a href="#myModal" data-toggle="modal"><i class="glyphicon  glyphicon-user" ></i></a>
                    </li>
                    <% } %>
                    <% if (checksession == true) { %>
                    <li>
                        <a href="#" class="text-center"><% out.print(c.getNom()); %></a>
                    </li>
                    <li>
                        <a href="Deconnexion" class="text-center" ><i class="glyphicon glyphicon-off"></i></a>
                    </li>
                    <% } %>
                    <li>
                        <a href="product_summary.jsp" class="text-center" ><i class="glyphicon glyphicon-shopping-cart"></i></a>
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
                    <form method="POST" action="Authentification">
                        <div class="modal-header backg-brw">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Sign In :</h4>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <div class="input-group">
                                    <input name="uri" type="hidden" value="<% out.print(url+"?"+query); %>" >
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input id="email" type="text" class="form-control" name="email" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="password" type="password" class="form-control" name="mdp" placeholder="Password">
                                </div>
                            </div>
                            <a href="register.jsp" class="my-color">Sign Up</a>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button class="btn base-background pull-right">Se connecter</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>

        <!-- Header End====================================================================== -->
        <div id="mainBody">
            <div class="container">
                <div class="row">
                    <!-- Sidebar ================================================== -->
                    <div id="sidebar" class="col-md-3">
                        <% if(checksession==false){  %>
                        <div class="well well-small text-center">
                            <a id="myCart" href="product_summary.jsp">
                                <img src="themes/images/ico-cart.png" alt="cart">0 Items in your cart
                            </a><br>
                            <span class="badge badge-warning" style="font-size: 18px;">0 Ar</span>
                        </div>
                        <% } %>
                        <% if(checksession!=false){  %>
                        <div class="well well-small text-center">
                            <a id="myCart" href="product_summary.jsp">
                                <img src="themes/images/ico-cart.png" alt="cart"><% out.print(panier.getNombreArticle()); %> Items in your cart
                            </a><br>
                            <span class="badge badge-warning" style="font-size: 18px;"><% out.print(panier.getTotalRemiseTVA()); %> Ar</span>
                        </div>
                        <% } %>
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
                            <li><a href="products.jsp">Products</a> <span class="divider"></span></li>
                            <li class="active">product Details</li>
                        </ul>	
                        <div class="row">	  
                            <div id="gallery" class="col-md-4">
                                <a href="<% out.print(fiche_art.getImage()); %>" title="<% out.print(fiche_art.getNomArticle()); %>">
                                    <img src="<% out.print(fiche_art.getImage()); %>" style="width:100%" alt="<% out.print(fiche_art.getNomArticle()); %>"/>
                                </a>
                            </div>
                            <div class="col-md-8">
                                <h3><% out.print(fiche_art.getNomArticle()); %> </h3>

                                <hr class="soft"/>

                                <form class="form-horizontal qtyFrm" method="POST" action="<% out.print(addpanier); %>" <% if (checksession == false) { %> data-toggle="modal" data-target="<% out.print(target); %>" <% } %>>
                                    <div class="control-group">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><strong><% out.print(fiche_art.getPrixString()); %> Ar</strong></span>
                                                    <input name="idarticle" type="hidden" value="<% out.print(fiche_art.getIdArticle()); %>" >
                                                    <input type="number" name="quantite" class="form-control pull-right" placeholder="Quantity" min="1" value="1">
                                                    <span class="input-group-btn">
                                                        <button class="btn my-btn" type="<% out.print(submit);  %>">Add to cart <i class="glyphicon glyphicon-shopping-cart"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <hr class="soft"/>

                                <h4>100 items in stock</h4>

                                <hr class="soft clr"/>

                                <h5><strong>Category :</strong> <span class="btn btn-default btn-sm"><% out.print(fiche_art.getCategorie()); %></span></h5>

                                <hr class="soft clr"/>

                                <h5><strong>Sub-Category :</strong> <span class="btn btn-default btn-sm"><% out.print(fiche_art.getSousCategorie()); %></span></h5>

                                <hr class="soft clr"/>
                                <h5><strong>Description :</strong></h5>
                                <p style="font-size: 15px;"><% out.print(fiche_art.getDescription());%></p>
                                <!--<a class="btn btn-small my-color pull-right" href="#detail">More Details</a> -->
                                <br class="clr"/>
                                <a href="#" name="detail"></a>
                                <hr class="soft"/>
                            </div>

                            <!--<div class="span9">
                <ul id="productDetail" class="nav nav-tabs">
                  <li class="active"><a href="#home" data-toggle="tab" class="my-color">Product Details</a></li>
                  <li><a href="#profile" data-toggle="tab" class="my-color">Related Products</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade active in" id="home">
                                            <h4>Product Information</h4>
                                            <table class="table table-bordered">
                                                    <tbody>
                                                            <tr class="techSpecRow"><th colspan="2">Product Details</th></tr>
                                                            <tr class="techSpecRow"><td class="techSpecTD1">Category</td><td class="techSpecTD2">FinePix S2950HD</td></tr>
                                                            <tr class="techSpecRow"><td class="techSpecTD1">sub-category</td><td class="techSpecTD2">FinePix S2950HD</td></tr>
                                                            <tr class="techSpecRow"><td class="techSpecTD1">Brand: </td><td class="techSpecTD2">Fujifilm</td></tr>
                                                            <tr class="techSpecRow"><td class="techSpecTD1">Released on:</td><td class="techSpecTD2"> 2011-01-28</td></tr>
                                                            <tr class="techSpecRow"><td class="techSpecTD1">Dimensions:</td><td class="techSpecTD2"> 5.50" h x 5.50" w x 2.00" l, .75 pounds</td></tr>
                                                            <tr class="techSpecRow"><td class="techSpecTD1">Display size:</td><td class="techSpecTD2">3</td></tr>
                                                    </tbody>
                                            </table>
                            <!--
                            <h5>Features</h5>
                            <p>
                            14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode. Face Detection technology with Blink detection and Smile and shoot mode. 4 x AA batteries not included. WxDxH 110.2 ×81.4x73.4mm. Weight 0.341kg (excluding battery and memory card). Weight 0.437kg (including battery and memory card).<br/>
                            OND363338
                            </p>

                            <h4>Editorial Reviews</h4>
                            <h5>Manufacturer's Description </h5>
                            <p>
                            With a generous 18x Fujinon optical zoom lens, the S2950 really packs a punch, especially when matched with its 14 megapixel sensor, large 3.0" LCD screen and 720p HD (30fps) movie capture.
                            </p>

                            <h5>Electric powered Fujinon 18x zoom lens</h5>
                            <p>
                            The S2950 sports an impressive 28mm – 504mm* high precision Fujinon optical zoom lens. Simple to operate with an electric powered zoom lever, the huge zoom range means that you can capture all the detail, even when you're at a considerable distance away. You can even operate the zoom during video shooting. Unlike a bulky D-SLR, bridge cameras allow you great versatility of zoom, without the hassle of carrying a bag of lenses.
                            </p>
                            <h5>Impressive panoramas</h5>
                            <p>
                            With its easy to use Panoramic shooting mode you can get creative on the S2950, however basic your skills, and rest assured that you will not risk shooting uneven landscapes or shaky horizons. The camera enables you to take three successive shots with a helpful tool which automatically releases the shutter once the images are fully aligned to seamlessly stitch the shots together in-camera. It's so easy and the results are impressive.
                            </p>

                            <h5>Sharp, clear shots</h5>
                            <p>
                            Even at the longest zoom settings or in the most challenging of lighting conditions, the S2950 is able to produce crisp, clean results. With its mechanically stabilised 1/2 3", 14 megapixel CCD sensor, and high ISO sensitivity settings, Fujifilm's Dual Image Stabilisation technology combines to reduce the blurring effects of both hand-shake and subject movement to provide superb pictures.
                            </p>
                        
                    </div>
                    <div class="tab-pane fade" id="profile">
                            <div id="myTab" class="pull-right">
                                    <a href="#listView" data-toggle="tab"><span class="btn btn-large my-color"><i class="glyphicon glyphicon-th-list"></i></span></a>
                                    <a href="#blockView" data-toggle="tab"><span class="btn btn-large my-btn"><i class="glyphicon glyphicon-th-large"></i></span></a>
                            </div>
                            <br class="clr"/>
                            <hr class="soft"/>
                            <div class="tab-content">
                                    <div class="tab-pane" id="listView">
                                            <div class="row">	  
                                                    <div class="span2">
                                                            <img src="themes/images/products/4.jpg" alt=""/>
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
                                                            <img src="themes/images/products/5.jpg" alt=""/>
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
                                                    <img src="themes/images/products/6.jpg" alt=""/>
                                                    </div>
                                                    <div class="span4">
                                                            <h3>New | Available</h3>				
                                                            <hr class="soft"/>
                                                            <h5>Product Name </h5>
                                                            <p>
                                                            Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
                                                            that is why our goods are so popular..
                                                            </p>
                                                            <a class="btn btn-small my-color  pull-right" href="product_details.jsp">View Details</a>
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
                                                    <img src="themes/images/products/7.jpg" alt=""/>
                                                    </div>
                                                    <div class="span4">
                                                            <h3>New | Available</h3>				
                                                            <hr class="soft"/>
                                                            <h5>Product Name </h5>
                                                            <p>
                                                            Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
                                                            that is why our goods are so popular..
                                                            </p>
                                                            <a class="btn btn-small my-color  pull-right" href="product_details.jsp">View Details</a>
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
                                                    </div>>
                                            </div>
                                    
                                            <hr class="soft"/>
                                            <div class="row">	  
                                                    <div class="span2">
                                                    <img src="themes/images/products/8.jpg" alt=""/>
                                                    </div>
                                                    <div class="span4">
                                                            <h3>New | Available</h3>				
                                                            <hr class="soft"/>
                                                            <h5>Product Name </h5>
                                                            <p>
                                                            Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
                                                            that is why our goods are so popular..
                                                            </p>
                                                            <a class="btn btn-small my-color   pull-right" href="product_details.jsp">View Details</a>
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
                                                    <img src="themes/images/products/9.jpg" alt=""/>
                                                    </div>
                                                    <div class="span4">
                                                            <h3>New | Available</h3>				
                                                            <hr class="soft"/>
                                                            <h5>Product Name </h5>
                                                            <p>
                                                            Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
                                                            that is why our goods are so popular..
                                                            </p>
                                                            <a class="btn btn-small my-color   pull-right" href="product_details.jsp">View Details</a>
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
                                    <div class="tab-pane active" id="blockView">
                                            <ul class="list-product">
                                                    <li class="col-md-4">
                                                      <div class="thumbnail">
                                                            <a  href="product_details.jsp"><img src="themes/images/products/6.jpg" alt=""/></a>
                                                            <div class="caption">
                                                              <h5>Product name</h5>
                                                              <p> 
                                                                    Lorem Ipsum is simply dummy text. 
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
                                                            <a  href="product_details.jsp"><img src="themes/images/products/6.jpg" alt=""/></a>
                                                            <div class="caption">
                                                              <h5>Product name</h5>
                                                              <p> 
                                                                    Lorem Ipsum is simply dummy text. 
                                                              </p>
                                                              <h4 style="text-align:center"><a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i></a> <span class="my-btn" href="#">$222.00</span></h4>
                                                            </div>
                                                      </div>
                                                    </li>
                                                    <li class="col-md-4">
                                                      <div class="thumbnail">
                                                            <a  href="product_details.jsp"><img src="themes/images/products/6.jpg" alt=""/></a>
                                                            <div class="caption">
                                                              <h5>Product name</h5>
                                                              <p> 
                                                                    Lorem Ipsum is simply dummy text. 
                                                              </p>
                                                              <h4 style="text-align:center"><a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i></a> <span class="my-btn" href="#">$222.00</span></h4>
                                                            </div>
                                                      </div>
                                                    </li>
                                                    <li class="col-md-4">
                                                      <div class="thumbnail">
                                                            <a  href="product_details.jsp"><img src="themes/images/products/6.jpg" alt=""/></a>
                                                            <div class="caption">
                                                              <h5>Product name</h5>
                                                              <p> 
                                                                    Lorem Ipsum is simply dummy text. 
                                                              </p>
                                                              <h4 style="text-align:center"><a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i></a> <span class="my-btn" href="#">$222.00</span></h4>
                                                            </div>
                                                      </div>
                                                    </li>
                                                    <li class="col-md-4">
                                                      <div class="thumbnail">
                                                            <a  href="product_details.jsp"><img src="themes/images/products/6.jpg" alt=""/></a>
                                                            <div class="caption">
                                                              <h5>Product name</h5>
                                                              <p> 
                                                                    Lorem Ipsum is simply dummy text. 
                                                              </p>
                                                              <h4 style="text-align:center"><a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i></a> <span class="my-btn" href="#">$222.00</span></h4>
                                                            </div>
                                                      </div>
                                                    </li>
                                                    <li class="col-md-4">
                                                      <div class="thumbnail">
                                                            <a  href="product_details.jsp"><img src="themes/images/products/6.jpg" alt=""/></a>
                                                            <div class="caption">
                                                              <h5>Product name</h5>
                                                              <p> 
                                                                    Lorem Ipsum is simply dummy text. 
                                                              </p>
                                                              <h4 style="text-align:center"><a class="btn my-color" href="product_details.jsp"> <i class="glyphicon glyphicon-plus-sign"></i></a> <a class="btn my-color" href="#"><i class="glyphicon glyphicon-shopping-cart"></i></a> <span class="my-btn" href="#">$222.00</span></h4>
                                                            </div>
                                                      </div>
                                                    </li>
                                             </ul>
                                    <hr class="soft"/>
                                    </div>
                            </div>
                    <br class="clr">
                             </div>
    </div> -->
                        </div>

                    </div>
                </div>
            </div> </div>
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
    <!-- Placed at the end of the document so the pages load faster ============================================= --><script src="bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/prettify.js"></script>
    <script src="bootstrap/js/bootshop.js"></script>
    <script src="bootstrap/js/jquery.lightbox-0.5.js"></script>
</body>
</html>