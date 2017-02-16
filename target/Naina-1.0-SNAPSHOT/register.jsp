<!DOCTYPE html>
 <%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
    <%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
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
    <body onload="JavaScript:getCaptcha()">

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
                            <li class="active">Registration</li>
                        </ul>
                        <h3> Registration</h3>	
                        <div class="container-fluid well">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <form name="form1" method="POST" class="form-horizontal center-block" action="InsertClient" onSubmit="return sendMe()">
                                    <h4><strong><u>Your personal information</u></strong></h4>
                                    <div class="control-group">
                                        <label class="control-label" for="inputFname1">First name <sup>*</sup></label>
                                        <div class="controls">
                                            <input type="text" class="form-control" id="inputFname1" placeholder="First Name" name="firstname" >
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputLnam">Last name <sup>*</sup></label>
                                        <div class="controls">
                                            <input type="text" class="form-control" id="inputLnam" placeholder="Last Name" name="lastname" >
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputPassword1">User <sup>*</sup></label>
                                        <div class="controls">
                                            <input type="text" class="form-control" id="inputPassword1" placeholder="User" name="user" >
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input_email">Password <sup>*</sup></label>
                                        <div class="controls">
                                            <input type="password" class="form-control" id="input_email" placeholder="Email" name="password" >
                                        </div>
                                    </div>	  
                                    <div class="control-group">
                                        <label class="control-label" for="inputPassword1">Confirm Password <sup>*</sup></label>
                                        <div class="controls">
                                            <input type="password" class="form-control" id="inputPassword1" placeholder="Password" name="confirmpassword" >
                                        </div>
                                    </div>	  
                                    <div class="control-group">
                                        <label class="control-label">Date of Birth <sup>*</sup></label>
                                        <div class="controls">
                                            <input type="date" class="form-control" id="inputPassword1" placeholder="" name="dateofbirth" >
                                        </div>
                                    </div>

                                    <h4> <strong><u> Your address</u> </strong> </h4>
                                    <div class="control-group">
                                        <label class="control-label" for="inputFname">E-mail <sup>*</sup></label>
                                        <div class="controls">
                                            <input type="email" class="form-control" id="inputFname" placeholder="E-mail" name="email" >
                                        </div>
                                    </div>				

                                    <div class="control-group">
                                        <label class="control-label" for="address">Address</label>
                                        <div class="controls">
                                            <input type="text" class="form-control" id="address" placeholder="Adress" name="address"/>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="mobile">Mobile Phone </label>
                                        <div class="controls">
                                            <input type="text" class="form-control" id="mobile" placeholder="Mobile Phone" name="mobilephone"/> 
                                        </div>
                                    </div>
                                    
                                    <!--
                                    <div class="control-group">
                                        <%
                                            //ReCaptcha c = ReCaptchaFactory.newReCaptcha(" 6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI", "6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe", false);
                                            //out.print(c.createRecaptchaHtml(null, null));
                                        %>
                                    </div>
                                    -->
                                    
                                    <div class="control-group">
                                        <label class="control-label"> Captcha  </label>
                                        <div class="controls">
                                            <s><i><h2 id="captcha" style="background: buttonshadow;"></h2></i></s>
                                            <input type="text"  id="insertcaptcha" placeholder="Captcha" name="captcha"/> 
                                            
                                        </div>
                                    </div>
                                    

                                    <br><p><sup>*</sup>Required field	</p>

                                    <div class="control-group">
                                        <div class="controls">
                                            <input type="hidden" name="email_create" value="1">
                                            <input type="hidden" name="is_new_customer" value="1">
                                            <input class="btn btn-large btn-success" type="submit" value="Register" onClick="return chkForm()" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-3"></div>
                        </div>

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
        <script>
            function sendMe()
            {
                return confirm("Continue?");
            }

            function chkForm()
            {
                if ((form1.password.value == "") || (form1.confirmpassword.value == "")) {
                    alert("Password empty");
                    return false;
                }
                if (form1.password.value != form1.confirmpassword.value)
                {
                    alert("Password does not match");
                    form1.password.value = "";
                    form1.confirmpassword.value = "";
                    form1.password.focus();
                    return false;
                }
                var pattern = {
                    charLength: function () {
                        if (password.length >= 8) {
                            return true;
                        }
                    },
                    lowercase: function () {
                        var regex = /^(?=.*[a-z]).+$/; // Lowercase character pattern

                        if (regex.test(password)) {
                            return true;
                        }
                    },
                    uppercase: function () {
                        var regex = /^(?=.*[A-Z]).+$/; // Uppercase character pattern

                        if (regex.test(password)) {
                            return true;
                        }
                    },
                    special: function () {
                        var regex = /^(?=.*[0-9_\W]).+$/; // Special character or number pattern

                        if (regex.test(password)) {
                            return true;
                        }
                    }
                };

                var password = form1.password.value;

                // Check that password is a minimum of 8 characters
                var length = pattern.charLength();

                // Check that password contains a lowercase letter		
                var lowercase = pattern.lowercase();

                // Check that password contains an uppercase letter
                var uppercase = pattern.uppercase();

                // Check that password contains a number or special character
                var special = pattern.special();

                if ((length != true) || (lowercase != true) || (uppercase != true) || (special != true)) {
                    alert("Password does not contains 1 uppercase,1 lowercase, minimum length 8,1 caracter special");
                    return false;
                }
                
                var captcha=document.getElementById("captcha").innerHTML;
                var insertcaptcha=document.getElementById("insertcaptcha").value;
                console.log(captcha);
                console.log(insertcaptcha);
                if(captcha!=insertcaptcha){
                    alert("Error Captcha");
                    return false;
                }

            }
            
            function getCaptcha() {
                var chars = "0Aa1Bb2Cc3Dd4Ee5Ff6Gg7Hh8Ii9Jj0Kk1Ll2Mm3Nn4Oo5Pp6Qq7Rr8Ss9Tt0Uu1Vv2Ww3Xx4Yy5Zz";
                var string_length = 5;
                var captchastring = '';
                for (var i=0; i<=string_length; i++) {
                    var rnum = Math.floor(Math.random() * chars.length);
                    captchastring += chars.substring(rnum,rnum+1);
                }
                document.getElementById("captcha").innerHTML = captchastring;
            }

        </script>
    </body>
</html>