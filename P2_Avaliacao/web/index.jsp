<%-- 
    Document   : index
    Created on : 22 de nov de 2021, 21:42:29
    Author     : santo
--%>

<%@page import="Objeto.Objeto"%>
<%@page import="web.VitorDbListener"%>
<%@page import="Db.VitorTasksConnector"%>
<%@page import="java.lang.Exception"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Exception requestException = null;
    ArrayList<Objeto> tasks = new ArrayList<>();
    
    try{
        if(request.getParameter("create")!=null){
           String taskname = request.getParameter("taskName");
           String userName = (String) session.getAttribute("userName");
           VitorTasksConnector.addTask(taskname, userName);
           response.sendRedirect(request.getRequestURI());
        }
        
        if(request.getParameter("delete")!=null){
           String id = request.getParameter("id");
           VitorTasksConnector.deleteTask(id);
           response.sendRedirect(request.getRequestURI());
        }
        
        tasks = VitorTasksConnector.getTasks();
    }catch(Exception e){
        requestException = e;
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if (VitorDbListener.exception!= null) {%>
        <div style="color:red">
            Erro na criação do BD: <%= VitorDbListener.exception.getMessage() %>
        </div>
        <%}%>
        <%if (requestException!= null) {%>
        <div style="color:red">
            Erro na leitura ou gravação das tarefas: <%= requestException.getMessage() %>
        </div>
        <%}%>
        <%if (session.getAttribute("userName") == null) {%>
        <h3 style="color: red;">É necessário identificar-se para visualizar as tarefas</h3>
        <%} else {%>
        
        <form>
            <input type="text" name="taskName"/>
            <input type="submit" name="create" value="+"/>
        </form>
        
        <table border="1">
            <%for(Objeto task : tasks){%>
            <tr>
                <td><%= task.getId() %></td>
                <td><%= task.getTaskName() %></td>
                <td><%= task.getUserName() %></td>
                <td>
                    <form>
                        <input type="hidden" name="id" value="<%= task.getId() %>"/>
                        <input type="submit" name="delete" value="-"/>
                    </form>
                </td>
            </tr>
            <%}%>
            
        </table>        
        <%}%>
    </body>
</html>
