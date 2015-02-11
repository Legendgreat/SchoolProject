<%-- 
    Document   : deletestudent
    Created on : 31-Mar-2014, 09:34:59
    Author     : Legendgreat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Team verwijderd</title>
        <%@page import="jsp.*"%>
        <%@page import="java.util.ArrayList;"%>
    </head>
    <body>
        <%
            TeamList tmlst = new TeamList();
            TeamspelerList tmsplrlst = new TeamspelerList();
            ArrayList<Integer> arylst = new ArrayList();
            
            for(String s : request.getParameterValues("delete")){
                if(tmsplrlst.doesTeamHavePlayer(s).size() != 0){
                    for(Teamspeler tmsplr : tmsplrlst.list){
                        if(tmsplr.getVariable("teamcode").equals(s)){
                            tmsplrlst.removeTeamspeler(tmsplr.getVariable("teamcode"), tmsplr.getVariable("spelerscode"));
                        }
                    }
                }
                tmlst.removeTeam(s);
            }
        %>
        <div id="nav">
            <a href="index.html">Home</a>
            <a href="newstudent.html">Nieuwe Student</a>
            <a href="allstudents.jsp">Alle Studenten</a>
            <a href="newteam.html">Nieuw Team</a>
            <a href="allteams.jsp">Alle Teams</a>
        </div>
        <div id="content">
            Het team is verwijderd.<br>
            Klik <a href="allteams.jsp">hier</a> om terug te gaan.
        </div>
    </body>
</html>
