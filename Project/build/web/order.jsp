<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Account"%>
<%@page import="model.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Hotel"%>
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
            .tableroom{
                position: relative;
                left: -4px;
                top: 39px;
            }
        </style>

        <%
            Hotel h = (Hotel) request.getAttribute("hotelOrder");
            ArrayList<Room> listRoom = (ArrayList<Room>) request.getAttribute("listRoom");
            Account a = (Account) request.getSession().getAttribute("accountLogin");
            DecimalFormat ff = new DecimalFormat("###,###,###");
        %>

    </head>

    <body>
        <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
            <div class="container-fluid">
                <a class="navbar-branch" href="main">
                    <img src="./images/logo.png" height="80">
                </a>
                <div class="slogan"><a>Start the journey width no reason</a><i class="fas fa-plane"></i></div>
                <div>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="index.jsp">Home</a>
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
        <div>
            <a> <%= h.getHotelName()%> </a>
            <img src="<%= h.getUrlImage()%>" style="width: 700px; height: 300px">
            <br>
            <table class="tableroom">
                <tr>
                    <th>Room Type</th>
                    <th>Price Per Night</th>
                    <th>Max Person</th>
                    <th>Book</th>
                </tr>
                <% for (Room r : listRoom) { %>
                <% if (r.isIsFree()) {%>
                <tr>
                    <td><%= r.getRoomType()%></td>
                    <td><%=ff.format(r.getPriceFerNight())%></td>
                    <td><%= r.getMaxPerson()%></td>
                    <td>
                        <form action="bookroom" method="post">
                            <input type="hidden" value="<%= r.getRoomID()%>" name="roomID">
                            <button type="submit">choose</button>
                        </form>
                    <td>
                </tr>
                <%}%>
                <%}%>
            </table>

        </div>


    </body>      
</html>