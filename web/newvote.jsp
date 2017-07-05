<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>投票系统</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container">
            <br> 
            <form class="form-horizontal" action="newvoteServlet" method="get">
                <div class="form-group">
                    <label for="vote_name" class="col-sm-2 control-label">请输入投票主题</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="vote_name" id="vote_name" placeholder="请输入投票主题">
                    </div>
                </div>
                <div class="radio col-sm-offset-2  ">
                    <label>
                        <input type="radio" name="select" value="single" checked>
                        单选投票
                    </label>
                </div>
                <div class="radio col-sm-offset-2  ">
                    <label>
                        <input type="radio" name="select" value="multi">
                        多选投票
                    </label>
                </div><br>
                <div class=" col-sm-offset-2">请输入投票选项：</div>
                <br>
                <div class="form-group">
                    <label for="e1" class="col-sm-2 control-label">选项1</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="e1" id="e1" placeholder="选项1">
                    </div>
                </div>
                <div class="form-group">
                    <label for="e2" class="col-sm-2 control-label">选项2</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="e2" id="e2" placeholder="选项2">
                    </div>
                </div>
                <div class="form-group">
                    <label for="e3" class="col-sm-2 control-label">选项3</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="e3" id="e3" placeholder="选项3">
                    </div>
                </div><br>
                <div class=" col-sm-offset-2">截至时间：</div><br>
                <div class="form-group">
                    <label for="year" class="col-sm-2 control-label"> </label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="year" id="year" placeholder="年">
                    </div>
                </div>
                <div class="form-group">
                    <label for="month" class="col-sm-2 control-label"> </label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="month" id="month" placeholder="月">
                    </div>
                </div>
                <div class="form-group">
                    <label for="day" class="col-sm-2 control-label"> </label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="day" id="day" placeholder="日">
                    </div>
                </div>
                <input type="hidden" name="user" value="<%= request.getParameter("newvote")%>">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn btn-info">发起投票</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
