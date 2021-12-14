package Db;

import java.sql.*;
import java.util.ArrayList;
import web.VitorDbListener;


public class VitorJurosDao {
        public static ArrayList<String> getHistorico(String userName) throws Exception{
        ArrayList<String> list = new ArrayList<>();
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        try{
        ResultSet rs = stmt.executeQuery("SELECT log FROM vitor_calc_history WHERE username = '"+userName+"';");
        
        while(rs.next()){
            list.add(rs.getString(""));
        }        
        }finally{
        stmt.close();
        con.close();
        }
        return list;
    }
    
    
    public static void addJuros(String data, String userName, double log) throws Exception{
        
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("INSERT INTO vitor_calc_history ("+ data +", "+ userName +", "+ log +")");
        
        stmt.close();
        con.close();
        
    }
    
    public static boolean validaUsuario(String userName, String password) throws Exception{
        
        Connection con = VitorDbListener.getConnection();
        Statement stmt = con.createStatement();
        boolean retorno = false;
        try{
        ResultSet rs = stmt.executeQuery("SELECT * FROM vitor_users WHERE username = '"+userName+"'  AND password = '"+password+"';");
        
        while(rs.next()){
            retorno = true;
        }
        
        }finally{
        stmt.close();
        con.close();
        }
        return retorno;
    }
    
}
