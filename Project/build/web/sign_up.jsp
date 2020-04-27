<%-- 
    Document   : sign_up
    Created on : Oct 14, 2019, 8:05:57 PM
    Author     : tranb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign Up</title>
        <!-- Import Boostrap css, js, font awesome here -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="./styles/style2.css" rel="stylesheet">
    </head>
    <% Boolean flaq = (Boolean) request.getAttribute("flaq");
        if (flaq == null) {
            flaq = true;
        }
    %>
    <body>
        <div class="container-fluid bg">
            <div class="row justify-content-center">
                <div class="col-xs-12 row-container">
                    <form action="register" method="post">
                        <h1>Are you ready to travel !</h1>
                        <div class="form-group">
                            <label for="nameCus" class="label">Full Name*</label>
                            <input type="text" name="fullname" class="form-control" id="nameCus" placeholder="Full Name" required>
                        </div>
                        <div class="form-group">
                            <label for="address" class="label">Address*</label>
                            <input type="text" name="address" class="form-control" id="address" placeholder="Address" required>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="label">Phone Numbers*</label>
                            <input type="text" name="phone" class="form-control" id="phone" placeholder="Phone Numbers" required>
                        </div>
                        <div class="form-group">
                            <label for="birthday" class="label">BirthDay*</label>
                            <input type="date" name="birthday" class="form-control" id="birthday" placeholder="BirthDay" required>
                        </div>
                        <div class="form-group">
                            <label for="user">User Name*</label>
                            <input type="text" name="user" class="form-control" id="user" placeholder="User Name"  required  minlength="8">
                        </div>
                        <div class="form-group">
                            <label for="password" class="label">Password*</label>
                            <input type="password" name="password" class="form-control" id="password" placeholder="Password" required minlength="8">
                        </div>
                        <button type="submit" class="btn btn-success btn-block my-3">Finish</button>
                        <%if (!flaq) {%>
                        <div class="thongbao">
                            <h6 style="color: red">User name is exist!</h6>
                        </div>
                        <%}%>   
                        <h6 ><a href="login"> Click here if you had account !</h6>
                    </form>
                </div>
            </div>
        </div>

    </body>

</html>