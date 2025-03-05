<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <title>Online Book Publishing System</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive-->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- fevicon -->
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <!-- Tweaks for older IEs-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    <style>
            table{
                border: 2px;
            }
            table tr td{
                padding:5px;
            }
        </style>
</head>
<!-- body -->

<body class="main-layout ">
    <!-- loader  -->
    <div class="loader_bg">
        <div class="loader"><img src="images/loading.gif" alt="#" /></div>
    </div>
    <!-- end loader -->
    <!-- header -->
    <header>
        <!-- header inner -->
        <div class="header">

            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col logo_section">
                        <div class="full">
                            <div class="center-desk">
                                <div class="logo">
                                    <a href="index.html"><font size="4" color="white">Online Book Publishing System</font></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                        <div class="location_icon_bottum_tt">
                            
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 location_icon_bottum">
                       <div class="row">
                            <div class="col-md-8 ">
                                <div class="menu-area">
                                    <div class="limit-box">
                                        <nav class="main-menu">
                                            <ul class="menu-area-main">
                                                <li class="active"> <a href="UserHome.jsp">Home</a> </li>
                                                <li> <a href="UploadBooks.jsp">Upload Books</a> </li>
                                                <li><a href="AuthorViewBooks.jsp">View Books</a></li>
                                                <li><a href="PurchasedBooks.jsp">Purchased Books</a></li>
                                                <li><a href="index.html">Logout</a></li>
                                                

                                            </ul>
                                        </nav>
                                    </div>
                                </div>

                            </div>
                            
                       </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end header inner -->
    </header>
    <!-- end header -->
    <section class="slider_section">
        <div id="myCarousel" class="carousel slide banner-main" data-ride="carousel">
            <ul class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="2" class=""></li>
            </ul>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="first-slide" src="images/banner.jpg" alt="First slide">
                    <div class="container">
                        <div class="carousel-caption relative">
                            <%String username=(String)session.getAttribute("username");%>
                            <center><h1>Upload Book  </h1></center>
                       
                                        <form action="UploadAction" method="post" enctype="multipart/form-data">
                                          <table>
                                                <tr>
                                                    <th>Author Name</th><td><input type='text' name="author" value="<%=username%>" style='width:250px;'  readonly=""></td></tr>
                                                
                                                
                                            <tr>
                                                    <th>Book Name:</th><td><input type='text' name="bookname" style='width:250px;' required=""></td></tr>
                                               <tr>
                                                   <th>File Name:</th><td><input type='text' name="paper" style='width:250px;' required="" placeholder="Must Mention Extension(.pdf)"></td></tr>
                                                 <tr><th>Publishing Time:</th><td><input type='text' name="year" style='width:250px;' required="" value="<%=new java.util.Date()%>">
                                                 <tr><th>Access Type:</th><td><select name="accesstype">
                                                             <option value="Free">Free</option>
                                                             <option value="Paid">Paid</option>
                                                         </select>
                                                 <tr><th>Cost:</th><td><input type='text' name="cost" style='width:250px;' required="" >
                                                  
                                                        
                                    </td></tr>
                                            <tr><th>Choose Book</th><td><input type='file' name="file" style='width:250px;' required=""></td></tr>
                                         
                                            <tr><th></th><td><input type='submit' value="Upload">
                                                <input type='reset' value="Reset"></td></tr>
                                                 
                                            </table>
                                                      </form>   
                                                        
                                       <div class="mu-hero-right">
                                            
                        
                            
                        </div>
                    </div>
                </div>
                
        <div class="copyright">
            <div class="container">
                <p>© 2021 All Rights Reserved. Design By<a href="#"> It's Me</a></p>
           
        </div>
        </div>
    </footr>

    <!-- end footer -->
    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/plugin.js"></script>
    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
    <!-- javascript -->
    <script src="js/owl.carousel.js"></script>
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".fancybox").fancybox({
                openEffect: "none",
                closeEffect: "none"
            });

            $(".zoom").hover(function() {

                $(this).addClass('transition');
            }, function() {

                $(this).removeClass('transition');
            });
        });
    </script>
    <script>
        // This example adds a marker to indicate the position of Bondi Beach in Sydney,
        // Australia.
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: {
                    lat: 40.645037,
                    lng: -73.880224
                },
            });

            var image = 'images/maps-and-flags.png';
            var beachMarker = new google.maps.Marker({
                position: {
                    lat: 40.645037,
                    lng: -73.880224
                },
                map: map,
                icon: image
            });
        }
    </script>
    <!-- google map js -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8eaHt9Dh5H57Zh0xVTqxVdBFCvFMqFjQ&callback=initMap"></script>
    <!-- end google map js -->
</body>

</html>