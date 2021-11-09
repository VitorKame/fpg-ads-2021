<%-- 
    Document   : index
    Created on : 8 de nov de 2021, 21:24:01
    Author     : santo
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="web.DbListener"%>
<%@page import="Db.TasksConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Exception requestException = null;
    ArrayList<String> taskList = new ArrayList<>();
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy - HH:mm:ss");

    Date currenttime = new Date();

    String dataHora = formatter.format(currenttime);

    try{
        if(request.getParameter("add")!=null){
            String taskName = request.getParameter("taskName");
            TasksConnector.addTasks(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        
        if(request.getParameter("remove")!=null){
            String taskName = request.getParameter("taskName");
            TasksConnector.removeTasks(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        
        taskList = TasksConnector.getTasks();
    }catch(Exception e){
        requestException = e;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JDBC - To-do List</title>
    </head>
    <body>
        <h1>JDBC - Vitor dos Santos Rodrigues - <%= dataHora %> </h1>
        <h2>To-do List</h2>
        <%if (DbListener.exception!= null) {%>
        <div style="color:red">
            Erro na criação do BD: <%= DbListener.exception.getMessage() %>
        </div>
        <%}%>
        <%if (requestException!= null) {%>
        <div style="color:red">
            Erro na leitura ou gravação das tarefas: <%= requestException.getMessage() %>
        </div>
        <%}%>
        
        <form>
            <input type="text" name="taskName"/>
            <input type="submit" name="add" value="+"/>
        </form>
        
        <table>
            <%for(String taskName: taskList){%>
            <tr>
                <td><%= taskName %></td>
                <td>
                    <form>
                        <input type="hidden" name="taskName" value="<%= taskName %>"/>
                        <input type="submit" name="remove" value="-"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        
        
    </body>
</html>
