/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Db;

import java.sql.*;
import java.util.ArrayList;
import web.DbListener;
/**
 *
 * @author santo
 */
public class TasksConnector {
    public static ArrayList<String> getTasks() throws Exception{
       ArrayList<String> list = new ArrayList<>();
       Connection con = DbListener.getConnection();
       Statement stmt = con.createStatement();
       ResultSet rs = stmt.executeQuery("SELECT * FROM tasks");
       
        while (rs.next()) {
            list.add(rs.getString("name"));           
        }
        rs.close();
        stmt.close();
        con.close();
       return list;
    }
    public static void addTasks(String taskName) throws Exception{
       Connection con = DbListener.getConnection();
       Statement stmt = con.createStatement();
       stmt.execute("INSERT INTO tasks values('"+taskName+"')");
       stmt.close();
       con.close();
    }

    public static void removeTasks(String taskName) throws Exception{
       Connection con = DbListener.getConnection();
       Statement stmt = con.createStatement();
       stmt.execute("DELETE FROM tasks WHERE name = '"+taskName+"'");
       stmt.close();
       con.close();
    }
    
    
}
