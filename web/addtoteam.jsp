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
        <%@page import="java.util.ArrayList"%>
        <% 
            TeamList tmlst = new TeamList();
            StudentenList stdtlst = new StudentenList();
            TeamspelerList tmsplrlst = new TeamspelerList();
            
            ArrayList<Student> arylist = new ArrayList();        
            
            for(Student stdt : stdtlst.list){
                int i = 0;
                if(tmsplrlst.isPlayerInTeam(stdt.getVariable("spelerscode")).size() == 0){
                    arylist.add(stdt);
                }
            }
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
            <form action="addselected.jsp" method="get">
            <table>
                <tr class='head'>
                    <td>Voeg toe</td>
                    <td>Spelers Nummer</td>
                    <td>Naam vd Speler</td>
                </tr>
                
                <%
                    for(int i = 0; i < arylist.size(); i++){
                    %>  <tr>

                            <td id="delete">
                                <input id="deleteBox" type="checkbox" name="add" value="<%=arylist.get(i).getVariable("spelerscode")%>">
                            </td>
                            <td>
                                <%=arylist.get(i).getVariable("spelersnr")%>
                            </td>
                            <td>
                                <a href="getstudent.jsp?code=<%=arylist.get(i).getVariable("spelersnr")%>">
                                <%=arylist.get(i).getVariable("tussenvoegsels")%> <%=arylist.get(i).getVariable("achternaam")%>, <%=arylist.get(i).getVariable("roepnaam")%>
                                </a>
                            </td>
                        </tr><%
                    }
                %>
            </table>
            <input type="hidden" name="code" value="<%=request.getParameter("code")%>">
            <input type="submit" value="Voeg speler(s) toe aan dit team">
            </form>

            <script>var asdf = <%=tmlst.aantalTeams%></script>
            <div><a href="getteam.jsp?code=<%=request.getParameter("code")%>">Ga terug</a></div>
        </div>
    </body>
</html>