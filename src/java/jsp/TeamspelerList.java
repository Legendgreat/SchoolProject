package jsp;

import java.util.ArrayList;
import java.sql.*;
import java.util.Iterator;

public class TeamspelerList {
    
    DatabaseConnection dbc;
    PreparedStatement queryStmt = null;
    Statement queryNStmt = null;
    public int aantalTeamspelers;
    public ArrayList<Teamspeler> list = new ArrayList();
    public String query;
    
    public TeamspelerList(){
        dbc = new DatabaseConnection();
        dbc.establishConnection();
        aantalTeamspelers = getAantalTeamspelers();
        getTeamspelers();
    }

    private int getAantalTeamspelers(){
        int aantalTeamspelers = 0;
        ResultSet rs = null;
        query = "SELECT COUNT(*) FROM teamspeler;";
        setPreparedStatement(query);
        
        rs = dbc.makeQuery(query);
        
        try{
            while(rs.next())
            aantalTeamspelers = rs.getInt(1);
            dbc.closeConnection();
        }catch(SQLException sqle){sqle.printStackTrace();}
        return aantalTeamspelers;
    }
    
    public void getTeamspelers(){
        dbc.establishConnection();
        for(int i = 0; i <= aantalTeamspelers - 1; i++){
            list.add(new Teamspeler(i+1, dbc));
        }
        dbc.closeConnection();
    }
    
    public void addTeamspeler(ArrayList<String> arylst){
        dbc.establishConnection();
        query = "INSERT INTO teamspeler (teamcode, spelerscode) "
              + "VALUES (?, ?);";
        queryStmt = dbc.prepareStatement(query);
        try{
            queryStmt.setString(1, arylst.get(0));
            queryStmt.setString(2, arylst.get(1));
            dbc.commit();
        }catch(SQLException sqle){}
        
        dbc.execute(queryStmt);
        dbc.closeConnection();
    }
    
    public Teamspeler getTeamspeler(String i){
        Teamspeler tmsplrnull = null;
        for(Teamspeler tmsplr : list){
            if(i.equals(tmsplr.teamcode))
                return tmsplr;
        }
        return tmsplrnull;
    }
    
    public void removeTeamspeler(String i1, String i2){
        dbc.establishConnection();
        query = "DELETE FROM teamspeler "
              + "WHERE teamcode = ? AND spelerscode = ? ;";
        queryStmt = dbc.prepareStatement(query);
        try{
            queryStmt.setString(1, i1);
            queryStmt.setString(2, i2);
            dbc.commit();
        } catch(SQLException sqle){}
        
        dbc.execute(queryStmt);
        dbc.closeConnection();
    }
    
    public ArrayList<String> isPlayerInTeam(String code){
        ArrayList<String> returnArray = new ArrayList();
        for(Teamspeler tmsplr : list){
            if(tmsplr.getVariable("spelerscode").equals(code)){
                returnArray.add(tmsplr.getVariable("teamcode"));
            }
        }
        return returnArray;
    }
    
    public ArrayList<String> doesTeamHavePlayer(String code){
        ArrayList<String> returnArray = new ArrayList();
        for(Teamspeler tmsplr : list){
            if(tmsplr.getVariable("teamcode").equals(code)){
                returnArray.add(tmsplr.getVariable("spelercode"));
            }
        }
        return returnArray;
    }
    
    public ArrayList<Teamspeler> formatByTeam(String teamcode){
        int i = 0;
        ArrayList<Teamspeler> arylist = new ArrayList();
        for (Teamspeler tmsplr : list) {
            if(tmsplr.getVariable("teamcode").equals(teamcode)){
                arylist.add(list.get(i));
            }
            i++;
        }
        return arylist;
    }
    
    public ArrayList<Teamspeler> formatBySpeler(String spelerscode){
        int i = 0;
        ArrayList<Teamspeler> arylist = new ArrayList();
        for(Teamspeler tmsplr : list){
            if(tmsplr.getVariable("spelerscode").equals(spelerscode)){
                arylist.add(list.get(i));
            }
            i++;
        }
        return arylist;
    }
    
    public ArrayList<Teamspeler> getTeamspelerList(){
        return list;
    }
    
    public void setPreparedStatement(String query){
        queryStmt = dbc.prepareStatement(query);
        dbc.commit();
    }
    
    public void setStatement(String query){
        queryNStmt = dbc.setStatement(query);
        dbc.commit();
    }
    
    
}
