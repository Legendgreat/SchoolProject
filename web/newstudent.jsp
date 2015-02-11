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
        <title>Student toegevoegd</title>
    </head>
    <body>
         <%
            StudentenList stdtlst = new StudentenList();
            String date;
            ArrayList<String> arylist = new ArrayList(10);
            
            arylist.add(request.getParameter("spelerscode"));
            arylist.add(request.getParameter("spelersnr"));
            arylist.add(request.getParameter("roepnaam"));
            arylist.add(request.getParameter("tussenvoegsels"));
            arylist.add(request.getParameter("achternaam"));
            arylist.add(request.getParameter("adres"));
            arylist.add(request.getParameter("postcode"));
            arylist.add(request.getParameter("woonplaats"));
            arylist.add(request.getParameter("telefoon"));
            
            date = request.getParameter("kontpak") + "-" + request.getParameter("emilioricardojuarezfaggot") + "-" + request.getParameter("donifaggot");
            arylist.add(date);
            
            stdtlst.addStudent(arylist);
        %>
        <div id="nav">
            <a href="index.html">Home</a>
            <a href="newstudent.html">Nieuwe Student</a>
            <a href="allstudents.jsp">Alle Studenten</a>
            <a href="newteam.html">Nieuw Team</a>
            <a href="allteams.jsp">Alle Teams</a>
        </div>
        <div id="content">
            <h2>Student is toegevoegd.</h2><br>
            <a href="getstudent.jsp?code=<%=request.getParameter("spelerscode")%>">Klik hier om naar nieuw aangemaakte student te gaan.</a>
        </div>
    </body>
</html>
