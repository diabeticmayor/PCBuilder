<%-- 
    Document   : Login
    Created on : 31-Jan-2019, 12:21:14
    Author     : d00194761
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="LoginAndRegister">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
    </head>
    <body>
        <h1>Login!</h1>
        
        <form action="Servlet" method="post">
                <table>
                    <tr>
                        <td> Username : </td><td> <input name="username" required size=20 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Password : </td><td> <input name="password" required size=50 type="password" /> </td> 
                    </tr>
                </table>
                <input type="submit" value="Login" />
                <input type="hidden" name ="action" value="login" />
            </form>
    </body>
</html>
