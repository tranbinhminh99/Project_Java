<%-- 
    Document   : sign_in
    Created on : Oct 14, 2019, 8:03:12 PM
    Author     : tranb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign In</title>
        <!-- Import Boostrap css, js, font awesome here -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="./styles/style1.css" rel="stylesheet">
    </head>
    <% Boolean flaq = (Boolean) request.getAttribute("flaq");
        if (flaq == null) {
            flaq = true;
        }
    %>

    <body>
        <div class="container-fluid bg">
            <div class="row justify-content-center">
                <div class="col-md-3 col-sm-6 col-xs-12 row-container">
                    <form action="login" method="post">
                        <h1>Login</h1>
                        <div class="form-group">
                            <label for="user">User Name</label>
                            <input type="text" name ="username" class="form-control" id="user" placeholder="User Name">
                        </div>
                        <div class="form-group">
                            <label for="password" class="label">Password</label>
                            <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                        </div>
                        <div class="form-check">
                            <input type="checkbox" name="remember" class="form-check-input" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">Check me out</label>
                        </div>
                        <button type="submit" class="btn btn-success btn-block my-3">Login</button>
                        <% if (!flaq) {%>
                        <div>
                            <h6 style="color: red" >Login fail ! </h6>
                        </div>
                        <%}%>                      

                        <h6 ><a href="register"> Click here to register !</h6>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>