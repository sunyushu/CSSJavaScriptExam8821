<%@page import="com.hand.sql.SqlQuery"%>
<%@page import="java.sql.*"%>
<%@page import="com.hand.sql.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete</title>

<%
    Connection conn;
	conn = MysqlConnection.getConnection();
	String line=request.getParameter("customer_id");
	ResultSet rs=SqlQuery.selectWithParam(conn,line);
	session.setAttribute("line", line);
%>


</head>
<body>
    <form action="deleteAction" method="post">
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
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getString(4) %></td>
         <td><%=rs.getInt(5) %></td>
         <td><%=rs.getString(6) %></td>
        <td><input type="submit" value="删除"></td> 
    </tr>
    <%} %>
</table>
    </form>
</body>
</html>