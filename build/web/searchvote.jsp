<%@page import="jdbc.Vote"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>投票系统</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="col-sm-offset-5">
            <br>
            <a href="index.jsp">返回首页</a>
            <br>
            <h2>搜索结果为：</h2><br>
            <%
                Vote vdb = new Vote();
                request.setCharacterEncoding("UTF-8");
                ResultSet rs = vdb.getsearch(request.getParameter("search"));
                while (rs.next()) {
            %>
            <h4><a href="vote.jsp?name=<%= rs.getString("vote_name")%>"><%= rs.getString("vote_name")%></a></h4> <br>
                <%
                    }
                %>
        </div>
    </body>
</html>
