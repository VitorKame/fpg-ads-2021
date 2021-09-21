<%-- 
    Document   : index
    Created on : 20 de set de 2021, 20:20:40
    Author     : santo
--%>

<%
    if (request.getParameter("session-name") != null && request.getParameter("session-pass") != null){
        session.setAttribute("session-name", request.getParameter("session-name"));
        session.setAttribute("session-pass", request.getParameter("session-pass"));
        session.setAttribute("tabela", session.getAttribute("tabela"));
        response.sendRedirect(request.getRequestURI());
    }else if (request.getParameter("logout") != null) {
        session.removeAttribute("session-name");
        session.removeAttribute("session-pass");
        session.removeAttribute("tabela");
        response.sendRedirect(request.getRequestURI());
    }
    
    String loginName = (String) session.getAttribute("session-name");
   
    int tabelaNumeros[][] = (int[][]) session.getAttribute("tabela");
    int tabelaNumero[][] = new int[2][3];
    
    if(session.getAttribute("tabela") == null){        
        for (int l = 0; l < 2; l++) {
            for (int c = 0; c < 3; c++) {
                tabelaNumero[l][c] = (int) (Math.random() * 100);
            }
        }
        session.setAttribute("tabela", tabelaNumero);
    }    
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VitorAPP</title>
    </head>

    <!-- header -->
    <%@include file="../WEB-INF/jspf/header.jspf"%>
    <body>
            <form>
                <%if (loginName == null) {%>
                Usuario: <input type="text" name="session-name" placeholder="Usuário">
                Senha: <input type="password" name="session-pass" placeholder="Senha"><br><br>
                <input type="submit" value="Entrar">
                <%} else {%>
                Bem vindo, <%= loginName%>
                <input type="submit" name="logout" value="Sair">
                <hr>
                    <table border="1">
                        <%for (int l = 0; l < 2; l++) {%>
                        <tr>
                            <%for (int c = 0; c < 3; c++) {%>
                            <td><%= tabelaNumeros[l][c]%></td>
                            <%}%>
                        </tr>
                        <%}%>
                    </table>
                <%}%>
            </form>
        <hr>



    </body>
</html>
