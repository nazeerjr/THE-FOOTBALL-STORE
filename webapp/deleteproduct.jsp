<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %> 
<%@page import="java.sql.*"%>

  <% String cname = request.getParameter("name"); %>

<html>
<head>
<title>

</title>
</head></html>
<%
try 
{
String id=request.getParameter("pid");
int num=Integer.parseInt(id);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");
String query = "delete from products where pid="+num;
Statement st = conn.createStatement();
int count=st.executeUpdate(query);
if(count>0)
{
	out.println("one record deleted successfully");
	response.sendRedirect("addp.jsp?name=" + cname);
	
}
else
{
	out.println("record deletion failed");
}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>