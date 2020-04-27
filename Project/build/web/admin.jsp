<%-- 
    Document   : admin
    Created on : Nov 7, 2019, 5:27:42 PM
    Author     : tranb
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="dal.BookingDAO"%>
<%@page import="model.Booking"%>
<%@page import="model.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.RoomDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Import Boostrap css, js, font awesome here -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="./styles/styleSearch.css" rel="stylesheet">
        <%
            RoomDAO rd = new RoomDAO();
            BookingDAO bd = new BookingDAO();
            ArrayList<Room> roomlist = rd.getRoombusy();
            DecimalFormat ff = new DecimalFormat("###,###,###");
        %>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {background-color: #f2f2f2;}
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

                        <li class="nav-item dropdown">
                            <a class="nav-link">ADMIN</a>
                            <div class="dropdown-content">

                                <form action="main" method="post">
                                    <input type="hidden" value = "log_out" name="log_out">
                                    <button class="btn btn-link drodown-item" style="color: black;  position: relative; left: -12px; top: -24px;" type="submit">Log_out</button>
                                </form>
                            </div>
                        </li>  

                    </ul>
                </div>
            </div>
        </nav>
        <% if (roomlist.isEmpty()) {%>
        <h5>  All room are free ! </h5>
        <%} else {%>
        <table>
            <tr>
                <th>Name Hotel</th>
                <th>Name Place</th>
                <th>Room Type</th>
                <th>Price Per Night</th>
                <th>Max Person</th>
                <th>Name Customer</th>
                <th>Check Out</th>
            </tr>
            <% for (Room r : roomlist) {%>
            <% Booking b = bd.getBookBusy(r.getRoomID());%>
            <tr>
                <td><%= b.getH().getHotelName()%></td>
                <td><%= b.getH().getP().getAddressPlace()%></td>
                <td><%= r.getRoomType()%></td>
                <td><%=ff.format(r.getPriceFerNight()) %></td>
                <td><%= r.getMaxPerson()%></td>
                <td><%= b.getA().getFullName()%></td>
                <td>
                    <form action="admin" method="post">
                        <input type="hidden" value="<%= r.getRoomID()%>" name="roomID">
                        <button type="submit">Check Out</button>
                    </form>
                <td>
            </tr>
            <%}%>
        </table>
        <%}%>
    </body>
</html>
