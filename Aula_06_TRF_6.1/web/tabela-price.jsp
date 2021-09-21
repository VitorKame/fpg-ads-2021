<%-- 
    Document   : tabela-price
    Created on : 13 de set de 2021, 20:33:36
    Author     : santo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    int n = 0;
    double pv = 0d, pmt = 0d, j = 0d, a = 0d;
    String diaDoMes[] = {"Período", "Saldo Devedor", "Parcela", "Juros", "Amortização"};
    if (request.getParameter("n") == null) {
        error = "Não foi informado o parâmetro necessário 'n'";
    } else if (request.getParameter("pv") == null) {
        error = "Não foi informado o parâmetro necessário 'pv'";
    }else if (request.getParameter("j") == null) {
        error = "Não foi informado o parâmetro necessário 'j'";
    } else {
        try {
            n = Integer.parseInt(request.getParameter("n"));
            pv = Double.parseDouble(request.getParameter("pv"));
            j = Double.parseDouble(request.getParameter("j"))/100;
        } catch (Exception e) {
            error = "Algum dos valores informados não é um válido";
        }
    }   

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <form action="tabela-price.jsp">
            <input type="number" name="n" placeholder="n"/>
            
            <input type="number" name="pv" placeholder="pv"/>
            
            <input type="number" name="j" placeholder="j"/>
            
            <input type="submit" value="Gerar"/>
        </form>
        <table border="1">
            <tr>
                <%for (int i = 0; i < diaDoMes.length; i++) {%>
                    <th id="diaMes"><%= diaDoMes[i]%></th>                
                <%}%>
            </tr>            

            <%for (int i = 1; i <= n; i++) {%>
            <tr>
                <td><%= i %></td>
                <td><%= pv %></td>
                <td><%= pmt %></td>
                <td><%= j %></td>
                <td><%= a %></td>
                
                <%= pv = pv - a %>
                <%= pmt = (pv*j)/(1-(1/Math.pow((1+j),n))) %>
                <%= j = pv * j %>
                <%= a = pmt - j %>               
            </tr>
            <%}%>
        </table>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
