<%-- 
    Document   : index
    Created on : Mar 22, 2014, 1:47:20 PM
    Author     : Syftelurth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alle teams</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@page import="jsp.*"%>
        <% 
            TeamList tmlst = new TeamList();
            int asdf = tmlst.getTeamList().size();
        %>
    </head>
    <body>
        <div id="nav">
            <a href="index.html">Home</a>
            <a href="newstudent.html">Nieuwe Student</a>
            <a href="allstudents.jsp">Alle Studenten</a>
            <a href="newteam.html">Nieuw Team</a>
            <a href="allteams.jsp" class="selected">Alle Teams</a>
        </div>
        <div id="content">
            <form action="deleteteam.jsp" method="get">
            <table>
                <tr class='head'>
                    <td>Verwijderen</td>
                    <td>Team Code</td>
                    <td>Team Omschrijving</td>
                </tr>

                <%
                    for(int i = 0; i < tmlst.getTeamList().size(); i++){
                    %>  <tr>

                            <td id="delete">
                                <input id="deleteBox" type="checkbox" name="delete" value="<%=tmlst.getTeamList().get(i).getVariable("teamcode")%>">
                            </td>
                            <td>
                                <%=tmlst.getTeamList().get(i).getVariable("teamcode")%>
                            </td>
                            <td>
                                <a href="getteam.jsp?code=<%=tmlst.getTeamList().get(i).getVariable("teamcode")%>">
                                <%=tmlst.getTeamList().get(i).getVariable("teamomschrijving")%>
                                </a>
                            </td>
                        </tr><%
                    }
                %>
            </table>

            <input type="submit" value="Verwijderen">
            </form>

            <script>var asdf = <%=tmlst.aantalTeams%></script>
            <div><a href="index.html">Ga terug</a></div>
        </div>
    </body>
</html>