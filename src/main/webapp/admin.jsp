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
                    <li class="active"><a href="index.html"><i class="fa fa-bullseye"></i> customer 管理</a></li>
                    <li><a href="film.jsp"><i class="fa fa-tasks"></i> film 设置</a></li>                                   
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
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> exits<b class="caret"></b></a>
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
                    <h1 class="page-header">客户管理</h1>
                     
                     
                     <!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" 
   data-target="#myModal">
   新建
</button>
<br/>
<br/>
<br/>
<br/>



<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               基本信息
            </h4>
         </div>
         <div class="modal-body">
            <form role="form" class="outline:none" name="myform">
<div class="form-group">
<label for="first_name">first_name</label>
<input type="text" class="form-control" id="first_name" placeholder="Enter first_name" name="first_name">
</div>
<div class="form-group">
<label for="last_name">last_name</label>
<input type="text" class="form-control" id="last_name" placeholder="last_name">
</div>
<div class="form-group">
<label for="email">email</label>
<input type="email" class="form-control" id="email" placeholder="enter your email">
</div>
<div class="form-group">
<label for="address">address</label>
<input type="text" class="form-control" id="address" placeholder="enter your address">
</div>
<div class="modal-footer">
   <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
  </button>
            <button type="button" class="btn btn-primary">
               提交更改
            </button>
</div>
   </form>
   </div>
   </div>                  
                     
                     
                     
                     

                </div>
            </div>
            <div class="container">
            <div class="row"></div>
            <div class="row"></div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>客户列表</h3>
                        </div>
                        <div class="panel-body">
                            <table style="width: 90%;height: auto;text-align: center;margin: auto;" border="1px">
    <tr>
        <td style="width: 10%">first_name</td>
        <td style="width: 10%">last_name</td>
        <td style="width: 20%">address_id</td>
        <td style="width: 20%">email</td>
        <td style="width: 5%">customer_id</td>
         <td style="width: 10%">last_update</td>
    </tr>
    <%while(rs.next()){%>
    <tr>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getString(4) %></td>
         <td><%=rs.getInt(5) %></td>
          <td><%=rs.getString(6) %></td>
        <td>
            <a href="delete.jsp?line=<%=rs.getInt(1)%>">删除</a>
            /
            <a href="update.jsp?line=<%=rs.getInt(1)%>">编辑</a>
        </td>
        
    </tr>
    <%} %>
</table>
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    </div>
    <div class="container">
    <div class="row">
    <div style="float:right;">
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
