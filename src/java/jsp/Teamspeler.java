package jsp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.Date;

public final class Teamspeler {
    
    String teamcode, spelerscode;
    int rownr;
    DatabaseConnection dbc;
    
    String query;
    PreparedStatement queryStmt = null;
    
    public TeamspelerList tmsplrlst;
    
    public Teamspeler(int rownr, DatabaseConnection dbc){
        query = ("SELECT * FROM teamspeler ORDER BY teamcode LIMIT 1 OFFSET ?");
        
        this.rownr = rownr - 1;
        this.dbc = dbc;
        setPreparedStatement(query);
        getInformation();
    }
    
    public void getInformation(){
        ResultSet rs;
        
        dbc.establishConnection();
        
        rs = dbc.makeQuery(queryStmt);

        try{
            while(rs.next()){
                this.teamcode = rs.getString("teamcode");
                this.spelerscode = rs.getString("spelerscode");
            }
        }catch(SQLException sqle){
            System.out.print(sqle);
        }
    }
    
    public void setPreparedStatement(String query){
        queryStmt = dbc.prepareStatement(query);
        try{
            queryStmt.setInt(1, rownr);
        }catch(SQLException sqle){}
        dbc.commit();
    }
    
    public String getVariable(String key){

        String s = "err_code=404";
        
        switch(key){
            case "teamcode":
                return teamcode;
            case "spelerscode":
                return spelerscode;
            case "rownr":
                return String.valueOf("rownr");
        }
        return s;
    }
}
