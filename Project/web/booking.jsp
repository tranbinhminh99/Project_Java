<%-- 
    Document   : booking
    Created on : Oct 31, 2019, 9:00:21 PM
    Author     : tranb
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Room"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            .dropdown-content {
                display: none;
                position: absolute;
                z-index: 1;
            }
            .dropdown:hover .dropdown-content {
                display: block;

            }

        </style>
    </head>
    <% Account a = (Account) request.getSession().getAttribute("accountLogin");
        Room r = (Room) request.getAttribute("room");
        Boolean flaq = (Boolean) request.getAttribute("flaq");
        DecimalFormat ff = new DecimalFormat("###,###,###");
        if (flaq == null) {
            flaq = true;
        }
    %>

    <body>
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
                                    <button class="btn btn-link drodown-item" style="color: black;  position: relative; left: -12px; top: -24px;" type="submit">Log_out</button>
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

        <% if (!flaq) { %>
        <br><a style="color: red">You must login before order</a>
        <%} else {%>
        <%if (r != null) {%>

        <div class="ml-8">
            <a style="position: relative;
               left: 706px;
               top: -211px;" ><%= r.getH().getHotelName()%></a>
            <img style="height: 500px;width: 1000px;position: relative;
                 left: 193px;
                 top: 68px;"  src="<%= r.getH().getUrlImage()%>" alt=""/>
        </div>
        <form action="bookdetail" method="post" >
            <div style="margin-top: 100px;margin-left: 100px">
                <label>Room Type: <a><%= r.getRoomType()%></a></label> <br>
                <label>Price Per Night: <a><%=ff.format(r.getPriceFerNight())%></a></label> <br>
                <label>Max Person: <a><%= r.getMaxPerson()%></a></label> <br>
                <label>Place: <a><%= r.getH().getP().getAddressPlace()%></a></label> <br>
                <label>Book Time:</label><br>
                <label>From <input type="date" name="dateFrom" required=""> </label>
                <label>To <input type="date" name="dateTo" required=""> </label>
                <input type="hidden" value="<%= r.getRoomID()%>" name="roomid">
                <br><label>Comment:</label>
                <br><textarea name="textarea" rows="5" cols="30"></textarea>
                <br><button type="submit"> OK </button>

            </div>
        </form>
        <%}%>
        <%}%>
    </body>
</html>
