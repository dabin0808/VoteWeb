<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.UserVote"%>
<%@page import="jdbc.User"%>
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
            <%
                User udb = new User();
                UserVote uvdb = new UserVote();
                String user_id = request.getParameter("user");
                if (udb.login(user_id, request.getParameter("password"))) {
            %>
            <a href="index.jsp">注销登陆</a> 
            <h1>欢迎您，<%= udb.getusername(user_id)%></h1>
            <a href="newvote.jsp?newvote=<%= user_id%>">发起一个投票</a><br><br>
            <h3>有以下主题投票：</h3><br>
            <%
                ResultSet rs = uvdb.getuservote(user_id);
                while (rs.next()) {
            %>
            <a href="uservote.jsp?name=<%= rs.getString("vote_name")%>"><%= rs.getString("vote_name")%><br>
                <%
                    }
                } else {
                %>
                <h1>用户不存在</h1>
                <h3>
                    3秒后页面会自动跳转,如果浏览器不支持,请点击<a href="login.jsp">这里</a>跳转
                </h3>
                <%
                    response.setHeader("refresh", "3;URL=login.jsp");
                %>
                <%}%>
        </div>
    </body>
</html>
