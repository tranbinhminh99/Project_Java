<%@page import="model.Account"%>
<%@page import="model.Hotel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.HotelDAO"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->


<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Booking.com</title>
        <!-- Import Boostrap css, js, font awesome here -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <style>
            .search-txt{

                width: 200%;
                margin-top: 7%;
                border-radius: 40px; 
                margin-left: -90%;
                padding-left: 8px;
            } 
        </style>
        <link href="./styles/style.css" rel="stylesheet">
        <%
            Account a = (Account) request.getSession().getAttribute("accountLogin");
            HotelDAO hd = new HotelDAO();
            ArrayList<Hotel> hotelsPQ = hd.getHotelsByPlace("Phu Quoc","");
            ArrayList<Hotel> hotelsHCM = hd.getHotelsByPlace("Ho Chi Minh City","");
            ArrayList<Hotel> hotelsSP = hd.getHotelsByPlace("Sa Pa","");
            ArrayList<Hotel> hotelsHLB = hd.getHotelsByPlace("Ha Long Bay","");


        %>
        <style>
            /*            .dropdown-content {
                            display: none;
                            position: absolute;
                            z-index: 1;
                        }
                        .dropdown:hover .dropdown-content {
                            display: block;
                        }*/

        </style>
    </head>

    <body>
        <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
            <div class="container-fluid">
                <a class="navbar-branch" href="/booking">
                    <img src="./images/logo.png" height="80">
                </a>
                <form action="hotels" method="GET">
                    <div class="form-group ">
                        <input name="search" class="search-txt" type="text" placeholder="Where are you want to go?">
                        <input type="hidden" name="valueAVG" value="-1">
                        <button class="button" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
                <div >
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="main">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Hotels</a>
                        </li>
                        <% if (a != null) {%>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="cusOrder"><%= a.getFullName()%> </a>
                            <div class="dropdown-content">

                                <form action="main" method="post">
                                    <input type="hidden" value = "log_out" name="log_out">
                                    <button style="color: black;  position: relative; left: -12px; top: -24px;" class="btn btn-link drodown-item" type="submit">Log_out</button>
                                </form>
                            </div>
                        </li>  
                        <%} else {%>
                        <li class="nav-item">
                            <a class="nav-link" href="sign_in.jsp">Sign In</a>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </div>
        </nav>

        <div id="slides" class="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators">
                <li data-target="#slides" data-slide-to="0" class="active"></li>
                <li data-target="#slides" data-slide-to="1"></li>
                <li data-target="#slides" data-slide-to="2"></li>
                <li data-target="#slides" data-slide-to="3"></li>
                <li data-target="#slides" data-slide-to="4"></li>
                <li data-target="#slides" data-slide-to="5"></li>
                <li data-target="#slides" data-slide-to="6"></li>
            </ul>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="./images/ciudad-maderas-MXbM1NrRqtI-unsplash.jpg">
                </div>
                <div class="carousel-item">
                    <img src="./images/manuel-moreno-DGa0LQ0yDPc-unsplash.jpg">
                </div>
                <div class="carousel-item">
                    <img src="./images/jason-briscoe-cwr02zo0gP8-unsplash.jpg">
                </div>
                <div class="carousel-item">
                    <img src="./images/sylwia-pietruszka-IndbOxCrVio-unsplash.jpg">
                </div>
                <div class="carousel-item">
                    <img src="./images/valeriia-bugaiova-_pPHgeHz1uk-unsplash.jpg">
                </div>
                <div class="carousel-item">
                    <img src="./images/nik-lanus-YMOHw3F1Hdk-unsplash.jpg">
                </div>
                <div class="carousel-item">
                    <img src="./images/rhema-kallianpur-uocSnWMhnAs-unsplash.jpg">
                </div>
            </div>
        </div>
        <div class="container-fluid padding">
            <div class="row welcome text-center">
                <div class="col-12">
                    <h1 class="display-4">Where do you want to travel ?</h1>
                </div>
                <!-- Horizontal Rule -->
                <hr>
            </div>
        </div>


        <div class="container-fluid padding bbb">
            <div class="row padding">

                <div class="col-sm-6">
                    <div class="bo">
                        <img src="./images/HCM.jpg" alt="" class="img-fluid">
                        <div class="layer2">
                            <div class="tieude">Ho Chi Minh City</div>
                            <div class="tacgia"><%= hotelsHCM.size()%> properties</div>
                            <a href="/booking/hotels?search=Ho+Chi+Minh+City&valueAVG=-1" class="nut">Detail</a>
                        </div>
                    </div>
                </div> 

                <div class="col-sm-6">
                    <div class="bo">
                        <img src="./images/sapa.jpg" alt="" class="img-fluid">
                        <div class="layer2">
                            <div class="tieude">Sapa</div>
                            <div class="tacgia"><%= hotelsSP.size()%> properties</div>
                            <a href="/booking/hotels?search=Sa Pa&valueAVG=-1" class="nut">Detail</a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="bo">
                        <img src="./images/halong.jpg" alt="" class="img-fluid">
                        <div class="layer2">
                            <div class="tieude">Ha Long Bay</div>
                            <div class="tacgia"><%= hotelsHLB.size()%> properties</div>
                            <a href="/booking/hotels?search=Ha+Long+Bay&valueAVG=-1" class="nut">Detail</a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="bo">
                        <img src="./images/phuquoc.jpg" alt="" class="img-fluid">
                        <div class="layer2">
                            <div class="tieude">Phu Quoc</div>
                            <div class="tacgia"><%= hotelsPQ.size()%> properties</div>

                            <a href="/booking/hotels?search=Phu+Quoc&valueAVG=-1" class="nut">Detail</a>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>  
    </body>

</html>