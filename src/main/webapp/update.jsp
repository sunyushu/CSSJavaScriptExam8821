<%@page import="com.hand.sql.SqlQuery"%>
<%@page import="java.sql.*"%>
<%@page import="com.hand.sql.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>update</title>

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
    Connection conn;
	conn = MysqlConnection.getConnection();
	String line=request.getParameter("line");
	ResultSet rs=SqlQuery.selectWithParam(conn,line);
%>


</head>
<body>
    <form action="updateAction" method="post">
        <table style="width: 90%;height: auto;text-align: center;margin: auto;" border="1px">
    <tr>
        <td style="width: 10%">first_name</td>
        <td style="width: 10%">last_name</td>
        <td style="width: 20%">address_id</td>
        <td style="width: 20%">email</td>
        <td style="width: 5%">customer_id</td>
         <td style="width: 10%">last_update</td>
    </tr>
    <%while(rs.next()){ %>
    <tr>
        <td><input type="text" value="<%=rs.getInt(1) %>" name="first_name"></td>
        <td><input type="text" value="<%=rs.getString(2) %>" name="last_name"></td>
        <td><input type="text" value="<%=rs.getString(3) %>" name="address_id"></td>
        <td><input type="text" value="<%=rs.getString(4) %>" name="email"></td>
        <td><input type="text" value="<%=rs.getString(5) %>" name="customer_id"></td>
        <td><input type="text" value="<%=rs.getString(6) %>" name="last_update"></td>
        <td><input type="submit" value="更新"></td> 
    </tr>
    <%} %>
</table>
    </form>
</body>
</html>