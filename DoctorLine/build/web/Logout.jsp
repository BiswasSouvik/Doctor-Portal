<%-- 
    Document   : Logout
    Created on : Mar 15, 2017, 5:47:14 AM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LogoutPage</title>
    </head>
    <body background="doc6.jpg" height="2000px" width="1337px">
        <div align="center"><h1>Thank You</h1></div>
        <div align="center"><a href="index.html"><button type="button">Home</button></a></div>
    </body>
</html>
