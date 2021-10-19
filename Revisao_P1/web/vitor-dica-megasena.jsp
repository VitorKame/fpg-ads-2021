<%-- 
    Document   : index
    Created on : 18 de out. de 2021, 20:56:03
    Author     : santo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Integer> NumerosSorteados = (ArrayList)session.getAttribute("vetor");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dica Megasena</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/header.jspf" %>
         <h2 style="text-align: center">Dica Megasena</h2>
         <% if(session.getAttribute("username")==null){%>
         <h2 style="color: palevioletred">Você não tem permissão para ver essa página!</h2>
         <%}else{%>
         <h3 style="text-align: center">Números Sorteados para <%= session.getAttribute("username") %></h3>
         <table border="1" style="width : 620px; height: 100px; margin-left: 28%; background-color: lightpink; color: white">
             <tr>
             <%for(int n: NumerosSorteados){%>
                 <td style="text-align: center"><%= n %></td>
             <%}%>
             </tr>
         </table>
         <%}%>
    </body>
</html>
