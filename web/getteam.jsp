<%-- 
    Document   : getstudent
    Created on : 25-Apr-2014, 11:38:22
    Author     : Legendgreat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Team gegevens</title>
        <link rel='stylesheet' type='text/css' href='style.css'>
        <%@page import="jsp.*" %>
        <%@page import="java.util.ArrayList"%>
    </head>
    <body>
        <div id="nav">
            <a href="index.html">Home</a>
            <a href="newstudent.html">Nieuwe Student</a>
            <a href="allstudents.jsp">Alle Studenten</a>
            <a href="newteam.html">Nieuw Team</a>
            <a href="allteams.jsp">Alle Teams</a>
        </div>
        <div id='content' class='getteam'>
        <%
            TeamList tmlst = new TeamList();
            TeamspelerList tmsplrlst = new TeamspelerList();
            StudentenList stdtlst = new StudentenList();
            boolean teamFound = false;
            for(Team tm : tmlst.list){
                if(tm.getVariable("teamcode").equals(request.getParameter("code")) && !teamFound){
                    teamFound = true;
                    %>
                    <form>
                        
                        <table>
                            <tr class='head'>
                                <td>Team Code</td>
                                <td>Team Omschrijving</td>
                            </tr>
                            <tr>
                                <td><input type="text" name="teamcode" maxlength="15" size="10" value="<%=tm.getVariable("teamcode")%>">
                                    <input type="hidden" name="prevteamcode" value="<%=tm.getVariable("teamcode")%>"></td>
                                <td><input type="text" name="teamomschrijving" maxlength="40" size="20" value="<%=tm.getVariable("teamomschrijving")%>"></td>
                            </tr>
                        </table>
                            <input type="submit" value="Wijzig" formaction="changeteam.jsp"><br><br><br>
                    </form>
                    
                    <form>
                        <table>
                            <tr class="head">
                                <td>Verwijder uit team</td>
                                <td>Spelers Nummer</td>
                                <td>Naam vd. Speler</td>
                            </tr>

                        <%
                            ArrayList<Teamspeler> arylist = new ArrayList();
                            arylist = tmsplrlst.formatByTeam(tm.getVariable("teamcode"));
                            
                            for(Teamspeler tmsplr : arylist){
                        %>
                            <tr>
                                <td>
                                    <input id="deleteBox" type="checkbox" name="delete" value="<%=tmsplr.getVariable("spelerscode")%>">
                                </td>
                                <td><%
                                    for(Student stdt : stdtlst.list){
                                        if(stdt.getVariable("spelerscode").equals(tmsplr.getVariable("spelerscode"))){
                                            out.print(stdt.getVariable("spelersnr"));
                                        }
                                    }
                                %></td>
                                <td><%
                                    for(Student stdt : stdtlst.list){
                                        if(stdt.getVariable("spelerscode").equals(tmsplr.getVariable("spelerscode"))){
                                            out.print(stdt.getVariable("tussenvoegsels") + stdt.getVariable("achternaam") + ", " + stdt.getVariable("roepnaam"));
                                        }
                                    }
                                %></td>
                            </tr>

                        <%
                            }
                        %>

                        </table>
                        <input type="hidden" name="code" value="<%=request.getParameter("code")%>">
                        <input type="submit" value="Voeg spelers toe aan dit team" formaction="addtoteam.jsp">
                        <input type="submit" value="Verwijder spelers van dit team" formaction="deletefromteam.jsp">
                   </form>
                            
                    <%
                }
            }
            if(!teamFound){
            %>
                    
                <h2>Team kon niet gevonden worden.</h2>
                    
            <%
            }
        %>
        </div>
    </body>
</html>
