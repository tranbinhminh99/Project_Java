<%-- 
    Document   : test
    Created on : Nov 2, 2019, 5:40:48 PM
    Author     : tranb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            Integer aid = (Integer) request.getAttribute("aid");
            
        %>
    </head>
    <body>
        <form action="test" method="post">
            to <input type="date" name="dateto">
            from <input type="date" name="datefrom">
            aid<input type="number" name="aid">
            <button type="submit">Send</button>
        </form>
        <%if (aid != null) {%>
        <a> <%= aid%> </a>
        <%}%>
    </body>
</html>
