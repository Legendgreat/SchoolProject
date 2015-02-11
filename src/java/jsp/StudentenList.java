package jsp;

import java.util.ArrayList;
import java.sql.*;

public class StudentenList {
    
    DatabaseConnection dbc;
    PreparedStatement queryStmt = null;
    Statement queryNStmt = null;
    public int aantalStudenten;
    public ArrayList<Student> list = new ArrayList();
    public String query;
    
    public StudentenList(){
        dbc = new DatabaseConnection();
        dbc.establishConnection();
        aantalStudenten = getAantalStudenten();
        getStudenten();
    }

    private int getAantalStudenten(){
        int aantalStudenten = 0;
        ResultSet rs = null;
        query = "SELECT COUNT(*) FROM speler;";
        setPreparedStatement(query);
        
        rs = dbc.makeQuery(query);
        
        try{
            while(rs.next())
            aantalStudenten = rs.getInt(1);
            dbc.closeConnection();
        }catch(SQLException sqle){sqle.printStackTrace();}
        return aantalStudenten;
    }
    
    public void getStudenten(){
        dbc.establishConnection();
        for(int i = 0; i <= aantalStudenten - 1; i++){
            list.add(new Student(i+1, dbc));
        }
        dbc.closeConnection();
    }
    
    public void addStudent(ArrayList<String> arylst){
        dbc.establishConnection();
        query = "INSERT INTO speler (spelerscode, spelersnr, roepnaam, tussenvoegsels, achternaam, adres, postcode, woonplaats, telefoon, geboortedatum) "
              + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        queryStmt = dbc.prepareStatement(query);
        try{
            queryStmt.setString(1, arylst.get(0));
            queryStmt.setInt(2, Integer.parseInt(arylst.get(1)));
            queryStmt.setString(3, arylst.get(2));
            queryStmt.setString(4, arylst.get(3));
            queryStmt.setString(5, arylst.get(4));
            queryStmt.setString(6, arylst.get(5));
            queryStmt.setString(7, arylst.get(6));
            queryStmt.setString(8, arylst.get(7));
            queryStmt.setString(9, arylst.get(8));
            queryStmt.setString(10, arylst.get(9));
            dbc.commit();
        }catch(SQLException sqle){}
        
        dbc.execute(queryStmt);
        dbc.closeConnection();
    }
    
    public void changeStudent(String i, ArrayList<String> arylst){
        dbc.establishConnection();
        query = "UPDATE speler "
              + "SET spelerscode = ?, spelersnr = ?, roepnaam = ?, tussenvoegsels = ?, achternaam = ?, adres = ?, postcode = ?, woonplaats = ?, telefoon = ?, geboortedatum = ? "
              + "WHERE spelersnr = ?;";
        queryStmt = dbc.prepareStatement(query);
        try{
            queryStmt.setString(1, arylst.get(0));
            queryStmt.setInt(2, Integer.parseInt(arylst.get(1)));
            queryStmt.setString(3, arylst.get(2));
            queryStmt.setString(4, arylst.get(3));
            queryStmt.setString(5, arylst.get(4));
            queryStmt.setString(6, arylst.get(5));
            queryStmt.setString(7, arylst.get(6));
            queryStmt.setString(8, arylst.get(7));
            queryStmt.setString(9, arylst.get(8));
            queryStmt.setString(10, arylst.get(9));
            queryStmt.setString(11, i);
            dbc.commit();
        }catch(SQLException sqle){}
        
        dbc.execute(queryStmt);
        dbc.closeConnection();
    }
    
    public Student getStudent(int i){
        Student stdtnull = null;
        for(Student stdt : list){
            if(i == stdt.spelersnr)
                return stdt;
        }
        return stdtnull;
    }
    
    public void removeStudent(String i){
        dbc.establishConnection();
        query = "DELETE FROM speler "
              + "WHERE spelerscode = ?";
        queryStmt = dbc.prepareStatement(query);
        try{
            queryStmt.setString(1, i);
            dbc.commit();
        } catch(SQLException sqle){}
        
        dbc.execute(queryStmt);
        dbc.closeConnection();
    }
    
    public void formatByTeam(String t){
        
    }
    
    public ArrayList<Student> getStudentenList(){
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
