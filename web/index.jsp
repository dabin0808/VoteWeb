<%@page import="jdbc.User"%>
<%@page import="jdbc.UserVote"%>
<%@page import="jdbc.Vote"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>投票系统</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <script type="text/javascript">
        	window.onload=function(){
        		var search=document.getElementById('search');
        		var s=document.getElementById('sea');
        		s.onclick=function(){
        			if(search.value==""){
        				alert("请输入关键字");
                                        return false;
        			}
        		}
        	}
        </script>
    </head>
    <body>
        <div class="col-sm-offset-3">
            <h1 class="col-sm-offset-3">在线投票网站</h1>
            <a href="register.jsp" >注册</a>
            <a href="login.jsp" >登录</a>
            <br><br>
            <form class="form-horizontal" action="searchvote.jsp" method="get">
                <div class="form-group">
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="search" id="search" placeholder="请输入关键字">
                    </div>
                </div>
                <div class="form-group">
                    <div class=" col-sm-2">
                        <button type="submit" class="btn btn btn-info">搜索</button>
                    </div>
                </div>
            </form>
            <br>
            <h2>以下主题投票：</h2>
            <%
                Vote vdb = new Vote();
                UserVote uvdb = new UserVote();
                User udb = new User();
                request.setCharacterEncoding("UTF-8");
                ResultSet rs = vdb.getallvote();
                while (rs.next()) {
            %>
            <h3>投票主题：<%= rs.getString("vote_name")%></h3>
            截止到：<%= rs.getString("vote_deadline")%>
            <ul> 
                <%
                    if (rs.getString("vote_cancel").equals("true")) {
                %>
                <li><a href="vote.jsp?name=<%= rs.getString("vote_name")%>">进入投票</a></li> 
                    <%
                    } else {
                    %>
                <li>投票已结束</li>
                    <%
                        }
                    %>
                <li><a href="lookvote.jsp?votename=<%= rs.getString("vote_name")%>">查看票数</a></li>
            </ul>
            <%
                }
            %>
        </div>
    </body>
</html>
