<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>投票系统注册</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container">
            <br>
            <div class=" col-sm-offset-2"><a href="index.jsp">返回首页</a> </div>
            <br>
            <form class="form-horizontal" action="RegisterServlet" method="get">
                <div class="form-group">
                    <label for="user" class="col-sm-2 control-label">帐号</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="user" id="user" placeholder="帐号">
                    </div>
                </div>
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="username" id="username" placeholder="用户名">
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
                        <button type="submit" class="btn btn btn-info">注册</button>
                    </div>
                </div>
            </form>
        </div>
         <script type="text/javascript">
        	window.onload=function(){
        		var u=document.getElementById('user');
        		var uname=document.getElementById('username');
        		var psw=document.getElementById('password');
        		var re=document.getElementById('regist');
        		re.onclick=function(){
        			if(u.value==""||uname.value==""||psw.value==""){
        				alert("请输入账号，用户名或密码");
                                        return false;
        			}
        		}
        	}
        </script>
    </body>
</html>
