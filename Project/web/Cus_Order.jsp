<%-- 
    Document   : Cus_Order
    Created on : Nov 10, 2019, 11:07:17 AM
    Author     : tranb
--%>

<%@page import="model.Booking"%>
<%@page import="java.util.ArrayList"%>
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="./styles/styleSearch.css" rel="stylesheet">
        <%
            Account a = (Account) request.getSession().getAttribute("accountLogin");
            ArrayList<Booking> bookL = (ArrayList<Booking>) request.getAttribute("bookL");
        %>
        <style>
            body  {
                background-image: url("images/backgroupOr.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>

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
        <div>
            <%if (!bookL.isEmpty()) { %>      
            <table border = 1px style="    margin-top: 26px;
                   margin-left: 219px;">
                <tr>
                    <th>Booking ID</th>
                    <th>Check In</th>
                    <th>Check Out</th>
                    <th>Hotel Name</th>
                    <th>Place</th>
                    <th>Book Time</th>
                    <th>Room Number</th>
                    <th>Detail</th>
                </tr>
                <%for (Booking b : bookL) { %>
                <tr>
                    <td><%=b.getBookingID() %></td>
                    <td><%=b.getCheckIn() %></td>
                    <td><%=b.getCheckOut() %></td>
                    <td><%=b.getH().getHotelName() %></td>
                    <td><%=b.getH().getP().getAddressPlace() %></td>
                    <td><%=b.getBookTime() %></td>
                    <td><%=b.getR().getRoomID() %></td>
                    <td><a href="orderdetail?bid=<%=b.getBookingID()%>">Detail</a></td>
                </tr>
                <%}%>
            </table>
            <%} else { %>
            <h4 style="color: red" >You are not yet book any Hotel or you were cancel the deal before !  </h4>
            <%}%>
        </div>
    </body>
</html>
