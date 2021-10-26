<%-- 
    Document   : index
    Created on : 25 de out de 2021, 20:24:17
    Author     : santo
--%>

<%@page import="model.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Data padrão = new Data();
    
    Data hoje = new Data();
    hoje.setDia(25);
    hoje.setMes(10);
    hoje.setAno(2021);
    
    Data ricardoNiver = new Data(1, 7, 1979);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data - Java OO</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>CLASSE DATA</h2>
        <h3>Data padrão da classe</h3>
        <div><%= padrão.getDia() %>/<%= padrão.getMes() %>/<%= padrão.getAno() %></div>
        <h3>Data de hoje:</h3>
        <div><%= hoje.getData() %></div>
        <h3>Aniversário do Prof. Ricardo:</h3>
        <div><%= ricardoNiver.getData() %></div>
    </body>
</html>
