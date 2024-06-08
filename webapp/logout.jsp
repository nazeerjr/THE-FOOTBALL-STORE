

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>
    <head>
    <title>My starting page</title>
    <%response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);%>
    </head>
    <body>
    <%
    response.sendRedirect("login.jsp");
    %>
    This is my JSP page. <br>
    <input type='button' value='Log out' onClick="javascript:location.href = 'logout.jsp'"/>
    </body>
    </html> 







