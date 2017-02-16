<%@page import="mapping.Panier"%>
<%@page import="mapping.PanierArticle"%>
<%@page import="mapping.Client"%>
<%@page import="mapping.Article2"%>
<%@page import="fonction.Fonction"%>
<%
    Fonction f = new Fonction();
    Article2[] art = f.listArticle();

    Client c = null;
    boolean checksession = false;
    if (null != session.getAttribute("client")) {
        checksession = true;
        c = (Client) session.getAttribute("client");
    }

    Panier panier = null;
    boolean checkpanier = false;
    String validePanier="#myModal";
    int taille=0;
    if (null != session.getAttribute("panier")) {
        checkpanier = true;
        panier = (Panier) session.getAttribute("panier");
        taille=panier.getNombreArticle();
        validePanier="#valideModal";
    }

    String url = request.getRequestURI();
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
                                    <input name="uri" type="hidden" value="<% out.print(url); %>" >
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
                                    
        <div class="modal fade" id="valideModal" role="dialog">
            <div class="modal-dialog modal-sm">

                <!-- Modal content-->
                <div class="modal-content">
                    <form method="POST" action="ValidePanier">
                        <div class="modal-header backg-brw">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title text-center">Valide your cart ?</h4>
                        </div>
                        <div class="modal-body">
                            <p class="text-center text-danger">You will receive an Invoice if you accept and will be redirect to Payement.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">No</button>
                            <button class="btn base-background pull-right">Yes</button>
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
                                <img src="themes/images/ico-cart.png" alt="cart"><% out.print(taille); %> Items in your cart
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
                            <li><a href="index.jsp">Home</a></li>
                            <li class="active"> SHOPPING CART</li>
                        </ul>
                        <h3>  SHOPPING CART [ <small><% out.print(taille); %> Item(s) </small>]<a href="products.jsp" class="btn btn-large pull-right"><i class="glyphicon glyphicon-shopping-cart"></i> Continue Shopping </a></h3>	
                        <hr class="soft"/>	

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Description</th>
                                    <th>Quantity/Update</th>
                                    <th>Price(Ariary)</th>
                                    <!--
                                    <th>Discount</th>
                                    <th>Tax</th>
                                    -->
                                    <th>Total(Ariary)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (checkpanier != false) {
                                        for (int i = 0; i < panier.getList_art().size(); i++) {
                                %>
                                <tr>
                                    <td> <img width="60" src="<% out.print(panier.getList_art().get(i).getArt().getImage()); %>" alt=""/></td>
                                    <td><% out.print(panier.getList_art().get(i).getArt().getNomArticle()); %></td>
                                    <td>
                                        <div class="control-group input-sm">
                                            <div class="input-group input-sm">
                                                <span class="input-group-btn">
                                                    <button class="btn my-btn" type="button"> <i class="glyphicon glyphicon-minus-sign"></i></button>
                                                </span>
                                                <input type="text" class="form-control text-right input-sm" readonly placeholder="Quantity" min="1" value="<% out.print(panier.getList_art().get(i).getQuantite()); %>">
                                                <span class="input-group-btn">
                                                    <button class="btn my-btn" type="button"> <i class="glyphicon glyphicon-plus-sign"></i></button>
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-right"><% out.print(panier.getList_art().get(i).getArt().getPrixString()); %></td>
                                    <td class="text-right"><% out.print(panier.getList_art().get(i).getMontantString()); %></td>
                                    <td>
                                        <form method="POST" action="SuppArtPanier">
                                            <input name="idart" type="hidden" value="<% out.print(i); %>" >
                                            <input name="uri" type="hidden" value="<% out.print(url); %>" >
                                            <button class="btn btn-danger btn-sm" type="submit">X</button>
                                        </form>
                                    </td>
                                </tr>
                                <%      } %>
                                    
                                <tr>
                                    <td colspan="4" style="text-align:right"><strong>TVA =</strong></td>
                                    <td class="text-right"> <strong> <% out.print(panier.getTVAString()); %> </strong></td>
                                </tr>
                                
                                <tr>
                                    <td colspan="4" style="text-align:right"><strong>DISCOUNT =</strong></td>
                                    <td class="text-right"> <strong> <% out.print(panier.getRemiseString()); %> </strong></td>
                                </tr>
                                <% } %>
                                
                                <tr>
                                    <td colspan="4" style="text-align:right"><strong>TOTAL PRICE =</strong></td>
                                    <% if (checkpanier != false) { %>
                                    <td class="text-right"> <strong> <% out.print(panier.getTotalRemiseTVA()); %> </strong></td>
                                    <% } %>
                                    <% if (checkpanier == false) { %>
                                    <td class="text-right"> <strong> 0 </strong></td>
                                    <% }%>
                                </tr>
                            </tbody>
                        </table>

                                    <a href="<% out.print(validePanier); %>" class="btn btn-success pull-right" data-toggle="modal" >Validate your cart</a> <br>

                    </div>
                </div></div>
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