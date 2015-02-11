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
        <title>Studenten gegevens</title>
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
        <div id='content' class='getstudent'>
        <%
            StudentenList stdtlst = new StudentenList();
            TeamList tmlst = new TeamList();
            TeamspelerList tmsplrlst = new TeamspelerList();
            boolean studentFound = false;
            for(Student stdt : stdtlst.list){
                if(stdt.getVariable("spelerscode").equals(request.getParameter("code")) && !studentFound){
                    studentFound = true;
                    %>
                    <form>
                        
                        <table>
                            <tr class='head'>
                                <td>Speler's Code</td>
                                <td>Speler's Nummer</td>
                                <td>Roepnaam</td>
                                <td>Tussenvoegsels</td>
                                <td>Achternaam</td>
                                <td>Adres</td>
                                <td>Postcode</td>
                                <td>Woonplaats</td>
                                <td>Telefoon</td>
                                <td>Geboortedatum</td>
                            </tr>
                            <tr>
                                <td><input type="text" name="spelerscode" maxlength="15" size="10" value="<%=stdt.getVariable("spelerscode")%>">
                                    <input type="hidden" name="prevspelerscode" value="<%=stdt.getVariable("spelerscode")%>"></td>
                                <td><input type="text" name="spelersnr" maxlength="11" size="5" value="<%=stdt.getVariable("spelersnr")%>"></td>
                                <td><input type="text" name="roepnaam" maxlength="20" size="10" value="<%=stdt.getVariable("roepnaam")%>"></td>
                                <td><input type="text" name="tussenvoegsels" maxlength="10" size="5" value="<%=stdt.getVariable("tussenvoegsels")%>"></td>
                                <td><input type="text" name="achternaam" maxlength="30" size="15" value="<%=stdt.getVariable("achternaam")%>"></td>
                                <td><input type="text" name="adres" maxlength="25" size="13" value="<%=stdt.getVariable("adres")%>"></td>
                                <td><input type="text" name="postcode" maxlength="7" size="4" value="<%=stdt.getVariable("postcode")%>"></td>
                                <td><input type="text" name="woonplaats" maxlength="25" size="12" value="<%=stdt.getVariable("woonplaats")%>"></td>
                                <td><input type="text" name="telefoon" maxlength="11" size="8" value="<%=stdt.getVariable("telefoon")%>"></td>
                                <td><select name="donifaggot">
                                    
                                    <script>
                                        var dagen(document.getElementsByClassName("dag"));
                                        for (var dag:dagen){
                                            if(){
                                                
                                            }
                                        }
                                    </script>
                                    
                                    <option class="dag">01</option>
                                    <option class="dag">02</option>
                                    <option class="dag">03</option>
                                    <option class="dag">04</option>
                                    <option class="dag">05</option>
                                    <option class="dag">06</option>
                                    <option class="dag">07</option>
                                    <option class="dag">08</option>
                                    <option class="dag">09</option>
                                    <option class="dag">10</option>
                                    <option class="dag">11</option>
                                    <option class="dag">12</option>
                                    <option class="dag">13</option>
                                    <option class="dag">14</option>
                                    <option class="dag">15</option>
                                    <option class="dag">16</option>
                                    <option class="dag">17</option>
                                    <option class="dag">18</option>
                                    <option class="dag">19</option>
                                    <option class="dag">20</option>
                                    <option class="dag">21</option>
                                    <option class="dag">22</option>
                                    <option class="dag">23</option>
                                    <option class="dag">24</option>
                                    <option class="dag">25</option>
                                    <option class="dag">26</option>
                                    <option class="dag">27</option>
                                    <option class="dag">28</option>
                                    <option class="dag">29</option>
                                    <option class="dag">30</option>
                                    <option class="dag">31</option>
                                </select>
                                <select name="emilioricardojuarezfaggot">
                                    <option class="maand">01</option>
                                    <option class="maand">02</option>
                                    <option class="maand">03</option>
                                    <option class="maand">04</option>
                                    <option class="maand">05</option>
                                    <option class="maand">06</option>
                                    <option class="maand">07</option>
                                    <option class="maand">08</option>
                                    <option class="maand">09</option>
                                    <option class="maand">10</option>
                                    <option class="maand">11</option>
                                    <option class="maand">12</option>
                                </select>
                                <select name="kontpak">
                                    <option class="jaar">2000</option>
                                    <option class="jaar">1999</option>
                                    <option class="jaar">1998</option>
                                    <option class="jaar">1997</option>
                                    <option class="jaar">1996</option>
                                    <option class="jaar">1995</option>
                                    <option class="jaar">1994</option>
                                    <option class="jaar">1993</option>
                                    <option class="jaar">1992</option>
                                    <option class="jaar">1991</option>
                                    <option class="jaar">1990</option>
                                </select></td>
                            </tr>
                        </table>
                                <input type="submit" name="Wijzig" formaction="changestudent.jsp">
                        </form>
                                
                        <form>
                        <table>
                            <tr class="head">
                                <td>Spelers Nummer</td>
                                <td>Naam vd. Speler</td>
                            </tr>

                        <%
                            ArrayList<Teamspeler> arylist = new ArrayList();
                            arylist = tmsplrlst.formatBySpeler(stdt.getVariable("spelerscode"));
                            
                            for(Teamspeler tmsplr : arylist){
                        %>
                            <tr>
                                <td><%
                                    for(Team tm : tmlst.list){
                                        if(tm.getVariable("teamcode").equals(tmsplr.getVariable("teamcode"))){
                                            out.print(tm.getVariable("teamcode"));
                                        }
                                    }
                                %></td>
                                <td><%
                                    for(Team tm : tmlst.list){
                                        if(tm.getVariable("teamcode").equals(tmsplr.getVariable("teamcode"))){
                                            out.print(tm.getVariable("teamomschrijving"));
                                        }
                                    }
                                %></td>
                            </tr>

                        <%
                            }
                        %>

                        </table>
                   </form>
                    <%
                }
            }
            if(!studentFound){
            %>
                    
                <h2>Student kon niet gevonden worden.</h2>
                    
            <%
            }
        %>
        </div>
    </body>
</html>
