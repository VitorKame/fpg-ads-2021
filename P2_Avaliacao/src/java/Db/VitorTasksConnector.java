/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Db;

import java.sql.*;
import java.util.ArrayList;
import web.VitorDbListener;

/**
 *
 * @author santo
 */
public class VitorTasksConnector {
    public static ArrayList<String> getTasks() throws SQLException{
        ArrayList<String> list = new ArrayList<>();
        
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT title FROM vitor_tasks");
        
        while(rs.next()){
            list.add(rs.getString("title"));
        }

        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void addTask(String taskName, String userName) throws SQLException{
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("INSERT INTO vitor_tasks VALUES (null, '"+taskName+"', '"+userName+"')");
        stmt.close();
        con.close();
        
    }
    
    public static void deleteTask(String taskName) throws SQLException{
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("DELETE FROM vitor_tasks WHERE title = '"+taskName+"'");
        stmt.close();
        con.close();
        
    }
}
