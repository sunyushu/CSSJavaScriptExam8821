<!DOCTYPE html>
<html lang="en">
<head>
<%@page import="com.hand.sql.SqlQuery"%>
<%@page import="com.hand.sql.MysqlConnection"%>
<%@page import="java.sql.*"%>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/local.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!-- you need to include the shieldui css and js assets in order for the charts to work -->
    <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/shieldui-all.min.css" />
    <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
    <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>

<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    Connection conn;
    int count=0;
	conn = MysqlConnection.getConnection();
	ResultSet rs=SqlQuery.select(conn,name,password);
%>


</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">            
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Admin Panel</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active"><a href="index.html"><i class="fa fa-bullseye"></i> 应用设置</a></li>
                    <li><a href="#"><i class="fa fa-tasks"></i>  管理设置</a></li> 
                    <li><a href="#"><i class="fa fa-tasks"></i>  数据配置</a></li>   
                    <li><a href="#"><i class="fa fa-tasks"></i>  主面板管理</a></li>   
                    <li><a href="#"><i class="fa fa-tasks"></i>  客户订单管理</a></li>                                     
                     <li><a href="#"><i class="fa fa-tasks"></i>  发货订单管理</a></li>                 
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
                    <li class="dropdown messages-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Messages <span class="badge">2</span> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">2 New Messages</li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="#">Go to Inbox <span class="badge">2</span></a></li>
                        </ul>
                    </li>
                    <li class="dropdown user-dropdown">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> EXITS<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="login.jsp"><i class="fa fa-user"></i> exits</a></li>
                       </ul>
                   </li>
                </ul>
            </div>
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">创建Customer</h1>
                     <table style="width: 90%;height: auto;text-align: center;margin: auto;" border="1px">
    <th>基本信息</th>
    <tr>
        <td></td>
        <td>
    </tr>
    
</table>
<div class="row">
    <div class="pushright">
        <ul class="pagination">
  <li><a href="#">&laquo;</a></li>
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li>
</ul>
</div>
    </div>
                </div>
            </div>
            <div class="row"></div>
            <div class="row"></div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>客户列表</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-grid1"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!--
        This section initializes the chart widgets and a grid component, 
        which visualize records and allow sorting and paging. 
        For more information visit: 
        http://www.shieldui.com/documentation/javascript.chart/getting.started
        http://www.shieldui.com/documentation/grid/javascript/getting.started
        http://www.shieldui.com/documentation/datasource/javascript/getting.started
    -->
    <script type="text/javascript">
        jQuery(function ($) {
            var performance = [12, 43, 34, 22, 12, 33, 4, 17, 22, 34, 54, 67],
                visits = [123, 323, 443, 32],
                budget = [23, 19, 11, 134, 242, 352, 435, 22, 637, 445, 555, 57],
                sales = [11, 9, 31, 34, 42, 52, 35, 22, 37, 45, 55, 57];

            $("#shieldui-chart1").shieldChart({
                primaryHeader: {
                    text: "Visitors"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                dataSeries: [{
                    seriesType: "area",
                    collectionAlias: "Q Data",
                    data: performance
                }]
            });

            $("#shieldui-chart2").shieldChart({
                primaryHeader: {
                    text: "Logins Per week"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                seriesSettings: {
                    donut: {
                        enablePointSelection: true
                    }
                },
                dataSeries: [{
                    seriesType: "donut",
                    collectionAlias: "logins",
                    data: visits
                }]
            });

            $("#shieldui-chart3").shieldChart({
                primaryHeader: {
                    text: "Budget"
                },
                dataSeries: [{
                    seriesType: "line",
                    collectionAlias: "Budget",
                    data: budget
                }]
            });

            $("#shieldui-chart4").shieldChart({
                primaryHeader: {
                    text: "Sales"
                },
                dataSeries: [{
                    seriesType: "bar",
                    collectionAlias: "sales",
                    data: sales
                }]
            });

            $("#shieldui-grid1").shieldGrid({
                dataSource: {
                    data: gridData
                },
                sorting: {
                    multiple: true
                },
                paging: {
                    pageSize: 12,
                    pageLinksCount: 4
                },
                selection: {
                    type: "row",
                    multiple: true,
                    toggle: false
                },
                columns: [
                    { field: "id", width: "70px", title: "ID" },
                    { field: "name", title: "Person Name" },
                    { field: "company", title: "Company Name" },
                    { field: "email", title: "Email Address", width: "270px" }
                ]
            });
        });
    </script>
</body>
</html>
