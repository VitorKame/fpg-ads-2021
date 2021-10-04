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
        <title>Sobre Mim</title>
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
            <tr>
                <td class="td-info"><p>Vitor dos Santos Rodrigues</p></td>
                <td class="td-info"><p>N° matricula: 1290482012037</p></td>
            </tr>
            <tr>
                <td class="td-info"><p>Aluno da FATEC PG desde Janeiro de 2020</p></td>
                <td class="td-info"><a href="https://www.github.com/VitorKame"><p>GitHub</p></a></td>
            </tr>
        </table>
        
        <table>
            <tr>
                <td>Banco de Dados</td>
                <td>Engenharia de Software III</td>
                <td>Programação Orientada a Objetos</td>
                <td>Linguagem de Programação IV - Internet</td>
            </tr>
            <tr>
                <td>Sistemas Operacionais II</td>
                <td>Inglês IV</td>
                <td>Metodologia de Pesquisa Cientifico-Tecnológia</td>
                <td>Estágio Supervisionado em Análise e Desenvolvimento de Sistemas</td>
            </tr>
        </table>
        <%}%>
    </center>
    </body>
</html>
