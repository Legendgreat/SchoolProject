<%-- 
    Document   : newstudent
    Created on : 28-Mar-2014, 10:16:33
    Author     : Legendgreat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@page import="jsp.*;"%>
        <%@page import="java.util.ArrayList;"%>
        <title>Team toegevoegd</title>
    </head>
    <body>
         <%
            TeamList tmlst = new TeamList();
            ArrayList<String> arylist = new ArrayList(2);
            
            arylist.add(request.getParameter("teamcode"));
            arylist.add(request.getParameter("teamomschrijving"));
            
            tmlst.addTeam(arylist);
        %>
        <div id="nav">
            <a href="index.html">Home</a>
            <a href="newstudent.html">Nieuwe Student</a>
            <a href="allstudents.jsp">Alle Studenten</a>
            <a href="newteam.html">Nieuw Team</a>
            <a href="allteams.jsp">Alle Teams</a>
        </div>
        <div id="content">
            <h2>Team is toegevoegd.</h2><br>
            <a href="getteam.jsp?code=<%=request.getParameter("teamcode")%>">Klik hier om naar nieuw aangemaakte team te gaan.</a>
        </div>
    </body>
</html>
