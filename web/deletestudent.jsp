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
        <title>Student verwijderd</title>
        <%@page import="jsp.*"%>
        <%@page import="java.util.ArrayList;"%>
    </head>
    <body>
        <%
            StudentenList stdtlst = new StudentenList();
            TeamspelerList tmsplrlst = new TeamspelerList();
            ArrayList<Integer> arylst = new ArrayList();
            
            for(String s : request.getParameterValues("delete")){
                if(tmsplrlst.isPlayerInTeam(s).size() != 0){
                    for(Teamspeler tmsplr : tmsplrlst.list){
                        if(tmsplr.getVariable("spelerscode").equals(s)){
                            tmsplrlst.removeTeamspeler(tmsplr.getVariable("teamcode"), tmsplr.getVariable("spelerscode"));
                        }
                    }
                }
                stdtlst.removeStudent(s);
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
            De student is verwijderd.<br>
            Klik <a href="allstudents.jsp">hier</a> om terug te gaan.
        </div>
    </body>
</html>
