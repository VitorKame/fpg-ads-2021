<%-- 
    Document   : juros
    Created on : 13 de dez de 2021, 19:49:25
    Author     : santo
--%>

<%@page import="Db.VitorJurosDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("simples") != null) {
        double porc = Double.parseDouble(request.getParameter("porc"))/100;
        double valor = Double.parseDouble(request.getParameter("valor"))/100;
        int tempo = Integer.parseInt(request.getParameter("valor"))/100;
        
        double resultado = valor * (1+porc*tempo);
        
        String log = request.getParameter("log");
        String userName = (String) session.getAttribute("userName");
        
        VitorJurosDao.addJuros(userName, resultado, log);
        
        response.sendRedirect(request.getRequestURI());
    }else if (request.getParameter("composto")!= null){
        double porc = Double.parseDouble(request.getParameter("porc"))/100;
        double valor = Double.parseDouble(request.getParameter("valor"))/100;
        int tempo = Integer.parseInt(request.getParameter("valor"))/100;
        
        double resultado = valor * Math.pow(1+porc, tempo);
        
        String log = request.getParameter("log");
        String userName = (String) session.getAttribute("userName");
        
        VitorJurosDao.addJuros(userName, resultado, log);
        
        response.sendRedirect(request.getRequestURI());
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if (session.getAttribute("userName") == null) {%>
            <h2 style="color: red;">acesso é restrito</h2>
        <%} else {%>
        <form>
            <input type="number" name="porc" required/>
            <input type="number" name="valor" required/>
            <input type="number" name="tempo" required/>
            <input type="text" name="log" required/>
            <input type="submit" name="simples" value="simples">
        </form>

        <form>
            <input type="number" name="porc" required/>
            <input type="number" name="valor" required/>
            <input type="number" name="tempo" required/>
            <input type="text" name="log" required/>
            <input type="submit" name="composto" value="composto">
        </form>
        <%}%>
    </body>
</html>
