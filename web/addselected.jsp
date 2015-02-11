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
            TeamspelerList tmsplrlst = new TeamspelerList();
            for(String s : request.getParameterValues("add")){
                ArrayList<String> arylist = new ArrayList(2);
                arylist.add(request.getParameter("code"));
                arylist.add(s);
                tmsplrlst.addTeamspeler(arylist);
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
            <h2>Team is toegevoegd.</h2><br>
            <a href="getteam.jsp?code=<%=request.getParameter("code")%>">Klik hier om terug naar team <%=request.getParameter("code")%> te gaan.</a>
        </div>
    </body>
</html>
