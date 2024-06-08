<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Userdata</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: orange;
        }
        .table {
            background-color: lightblue;
        }
    </style>
</head>
<body>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (email != null && password != null) {
        InputStream photoStream = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");

            PreparedStatement ptst = con.prepareStatement("SELECT * FROM signup WHERE email = ? AND password = ?");
            ptst.setString(1, email);
            ptst.setString(2, password);

            ResultSet rs = ptst.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                String username = rs.getString("username");
                photoStream = rs.getBinaryStream("photo");
                session.setAttribute("photos", photoStream); 
                response.sendRedirect("fetching.jsp?role=" + role + "&img=" + photoStream + "&uid=" + rs.getInt("uid")+"&name=" + username) ;
            } else {
                PreparedStatement ptst1 = con.prepareStatement("SELECT * FROM customers WHERE email = ? AND password = ?");
                ptst1.setString(1, email);
                ptst1.setString(2, password);

                ResultSet rs1 = ptst1.executeQuery();

                if (rs1.next()) {
                    String role = rs1.getString("role");
                    String username = rs1.getString("username");
                    String uid = rs1.getString("cid");
                    photoStream = rs1.getBinaryStream("photo");
                    session.setAttribute("photos", photoStream); 
                    response.sendRedirect("userhome.jsp?role=" + role + "&img=" + photoStream + "&uid=" + uid ) ;
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("window.alert('Login failed. Please check your credentials.');");
                    out.println("window.location.href = 'login.jsp';");
                    out.println("</script>");
                }
                rs1.close();
                ptst1.close();
            }
            rs.close();
            ptst.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            out.println("An error occurred: " + e.getMessage());
        } catch (IOException e) {
            out.println("An error occurred while reading the photo: " + e.getMessage());
        }
    } else {
        out.println("<script type='text/javascript'>");
        out.println("window.alert('Please enter both email and password.');");
        out.println("window.location.href = 'login.jsp';");
        out.println("</script>");
    }
%>

</body>
</html>
