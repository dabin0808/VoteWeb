<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.Vote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>投票系统</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="col-sm-offset-4">
            <% Vote vdb = new Vote();
                request.setCharacterEncoding("UTF-8");
                ResultSet rs = vdb.getvoteelement(request.getParameter("name"));
                while (rs.next()) {
            %>
            <h1><%= rs.getString("vote_name")%></h1>
            <h3>截止时间：<%= rs.getString("vote_deadline")%></h3>
            <form action="voteServlet" method="get">
                <%
                    if (rs.getString("vote_select").equals("single")) {
                %>
                <label><input type="radio" name="element" value="e1" ><%= rs.getString("vote_e1")%></label><br>
                <label><input type="radio" name="element" value="e2"><%= rs.getString("vote_e2")%></label><br>
                <label><input type="radio" name="element" value="e3"><%= rs.getString("vote_e3")%></label><br>
                <input type="submit" value="投票">
                <%} else {%>
                <label><input type="checkbox" name="elements" value="e1" ><%= rs.getString("vote_e1")%></label><br>
                <label><input type="checkbox" name="elements" value="e2"><%= rs.getString("vote_e2")%></label><br>
                <label><input type="checkbox" name="elements" value="e3"><%= rs.getString("vote_e3")%></label><br>
                <input type="submit" value="投票">
                <%
                    }
                %>
                <input type="hidden" name="votename" value="<%= rs.getString("vote_name")%>"> 
            </form>
            <%
                }
            %>
        </div>
    </body>
</html>
