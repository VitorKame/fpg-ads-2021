<%-- 
    Document   : juros
    Created on : 13 de dez de 2021, 20:34:14
    Author     : santo
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy - HH:mm:ss");
    Date atual = new Date();
    String data = formato.format(atual);
    if (request.getParameter("simples") != null) {
        double porc = Double.parseDouble(request.getParameter("porc"))/100;
        double valor = Double.parseDouble(request.getParameter("valor"));
        int tempo = Integer.parseInt(request.getParameter("tempo"));
        
        double resultado = valor * (1+porc*tempo);

        String userName = request.getParameter("userName");
        session.setAttribute("userName", userName);
        
        VitorJurosDao.addJuros(data, userName, resultado);
        
        response.sendRedirect(request.getRequestURI());
    } else if (request.getParameter("composto") != null) {
       double porc = Double.parseDouble(request.getParameter("porc"))/100;
        double valor = Double.parseDouble(request.getParameter("valor"));
        int tempo = Integer.parseInt(request.getParameter("tempo"));
        
        double resultado = valor * Math.pow(1+porc, tempo);

        String userName = request.getParameter("userName");
        session.setAttribute("userName", userName);
        
        VitorJurosDao.addJuros(data, userName, resultado);
        
        response.sendRedirect(request.getRequestURI());
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros</title>
    </head>
    <body>
        <%@include  file="WEB-INF/jspf/header.jspf" %>

        <% if (session.getAttribute("userName") == null) { %>
        <h3 style="color: red;"> Acesso é restrito</h3>
        <% } else { %>        
        <form>
            <input type="number" name="porc" required/>
            <input type="number" name="valor" required/>
            <input type="number" name="tempo" required/>
            <input type="submit" name="simples" value="simples">
        </form>

        <form>
            <input type="number" name="porc" required/>
            <input type="number" name="valor" required/>
            <input type="number" name="tempo" required/>
            <input type="submit" name="composto" value="composto">
        </form>
        <% }%>
    </body>
</html>
