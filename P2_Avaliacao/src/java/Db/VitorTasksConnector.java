/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Db;

import Objeto.Objeto;
import java.sql.*;
import java.util.ArrayList;
import web.VitorDbListener;

/**
 *
 * @author santo
 */
public class VitorTasksConnector {
    
    public static ArrayList<Objeto> getTasks() throws SQLException{
        ArrayList<Objeto> list = new ArrayList<>();
        Objeto objeto;
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id, title, user FROM vitor_tasks");
        
        while(rs.next()){
            objeto = new Objeto();
            objeto.setId(rs.getInt("id"));
            objeto.setTaskName(rs.getString("title"));
            objeto.setUserName(rs.getString("user"));
            list.add(objeto);
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
    
    public static void deleteTask(String id) throws SQLException{
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("DELETE FROM vitor_tasks WHERE id = '"+id+"'");
        stmt.close();
        con.close();
        
    }
}
