<%-- 
    Document   : pro28showtable
    Created on : Jun 5, 2013, 5:10:48 PM
    Author     : kuraangi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
<table border=5><tr><td>
<table cellpadding=10>
<tr bgcolor="limegreen">
<th>Empid<th>Empname<th>emp_desig<th>emp_j_date<th>emp_salary
<%
String q;
try
{

    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection con =DriverManager.getConnection("jdbc:odbc:acc2");
Statement stmt=con.createStatement();



q="select * from employee";




    
    ResultSet rs=stmt.executeQuery(q);

while(rs.next())
{
%>

<tr>
<td><%= rs.getInt(1) %>
<td><%= rs.getString(2) %>
<td><%= rs.getString(3) %>
<td><%= rs.getString(4) %>
<td><%= rs.getString(5) %>
<%
}
rs.close();
stmt.close();
con.close();
}catch(Exception e){ out.println("error found:"+e);}
%>
</table></table>
    </body>
</html>
