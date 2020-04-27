<%-- 
    Document   : finish
    Created on : Nov 11, 2019, 2:04:44 AM
    Author     : tranb
--%>

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
            Boolean flaq = (Boolean) request.getAttribute("flaq");
        %>
        <style>
            .dropdown-content {
                display: none;
                position: absolute;
                z-index: 1;
            }
            .dropdown:hover .dropdown-content {
                display: block;

            }
            <%if (flaq) { %>
            body  {
                background-image: url("images/thanku.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
            <%} else {%>
            body  {
                background-image: url("images/cancel.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
            <%}%>


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
                        <% if (a != null) {%>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="cusOrder" ><%= a.getFullName()%> </a>
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
        <%if (flaq) { %>
        <h4 style="text-align: center;
            position: relative;
            left: 0px;
            top: 253px;text-shadow: 2px 2px 4px #ffffff">Success!</h4>

        <a href="./main" class="btn btn-info" style="    position: relative;
           left: 670px;
           top: 251px;" role="button">Go back home</a>
        <%} else {%>
        <h4 style="text-align: center;position: relative;
            left: -5px;
                top: 246px;text-shadow: 2px 2px 4px #ffffff;
            }">Cancel!</h4>
        <a href="./main" class="btn btn-info" style="    position: relative;
           left: 670px;
           top: 251px;" role="button">Go back home</a>
        <%}%>
    </body>
</html>
