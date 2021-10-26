<%-- 
    Document   : horario
    Created on : 25 de out de 2021, 23:11:11
    Author     : santo
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalTime"%>
<%@page import="model.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Calendar rightNow = Calendar.getInstance();
    int hora = rightNow.get(Calendar.HOUR);
    int minuto = rightNow.get(Calendar.MINUTE);
    int segundo = rightNow.get(Calendar.SECOND);
    
    Horario horarioAtual = new Horario(hora,minuto,segundo);
    Horario horarioIntervalo = new Horario(20,40,0);
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Horário - Java OO</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>HORÁRIO</h2>
        <h3>Horário Atual:</h3>
        <div><%= horarioAtual.getHorario() %></div>
        <h3>Horário do Intervalo:</h3>
        <div><%= horarioIntervalo.getHorario() %></div>
    </body>
</html>
