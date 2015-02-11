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
        <title>Alle studenten</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@page import="jsp.*"%>
        <% 
            StudentenList stdtlst = new StudentenList();
            int asdf = stdtlst.getStudentenList().size();
        %>
    </head>
    <body>
        <div id="nav">
            <a href="index.html">Home</a>
            <a href="newstudent.html">Nieuwe Student</a>
            <a href="allstudents.jsp" class="selected">Alle Studenten</a>
            <a href="newteam.html">Nieuw Team</a>
            <a href="allteams.jsp">Alle Teams</a>
        </div>
        <div id="content">
            <form action="deletestudent.jsp" method="get">
            <table>
                <tr class='head'>
                    <td>Verwijderen</td>
                    <td>Studenten Nummer</td>
                    <td>Naam v.d. Student</td>
                </tr>

                <%
                    for(int i = 0; i < stdtlst.getStudentenList().size(); i++){
                    %>  <tr>

                            <td id="delete">
                                <input id="deleteBox" type="checkbox" name="delete" value="<%=stdtlst.getStudentenList().get(i).getVariable("spelerscode")%>">
                            </td>
                            <td>
                                <%=stdtlst.getStudentenList().get(i).getVariable("spelersnr")%>
                            </td>
                            <td>
                                <a href="getstudent.jsp?code=<%=stdtlst.getStudentenList().get(i).getVariable("spelerscode")%>">
                                <%=stdtlst.getStudentenList().get(i).getVariable("tussenvoegsels")%> 
                                <%=stdtlst.getStudentenList().get(i).getVariable("achternaam")%>, 
                                <%=stdtlst.getStudentenList().get(i).getVariable("roepnaam")%>
                                </a>
                            </td>
                        </tr><%
                    }
                %>
            </table>

            <input type="submit" value="Verwijderen">
            </form>

            <script>var asdf = <%=stdtlst.aantalStudenten%></script>
            <div><a href="index.html">Ga terug</a></div>
        </div>
    </body>
</html>