<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
</head>
<body>

<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="height: 500px;width: 600px;"></div>
<div id="right" style="height: 400px;width: 400px;margin-left: 600px;margin-top: -500px;"></div>
<script type="text/javascript">
        window.onload=function () {
            var key=[];
            var value=[];
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/second/count2",
                success:function (msg) {
                    for(ff in msg){
                        key.push(ff+'月');
                        value.push(msg[ff]);
                    }
                    // 基于准备好的dom，初始化echarts实例
                    var myChart = echarts.init(document.getElementById('main'));
                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '每个月发布的二手交易信息数量'
                        },
                        tooltip: {},
                        legend: {
                            data:[]
                        },
                        xAxis: {
                            data: key
                        },
                        yAxis: {},
                        series: [{
                            type: 'line',
                            data: value
                        },{
                            type:'bar',
                            data:value
                        }
                        ]
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                }
            });


            var a=[];
            var b=[];
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/second/count2",
                success:function (msg) {
                    for(ff in msg){
                        a.push(ff);
                        b.push(msg[ff]);
                    }
                    // 基于准备好的dom，初始化echarts实例
                    var myChart = echarts.init(document.getElementById('right'));
                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '饼状图分析'
                        },
                        series: [{
                            type:'pie',
                            data:[
                                {value:b[0],name:a[0]+"月"},
                                {value:b[1],name:a[1]+"月"},
                                {value:b[2],name:a[2]+"月"},
                                {value:b[3],name:a[3]+"月"},
                                {value:b[4],name:a[4]+"月"},
                                {value:b[5],name:a[5]+"月"},
                                {value:b[6],name:a[6]+"月"},
                                {value:b[7],name:a[7]+"月"},
                                {value:b[8],name:a[8]+"月"},
                                {value:b[9],name:a[9]+"月"},
                                {value:b[10],name:a[10]+"月"},
                                {value:b[11],name:a[11]+"月"}
                                ]
                        }]
                    }
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                }
            });

    };
</script>
</body>
</html>
