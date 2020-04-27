<%-- 
    Document   : search
    Created on : Oct 29, 2019, 8:04:11 AM
    Author     : tranb
--%>

<%@page import="model.Account"%>
<%@page import="dal.PlaceDAO"%>
<%@page import="model.Place"%>
<%@page import="model.Hotel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <link href="./styles/styleSearch.css" rel="stylesheet">
        <style>
            .price {
                position: relative;
                left: 0px;
                top: 8px;
            }
            .fail{
                position: relative;
                left: -20px;
                top: 48px;
                color: red;
            }
            .btnorder{
                position: relative;
                left: 0px;
                top: 15px;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                z-index: 1;
            }
            .dropdown:hover .dropdown-content {
                display: block;

            }

        </style>

        <%
            ArrayList<Hotel> hotels = (ArrayList<Hotel>) request.getAttribute("hotels");
            String value = (String) request.getAttribute("value");
            if (value.equals("")) {
                value = "All properties";
            }
            PlaceDAO pd = new PlaceDAO();
            ArrayList<Place> places = pd.getPlaces();
            Account a = (Account) request.getSession().getAttribute("accountLogin");
            String avg = (String) request.getAttribute("AVG");

        %>

    </head>

    <body>
        <div>
            <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
                <div class="container-fluid">
                    <a class="navbar-branch" href="/booking">
                        <img src="./images/logo.png" height="80">
                    </a>
                    <div class="slogan"><a>Start the journey width no reason</a><i class="fas fa-plane"></i></div>
                    <div>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="main">Home</a>
                            </li>
                            <% if (a != null) {%>
                            <li class="nav-item dropdown">
                                <a class="nav-link" href="cusOrder"><%= a.getFullName()%> </a>
                                <div class="dropdown-content">

                                    <form action="main" method="post">
                                        <input type="hidden" value = "log_out" name="log_out">
                                        <button class="btn btn-link drodown-item" style="color: black;  position: relative; left: -12px; top: -24px;">Log_out</button>
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
        </div>
        <form action="hotels" method="get">
            <div class="ml-4">
                <div class="row">
                    <div class="col-sm-12">
                        <label>Search</label><br>
                        <input name="search" class="addressName" <% if (!value.isEmpty()) {%>
                               value="<%= value%>"
                               <%}%> type="search" placeholder="Destination/property name"> <br>
                        <label>Price</label><br>
                        <select name="valueAVG">
                            <option value="-1">-------ALL-------</option>>
                            <option value="0-500000" <%if (avg.equals("0-500000")) {%> selected="" <%}%> ><500000</option>
                            <option value="500000-1000000" <%if (avg.equals("500000-1000000")) {%> selected="" <%}%> >500000-1000000</option>
                            <option value="1000000-1300000" <%if (avg.equals("1000000-1300000")) {%> selected="" <%}%> >1000000-1300000</option>
                            <option value="1300000-<%= Float.MAX_VALUE%>" <%if (avg.equals("1300000-" + Float.MAX_VALUE)) {%> selected="" <%}%>>>1300000</option>
                        </select> <br><br>
                        <button type="submit" > Search </button> 
                    </div>
                </div>
            </div>
        </form>
        <div class="col-ml-4">
            <div class="row">
                <% if (!hotels.isEmpty()) { %>
                <% for (Place p : places) {%>
                <%for (int i = 0; i < hotels.size(); i++) {%>
                <%if (p.getPlaceID() == hotels.get(i).getP().getPlaceID()) {%>

                <div class="col-sm-4 mt-4">
                    <a> <%= hotels.get(i).getHotelName()%>(<%= p.getAddressPlace()%>)  </a>
                    <div>
                        <img style="width: 450px;height: 450px" src="<%= hotels.get(i).getUrlImage()%>">
                    </div>
                    <form action="order" method="post">
                        <input type="hidden" value="<%= hotels.get(i).getHotelID()%>" name="hotelID" >
                        <button type="submit"  class="btnorder" > Order </button>
                    </form>
                </div>
                <%}%>
                <%}%>
                <%}%>
                <%} else {%>
                <div class="col-ms-4 ml-4">
                    <h4 class="fail"> Sorry, we don't recognise !</h4>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
