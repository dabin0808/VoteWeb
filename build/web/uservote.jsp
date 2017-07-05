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
            <h3>截止时间<%= rs.getString("vote_deadline")%></h3>
            <%= rs.getString("vote_e1")%>(票数为：<%= rs.getInt("vote_n1")%>票)<br>
            <%= rs.getString("vote_e2")%>(票数为：<%= rs.getInt("vote_n2")%>票)<br>
            <%= rs.getString("vote_e3")%>(票数为：<%= rs.getInt("vote_n3")%>票)<br>
            <%
                if (rs.getString("vote_cancel").equals("true")) {
            %>
            <br>
            <form action="canclevoteServlet" method="get">
                <input type="submit" value="截止投票">
                <input type="hidden" name="votename1" value="<%= rs.getString("vote_name")%>"> 
            </form>
            <%} else {%>
            <br>
            <h3>投票已截止</h3>
            <form action="continuevoteServlet" method="get">
                <input type="submit" value="取消禁止投票">
                <input type="hidden" name="votename1" value="<%= rs.getString("vote_name")%>"> 
            </form>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>
