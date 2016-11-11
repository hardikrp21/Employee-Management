<%-- 
    Document   : deleteemp
    Created on : Oct 29, 2013, 6:19:20 AM
    Author     : chetan
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
          <form name="f1" method="post" action="deleteemp.jsp">





        <%
        ResultSet rs=null;
        String t1="",t2="",t3="",t4="",t5="";
        int t6=0;
        Connection con;
String q;
try
{



    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     con =DriverManager.getConnection("jdbc:odbc:acc2");

    t6=Integer.parseInt(request.getParameter("flag"));
    //out.println(t6);

    if(t6==5)
        {



Statement stmt=con.createStatement();

String value=request.getParameter("empid");
int fn=Integer.parseInt(value.trim());




q="select * from employee where empid="+fn;
 rs=stmt.executeQuery(q);
 if(rs.next())
     {
     out.println("searching<BR>");
     t1=rs.getString(2);
     t2=rs.getString(3);
     t3=rs.getString(4);
     t4=rs.getString(5);
     t5=String.valueOf(rs.getInt(1));
     }
 else
     out.println("record not found<br>");
}

else if(t6==6)
    {
    //out.println("record deleted<BR>");
    Statement stmt=con.createStatement();
 rs=stmt.executeQuery("select * from employee");
String empid=request.getParameter("empid");
int m=Integer.parseInt(empid);

rs=stmt.executeQuery("select * from employee where empid=" + m);
if(rs.next())
{

q="delete from employee where empid=" + m;
stmt.executeUpdate(q);
t1=t2=t3=t4=t5="";
}

out.println("record deleted");
    }
    }
catch(Exception e)
        {
    //out.println(e.getMessage());
    }

%>
<table>
<tr>
<td>Employee ID
<td><input type="text" name="empid" value=<%= t5 %>>
<td> <input type="submit" name="search" value="search" onclick="document.f1.flag.value=5"></td>
<tr>
<td>Employee NAME
<td><input type="text" name="empname" value=<%= t1 %>>
<tr>
<td>Employee DISIGNATION
<td><input type="text" name="emp_desig" value=<%= t2 %>>
<tr>
<td>Employee JOIN DATE
<td><input type="text" name="emp_j_date" value=<%= t3 %>>
<tr>
<td>Employee SALARY
<td><input type="text" name="emp_salary" value=<%= t4 %>>
<tr>
<td colspan=3>
    <input type="submit" name="delete" value="delete" onclick="document.f1.flag.value=6">
</td>
</tr>
</table>
<input type="hidden" name="flag" value="">
          </form>




    </body>
</html>
