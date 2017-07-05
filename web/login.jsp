<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>投票系统登录</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container">
            <br>
            <div class=" col-sm-offset-2"><a href="index.jsp">返回首页</a> </div>
            <br>
            <form class="form-horizontal" action="user.jsp" method="get">
                <div class="form-group">
                    <label for="user" class="col-sm-2 control-label">帐号</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="user" id="user" placeholder="帐号">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" name="password" id="password" placeholder="密码">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn btn-info">登录</button>
                    </div>
                </div>
            </form>
        </div>
        <script type="text/javascript">
        	window.onload=function(){
        		var u=document.getElementById('user');
        		var psw=document.getElementById('password');
        		var lo=document.getElementById('login');
        		lo.onclick=function(){
        			if(u.value==""||psw.value==""){
        				alert("请输入账号或密码");
                                        return false;
        			}
        		}
        	}
        </script>
    </body>
</html>
