<%-- 
    Document   : index
    Created on : 18 de out. de 2021, 20:52:47
    Author     : santo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int sessoes = 0;
        ArrayList<String> sessionList = null;
        if(application.getAttribute("sessionList")!=null){
        sessionList = (ArrayList) application.getAttribute("sessionList");
        sessoes = sessionList.size();
            }
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Inicial</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Página Inicial</h2>
        <h3>Sessões Ativas: <%= sessoes %></h3>
        <% if(session.getAttribute("username")!=null && sessionList!= null){%>
        <ul>
            <%for(String name: sessionList){%>
            <li><%= name %></li>
            <%}%>
        </ul>
        <%}%>
    </body>
</html>