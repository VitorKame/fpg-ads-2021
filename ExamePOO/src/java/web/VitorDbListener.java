/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/ServletListener.java to edit this template
 */
package web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author santo
 */
public class VitorDbListener implements ServletContextListener {
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:jurosex.db";
    public static Exception exception = null;
    
    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL);
    } 
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            stmt.execute("CREATE TABLE IF NOT EXISTS vitor_users("
                    + "username VARCHAR(100) NOT NULL,"
                    + "password VARCHAR(100) NOT NULL,"
                    + "name VARCHAR(100) NOT NULL"
                    + ");");
            
            stmt.execute("CREATE TABLE IF NOT EXISTS vitor_calc_history("
                    + "datatime VARCHAR(100) NOT NULL,"
                    + "username VARCHAR(100) NOT NULL,"
                    + "log VARCHAR(100) NOT NULL"
                    + ");");            
            
            stmt.execute("INSET INTO vitor_users VALUES (adm, adm, ADIMINISTRADOR);");
            stmt.execute("INSET INTO vitor_users VALUES (adm2, adm2, ADIMINISTRADOR2);"); 
            stmt.close();
            
            con.close();
        } catch (Exception e) {
            exception = e;
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
