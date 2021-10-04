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
        <title>Megasena</title>
    </head>
    <body>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <center>
        <header>
            <p>Ativos no momento <%= contador%></p>
        </header>
        <%if (loginName == null) {%>
        <p class="aviso">Sem acesso ao conteudo!</p>
        <%} else{%>
        <table>
            <%for (int i = 0; i < 2; i++) {%>
            <tr>
            <%for (int j = 0; j < 3; j++) {%>
                <td><%= tabelaMegasena[i][j]%></td>
            <%}%>
            </tr>
            <%}%>
        </table>
        <%}%>
    </center>
    </body>
</html>
