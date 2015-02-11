package jsp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.Date;

public final class Student {
    
    String spelerscode, roepnaam, tussenvoegsels, achternaam, adres, postcode, woonplaats, telefoon;
    Date geboortedatum;
    int rownr, spelersnr, geboortejaar, geboortemaand, geboortedag;
    DatabaseConnection dbc;
    
    String query;
    PreparedStatement queryStmt = null;
    
    public StudentenList stdtlst;
    
    public Student(int rownr, DatabaseConnection dbc){
        query = ("SELECT * FROM speler ORDER BY spelersnr LIMIT 1 OFFSET ?");
        
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
                this.spelerscode = rs.getString("spelerscode");
                this.spelersnr = Integer.parseInt(rs.getString("spelersnr"));
                this.roepnaam = rs.getString("roepnaam");
                this.tussenvoegsels = rs.getString("tussenvoegsels");
                this.achternaam = rs.getString("achternaam");
                this.adres = rs.getString("adres");
                this.postcode = rs.getString("postcode");
                this.woonplaats = rs.getString("woonplaats");
                this.telefoon = rs.getString("telefoon");
                this.geboortedatum = rs.getDate("geboortedatum");
                this.geboortejaar = geboortedatum.getYear();
                this.geboortemaand = geboortedatum.getMonth();
                this.geboortedag = geboortedatum.getDay();
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

        String s = "The specified key could not be found.";
        
        switch(key){
            case "spelerscode":
                return spelerscode;
            case "spelersnr":
                return String.valueOf(spelersnr);
            case "roepnaam":
                return roepnaam;
            case "tussenvoegsels":
                return tussenvoegsels;
            case "achternaam":
                return achternaam;
            case "adres":
                return adres;
            case "postcode":
                return postcode;
            case "woonplaats":
                return woonplaats;
            case "telefoon":
                return telefoon;
            case "geboortedatum":
                return geboortedatum.toString();
            case "geboortejaar":
                return String.valueOf(geboortejaar);
            case "geboortemaand":
                return String.valueOf(geboortemaand);
            case "geboortedag":
                return String.valueOf(geboortedag);
        }
        return s;
    }
}
