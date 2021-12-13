<%-- 
    Document   : index
    Created on : 13 de dez de 2021, 19:30:26
    Author     : santo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        
        <%if (session.getAttribute("userName")!=null) {%>
            <h3>Bem-vindo <%= session.getAttribute("userName")%></h3>
        <%} else {%>
            <h2 style="color: red;">acesso é restrito</h2>
        <%}%>
    </body>
</html>
