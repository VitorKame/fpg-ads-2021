<%-- 
    Document   : index
    Created on : 4 de out de 2021, 00:39:51
    Author     : santo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet">
        <title>Índice</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    <center>
        <header>
            <p>Ativos no momento <%= contador%></p>
        </header>
        <%if (loginName != null) {%>
        <%if (listaUsuarios != null) {%>
        <table>
            <tr>
                <th>USUÁRIOS ATIVOS</th>
            </tr>
            <%for (int i = 0; i < listaUsuarios.length - 1; i++) {%>
            <%if (listaUsuarios[i] != null && !listaUsuarios[i].equals("")) {%>
            <tr>
                <td><%= listaUsuarios[i]%></td>
            </tr>
            <%}%>
            <%}%>
        </table>
        <%}%>
        <%}%>
    </center>
</body>
</html>
