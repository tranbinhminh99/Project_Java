<%-- 
    Document   : Detail_Order
    Created on : Nov 10, 2019, 12:03:40 PM
    Author     : tranb
--%>

<%@page import="dal.BookingDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Booking"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Import Boostrap css, js, font awesome here -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
        </script>
        <style>
            body  {
                background-image: url("images/backgroupOr.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="./styles/styleSearch.css" rel="stylesheet">
        <%
            Account a = (Account) request.getSession().getAttribute("accountLogin");
            Booking b = (Booking) request.getAttribute("bookbyid");
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
                                <a class="nav-link"><%= a.getFullName()%> </a>
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
        <%if (b != null) {%>
        <% DecimalFormat ff = new DecimalFormat("###,###,###");
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            BookingDAO bd = new BookingDAO();
            Integer day = bd.dayNumber(b.getBookingID());
        %>

        <table border = 1px style="    margin-top: 34px;
               margin-left: 203px;">
            <tr>
                <th>Check in</th>
                <td><%= formatter.format(b.getCheckIn())%></td>
            </tr>
            <tr>
                <th>Check out</th>
                <td><%= formatter.format(b.getCheckOut())%></td>
            </tr>
            <tr>
                <th>Room Type</th>
                <td><%= b.getR().getRoomType()%></td>
            </tr>
            <tr>
                <th>Max Person</th>
                <td><%= b.getR().getMaxPerson()%></td>
            </tr>
            <tr>
                <th>Price Per Night</th>
                <td><%=ff.format(b.getR().getPriceFerNight())%></td>
            </tr>
            <tr>
                <th>Hotel Name</th>
                <td><%= b.getR().getH().getHotelName()%></td>
            </tr>
            <tr>
                <th>Book Time</th>
                <td><%= formatter.format(b.getBookTime())%></td>
            </tr>
            <tr>
                <th>Place</th>
                <td><%= b.getR().getH().getP().getAddressPlace()%></td>
            </tr>
            <tr>
                <th>Book Day</th>
                <td> <%= day%> Day</td>
            </tr>
            <tr>
                <th>Total</th>
                <td><%=ff.format(b.getR().getPriceFerNight() * day)%></td>
            </tr>
        </table>
        <%}%>
    </body>
</html>
