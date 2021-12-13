<%-- 
    Document   : history
    Created on : 13 de dez de 2021, 20:27:16
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
