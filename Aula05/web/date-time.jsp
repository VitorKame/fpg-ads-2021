<%-- 
    Document   : date-time
    Created on : 30 de ago de 2021, 20:46:58
    Author     : santo
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JavaEE - JSP</title>
    </head>
    <body>
        <h1>JavaEE</h1>
        <h2>Java Server Pages</h2>
        <h3>Data/hora do servidor</h3>
        <h4><a href="index.html">Voltar</a></h4>
        <hr/>
        <%Date now = new Date();%>
        <div><%= now%></div>
    </body>
</html>
