<%-- 
    Document   : Register
    Created on : 31-Jan-2019, 12:30:31
    Author     : d00194761
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register!</h1>
        <form action="Servlet" method="post">
                <table>
                    <tr>
                        <td> Username : </td><td> <input name="username" required size=20 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Password  : </td><td> <input name="password" required size=50 type="password" /> </td> 
                    </tr>
                    <tr>
                        <td> Email : </td><td> <input name="email" required size=50 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td>Address1  : </td><td> <input name="addressLine1" required size=50 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td>Address2 : </td><td> <input name="addressLine2" required size=50 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Town : </td><td> <input name="town" required size=50 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> City  : </td><td> <input name="city" required size=50 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Country  : </td><td> <input name="country" required size=50 type="text" /> </td> 
                    </tr>
                    
                   
                </table>
                <input type="submit" value="Register" />
                <input type="hidden" name ="action" value="register" />
            </form>
    </body>
</html>
