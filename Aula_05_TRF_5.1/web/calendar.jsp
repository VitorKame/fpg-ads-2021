<%-- 
    Document   : calendar
    Created on : 1 de set de 2021, 21:51:17
    Author     : santo
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    int ano = 0;
    int mes = 0;
    if (request.getParameter("mes") == null) {
        error = "Não foi informado o parâmetro necessário 'mes'";
    } else if (request.getParameter("ano") == null) {
        error = "Não foi informado o parâmetro necessário 'ano'";
    } else {
        try {
            ano = Integer.parseInt(request.getParameter("ano"));
            mes = Integer.parseInt(request.getParameter("mes"));
        } catch (Exception e) {
            error = "Algum dos valores informados não é um válido";
        }
    }
    int dia = 1;
    boolean bissexto = false;
    int tamanhoDoMes[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    String mesAno[] = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};
    String diaDoMes[] = {"DOMINGO", "SEGUNDA", "TERÇA", "QUARTA", "QUINTA", "SEXTA", "SÁBADO"};
    String calendario[][] = new String[6][7];

    Calendar c = Calendar.getInstance();
    c.set(Calendar.YEAR, ano);
    c.set(Calendar.MONTH, mes - 1);
    c.set(Calendar.DAY_OF_MONTH, dia);
    int diaDaSemana = c.get(Calendar.DAY_OF_WEEK);

    if (((ano % 4 == 0) && (ano % 100 != 0)) || (ano % 400 == 0)) {
        bissexto = true;
    }

    if (bissexto) {
        tamanhoDoMes[1] = 29;
    }

    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 7; j++) {
            if (i == 0 && j < diaDaSemana - 1) {
                calendario[i][j] = "";
            } else if (dia <= tamanhoDoMes[mes - 1]) {
                calendario[i][j] = String.valueOf(dia++);
            } else {
                calendario[i][j] = "";
            }
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            div{
                margin-left: 30%;
            }
            #mesNumero{
                text-align: left;
                margin: 0px 0px;
                font-size: 140px;
            }
            #mesAno{
                text-transform: uppercase;
                font-size: 25px;
                font-weight: bold;
                margin: 0px 0px;
                padding-bottom: 60px;
            }
            #diaMes{
                width: 100px;
                height: 25px;
                text-align: left;
                font-weight: 200;
                font-size: 15px;
            }
            #numDias{
                font-size: 15px;
                width: 100px;
                height: 75px;
            }
        </style>
    </head>
    <body>
        <%if (error != null) {%>
        <div style="color: red"><%= error%></div>
        <%} else {%>
        <div>
            <p id="mesNumero"><%= mes%>.</p>              
            <p id="mesAno"><%= mesAno[mes - 1]%>/<%= ano%></p>
            <table>              

                <tr>
                    <%for (int i = 0; i < diaDoMes.length; i++) {%>
                    <th id="diaMes"><%= diaDoMes[i]%></th>                
                        <%}%>
                </tr>

                <%for (int i = 0; i < 6; i++) {%>
                <tr>
                    <%for (int j = 0; j < 7; j++) {%>
                    <td id="numDias"><%= calendario[i][j]%></td>
                    <%}%>
                </tr>
                <%}%>
            </table>
            <a href="index.html"><input type="button" value="Voltar" style="width: 250px; height: 25px; font-size: 20px; background-color: transparent; border-width: 2px; border-color: black;"/></a>
        </div>
        <%}%>
    </body>
</html>
