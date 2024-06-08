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
String firstname = request.getParameter("fn");
String lastname = request.getParameter("ln");
String username = request.getParameter("un");
String email = request.getParameter("email");
String password = request.getParameter("password");
String conpassword = request.getParameter("confirmPassword");
String mobilenumber = request.getParameter("ph");
String address = request.getParameter("add");
String photo = request.getParameter("photo");
String role = request.getParameter("role");
String name = firstname + " " + lastname;

File file =new File(photo); 
FileInputStream fis=new FileInputStream(file); 

try {
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");

   PreparedStatement stmt;
   int userId = -1; // Default value for user id
   
   if (role.equals("user")) {
       // Insert into customers table
       stmt = con.prepareStatement("INSERT INTO customers (firstname, lastname, username,cname, email, password,mobilenumber, address, role, photo) VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
       stmt.setString(1, firstname);
       stmt.setString(2, lastname);
       stmt.setString(3, username);
       stmt.setString(4, name);
       stmt.setString(5, email);
       stmt.setString(6, password);
       stmt.setString(7, mobilenumber);
       stmt.setString(8, address);
       stmt.setString(9, role);
       
       stmt.setBinaryStream(10, fis); 
       
       int count = stmt.executeUpdate(); 
       if (count > 0) {
           out.println("<center>");
           out.println("<body bgcolor='lightorange'>");
           out.println("<h1>Record inserted successfully</h1>");
           out.println("<br><br>");
           out.println("<a href='login.jsp'><button type='button' class='btn btn-success'><b>Login</b></button></a>");
           out.println("</center>");
       } else {
           out.println("Record insertion failed");
       }
   } else {
	   Class.forName("com.mysql.cj.jdbc.Driver");
	   Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");

       // Insert into signup table
       stmt = con1.prepareStatement("INSERT INTO signup (firstname, lastname, username, email, password, conpassword, mobilenumber, address, photo, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
       stmt.setString(1, firstname);
       stmt.setString(2, lastname);
       stmt.setString(3, username);
       stmt.setString(4, email);
       stmt.setString(5, password);
       stmt.setString(6, conpassword);
       stmt.setString(7, mobilenumber);
       stmt.setString(8, address);
       stmt.setBinaryStream(9, fis); 
       stmt.setString(10, role);

       int count = stmt.executeUpdate();
       if (count > 0) {
           out.println("<center>");
           out.println("<body bgcolor='lightorange'>");
           out.println("<h1>Record inserted successfully</h1>");
           out.println("<br><br>");
           out.println("<a href='login.jsp'><button type='button' class='btn btn-success'><b>Login</b></button></a>");
           out.println("</center>");
       } else {
           out.println("Record insertion failed");
       }
   }

   con.close();
} catch (Exception ex) {
   out.println("An error occurred: " + ex.getMessage());
}
%>
