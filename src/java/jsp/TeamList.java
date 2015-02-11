package jsp;

import java.util.ArrayList;
import java.sql.*;

public class TeamList {
    
    DatabaseConnection dbc;
    PreparedStatement queryStmt = null;
    Statement queryNStmt = null;
    public int aantalTeams;
    public ArrayList<Team> list = new ArrayList();
    public String query;
    
    public TeamList(){
        dbc = new DatabaseConnection();
        dbc.establishConnection();
        aantalTeams = getAantalTeams();
        getTeams();
    }

    private int getAantalTeams(){
        int aantalTeams = 0;
        ResultSet rs = null;
        query = "SELECT COUNT(*) FROM team;";
        setPreparedStatement(query);
        
        rs = dbc.makeQuery(query);
        
        try{
            while(rs.next())
            aantalTeams = rs.getInt(1);
            dbc.closeConnection();
        }catch(SQLException sqle){sqle.printStackTrace();}
        return aantalTeams;
    }
    
    public void getTeams(){
        dbc.establishConnection();
        for(int i = 0; i <= aantalTeams - 1; i++){
            list.add(new Team(i+1, dbc));
        }
        dbc.closeConnection();
    }
    
    public void addTeam(ArrayList<String> arylst){
        dbc.establishConnection();
        query = "INSERT INTO team (teamcode, teamomschrijving) "
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
    
    public void changeTeam(String i, ArrayList<String> arylst){
        dbc.establishConnection();
        query = "UPDATE team "
              + "SET teamcode = ?, teamomschrijving = ? "
              + "WHERE teamcode = ?;";
        queryStmt = dbc.prepareStatement(query);
        try{
            queryStmt.setString(1, arylst.get(0));
            queryStmt.setString(2, arylst.get(1));
            queryStmt.setString(3, i);
            dbc.commit();
        }catch(SQLException sqle){}
        
        dbc.execute(queryStmt);
        dbc.closeConnection();
    }
    
    public Team getTeam(String i){
        Team tmnull = null;
        for(Team tm : list){
            if(i.equals(tm.teamcode))
                return tm;
        }
        return tmnull;
    }
    
    public void removeTeam(String i){
        dbc.establishConnection();
        query = "DELETE FROM team "
              + "WHERE teamcode = ?";
        queryStmt = dbc.prepareStatement(query);
        try{
            queryStmt.setString(1, i);
            dbc.commit();
        } catch(SQLException sqle){}
        
        dbc.execute(queryStmt);
        dbc.closeConnection();
    }
    
    public ArrayList<Team> getTeamList(){
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
