<%-- 
    Document   : admin_hotel
    Created on : Nov 11, 2019, 2:37:03 PM
    Author     : tranb
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Booking"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.BookingDAO"%>
<%@page import="model.Admin_Hotel"%>
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
            body  {
                background-image: url("images/backgroupOr.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

        </style>
        <%
            Admin_Hotel ah = (Admin_Hotel) request.getAttribute("ad_hotel");
            BookingDAO bd = new BookingDAO();
            ArrayList<Booking> BookL = bd.getBookingDT(ah.getH().getHotelID());
            DecimalFormat ff = new DecimalFormat("###,###,###");
        %>
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
                        <% if (ah != null) {%>
                        <li class="nav-item dropdown">
                            <a class="nav-link"><%= ah.getNameAdmin()%> </a>
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
        <h1><%=ah.getH().getHotelName()%></h1>
        <%if (!BookL.isEmpty()) { %>
        <table border = 1px>
            <tr>
                <th>BookID</th>
                <th>Book Time</th>
                <th>Room Number</th>
                <th>Book Day</th>
                <th>Customer Name</th>
                <th>Total Deal</th>
                <th>Detail Order</th>
            </tr>
            <%float dt = 0; %>
            <%for (Booking b : BookL) { %>
            <%int day = bd.dayNumber(b.getBookingID());%>
            <tr>
                <td><%=b.getBookingID()%></td>
                <td><%=b.getBookTime()%></td>
                <td><%=b.getR().getRoomID()%></td>
                <td><%=day %></td>
                <td><%=b.getA().getFullName()%></td>
                <td><%=ff.format(day * b.getR().getPriceFerNight())%></td>
                <%dt = dt + day * b.getR().getPriceFerNight();%>
                <td><a href="orderdetail?bid=<%=b.getBookingID()%>">Detail</a></td>
            </tr>
            <%}%>
        </table>
        <h6 style="    position: relative;
            margin-top: 10px;
            margin-left: 496px;" >Total Revalue: <%=ff.format(dt)%></h6> 
        <%} else {%>
        <h4>Your hotel have not any deal</h4>
        <%}%>
    </body>
</html>
