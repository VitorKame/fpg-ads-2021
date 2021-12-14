<%-- 
    Document   : index
    Created on : 13 de dez de 2021, 20:33:35
    Author     : santo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INTEX</title>
    </head>
    <body>
        <%@include  file="WEB-INF/jspf/header.jspf" %>
        
        <% if (session.getAttribute("userName") == null) { %>
        <h3 style="color: red;"> Acesso é restrito</h3>
        <% } else { %>        
            Bem-Vindo <%= session.getAttribute("userName") %>
        <% }%>
    </body>
</html>
