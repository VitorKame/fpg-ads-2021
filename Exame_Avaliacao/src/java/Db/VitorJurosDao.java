package Db;

import java.sql.*;
import java.util.ArrayList;
import web.VitorDbListener;

public class VitorJurosDao {
    public static ArrayList<String> getHistorico() throws Exception{
        ArrayList<String> list = new ArrayList<>();
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM vitor_calc_history");
        
        while(rs.next()){
            list.add(rs.getString("*"));
        }
        rs.close();
        stmt.close();
        con.close();
        
        return  list;
    }
    
    
    public static void addJuros(String userName, double resultado, String log) throws Exception{
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("INSERT INTO vitor_calc_history VALUES ("+userName+"','"+resultado+"','"+log+"')'");
        stmt.close();
        con.close();       
    }
    
    
    public static boolean verificaUsuario(String userName, String password) throws Exception{
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM vitor_users u WHERE u.username = "+userName+"' AND u.password = '"+password+"';'");
        boolean retorno = false;
        
        if(rs.next()){
            return true;
        }
        
        rs.close();
        stmt.close();
        con.close();  
        return retorno;
    }
}
