<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="org.apache.commons.codec.binary.Base64, org.apache.commons.io.IOUtils" %>

 <% String name = request.getParameter("name"); %>
<body align="center" bgcolor="violet">
    <table border="" align="center" width="80%" height="300px">
        <%
        try {
            String id = request.getParameter("pid");
            int num = Integer.parseInt(id);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");
            String query = "select * from products where pid=" + num;
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);

            if (rs.next()) {
        %>

        <marquee><h1>Modify the Changes Required to Page!</h1></marquee>
        <form action="UpdateProduct"  method="post" enctype="multipart/form-data">
        <input type="hidden" name="name" value="<%= name %>">
            <tr>
                <b><td>Product Id</td></b>
                <td><input type="text" name="pid" value="<%=rs.getInt("pid")%>"/></td>
            </tr>
            <tr>
                <b><td>Product Name</td></b>
                <td><input type="text" name="pname" value="<%=rs.getString("pname")%>"/></td>
            </tr>
            <tr>
                <b><td>Price</td></b>
                <td><input type="text" name="pprice" value="<%=rs.getString("pprice")%>"/></td>
            </tr>
            <tr>
                <td>Image</td>
                <td><input type="file" name="photo"></td>
            </tr><br>
            </table><br><br>
            
                <td colspan="2" align="center"><input type="Submit" value="submit"></td>
            
        </form>

        <%
            }
        } catch (Exception e) {
            out.println(e);
        }
        %>
   
    
    <h2><a href="addp.jsp?name=<%=name  %>">Redirect to Add Products page</a></h2>
</body>
