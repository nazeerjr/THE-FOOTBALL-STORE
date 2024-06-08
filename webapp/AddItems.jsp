<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="jakarta.servlet.annotation.MultipartConfig" %>
<%@ page import="jakarta.servlet.annotation.WebServlet" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse"%>

<% 
String name = request.getParameter("name");

String productid = request.getParameter("pid");
String productname = request.getParameter("pname");
String price = request.getParameter("pprice");
String photo = request.getParameter("photo");

File file = new File(photo); 
FileInputStream fis = new FileInputStream(file); 

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");
    PreparedStatement stmt = con.prepareStatement("insert into products (pid, pname, pprice, photo) VALUES (?, ?, ?, ?)");
    stmt.setString(1, productid);
    stmt.setString(2, productname);
    stmt.setString(3, price);
    stmt.setBinaryStream(4, fis); 

    int count = stmt.executeUpdate(); 

    if (count > 0) { 
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Product Added Successfully</title>");
        out.println("</head>");
        out.println("<body bgcolor='silver'>");
        out.println("<center>");
        out.println("<h1>Product Added successfully</h1>");
        out.println("<br><br>");
        out.println("<a href='addp.jsp?name=" + name + "'><button type='button' class='btn btn-success'><b>Back</b></button></a>");
        out.println("</center>");
        out.println("</body>");
        out.println("</html>");
    } else {
        out.println("Record insertion failed");
    }
    con.close();
} catch (Exception ex) {
    out.println("An error occurred: " + ex.getMessage());
}
%>