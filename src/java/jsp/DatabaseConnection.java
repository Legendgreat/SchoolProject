package jsp;

import java.sql.*;
import java.util.logging.*;

/**
 *
 * @author Syftelurth
 */
public class DatabaseConnection {
    
    static Connection con = null;
    static Statement stmt = null;
    
    public void establishConnection(){

        final String url = "jdbc:mysql://localhost:3306/sport";
        final String user = "root";
        final String password = "password";

        try{
            establishDrivers();
            con = DriverManager.getConnection(url, user, password);
            
        }catch(SQLException sqle){
            Logger lgr = Logger.getLogger(DatabaseConnection.class.getName());
            lgr.log(Level.SEVERE, sqle.getMessage(), sqle);
        }
    }
    
    public ResultSet makeQuery(String query){
        try{
            stmt = con.createStatement();
            return(stmt.executeQuery(query));
        }catch(SQLException sqle){
            System.err.print(sqle);
        }
        return(null);
    }
    
    public ResultSet makeQuery(PreparedStatement query){
        try{
            return(query.executeQuery());
        }catch(SQLException sqle){
            sqle.printStackTrace();
        }
        return(null);
    }
    
    public ResultSet makeQuery(Statement query){
        try{
            return(query.getResultSet());
        }catch(SQLException sqle){
            sqle.printStackTrace();
        }
        return(null);
    }
    
    public void execute(PreparedStatement query){
        try{
            query.execute();
        }catch(SQLException sqle){}
    }
    
    public void closeConnection(){
        if(con != null){
            try{
                con.close();  
            }catch(SQLException sqle){
                sqle.printStackTrace();
            }
        }
    }
    
    public PreparedStatement prepareStatement(String query){
        PreparedStatement pprdstmt = null;
        
        try{
            con.setAutoCommit(false);
            pprdstmt = con.prepareStatement(query);
        }catch(SQLException sqle){
            try{
                con.rollback();
            }catch(SQLException sqle2){sqle2.printStackTrace();}
            sqle.printStackTrace();
        }
        return pprdstmt;
    }
    
    public Statement setStatement(String query){
        Statement stmt = null;
        
        try{
            con.setAutoCommit(false);
            stmt = con.prepareStatement(query);
        }catch(SQLException sqle){
            try{
                con.rollback();
            }catch(SQLException sqle2){sqle2.printStackTrace();}
            sqle.printStackTrace();
        }
        return stmt;
    }
    
    public void commit(){
        try{
            con.commit();
            con.setAutoCommit(true);
        }catch(SQLException sqle){
            sqle.printStackTrace();
        }
    }
    
    public void establishDrivers(){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        }catch(ClassNotFoundException|IllegalAccessException|InstantiationException e){
            e.printStackTrace();
        }
    }
    
}

