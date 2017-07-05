<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.Vote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>投票系统</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <script type="text/javascript" src='js/echarts.min.js'></script>
    </head>
    <body>
        <div class="col-sm-offset-4">
            <br>
            <a href="index.jsp">返回首页</a>
            <br><br>
            <%
                Vote vdb = new Vote();
                request.setCharacterEncoding("UTF-8");
                String votename = "";
                if (request.getAttribute("votename") != null) {
                    votename = (String) request.getAttribute("votename");
                } else {
                    votename = (String) request.getParameter("votename");
                }
                ResultSet rs = vdb.getvoteelement(votename);
                while (rs.next()) {
            %>

            <div hidden="hidden" id="votename"><%= rs.getString("vote_name")%></div>
            <div hidden="hidden" id="votedeadline"><%= rs.getString("vote_deadline")%></div>
            <div hidden="hidden" id="votel"><%= rs.getString("vote_e1")%></div>
            <div hidden="hidden" id="vote2"><%= rs.getString("vote_e2")%></div>
            <div hidden="hidden" id="vote3"><%= rs.getString("vote_e3")%></div>
            <div hidden="hidden" id="numl"><%= rs.getInt("vote_n1")%></div>
            <div hidden="hidden" id="num2"><%= rs.getInt("vote_n2")%></div>
            <div hidden="hidden" id="num3"><%= rs.getInt("vote_n3")%></div>
            <%}%>
            <div id="chart" style="width:500px;height:500px;"></div>
        </div>

        <script type="text/javascript">
            // 初始化图表标签
            var vname = document.getElementById('votename').innerHTML;
            var vdeadline = document.getElementById('votedeadline').innerHTML;
            var v1 = document.getElementById('votel').innerHTML;
            var v2 = document.getElementById('vote2').innerHTML;
            var v3 = document.getElementById('vote3').innerHTML;
            var n1 = parseInt(document.getElementById('numl').innerHTML);
            var n2 = parseInt(document.getElementById('num2').innerHTML);
            var n3 = parseInt(document.getElementById('num3').innerHTML);

            var myChart = echarts.init(document.getElementById('chart'));
            var options = {
                title: {
                    text: '主题：' + vname,
                    subtext: '截止时间：' + vdeadline,
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: [v1, v2, v3]
                },
                series: [
                    {
                        name: vname,
                        type: 'pie',
                        radius: '70%',
                        center: ['50%', '60%'],
                        data: [
                            {value: n1, name: v1},
                            {value: n2, name: v2},
                            {value: n3, name: v3}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            myChart.setOption(options);
        </script>
    </body>
</html>
