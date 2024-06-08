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
String id=request.getParameter("cid");
int num=Integer.parseInt(id);

String name = request.getParameter("cname");
String email = request.getParameter("email");
String password = request.getParameter("password");

String p1=request.getParameter("cprice");
int price=Integer.parseInt(p1);
String ordername = request.getParameter("corder");
String photo = request.getParameter("photo");
String role = request.getParameter("role");



 File file =new File(photo); 
  	
	/* System.out.println(file.getAbsolutePath()); 
	 */
	 FileInputStream fis=new FileInputStream(file); 
	 
	 try {
		   Class.forName("com.mysql.cj.jdbc.Driver");
		   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "Lali@1234");

		   PreparedStatement stmt;
		   
		   if (role.equals("user")) {
		       // Insert into customers table
		       stmt = con.prepareStatement("INSERT INTO customers (cid, cname, email, password, cprice, corder, photo) VALUES (?, ?, ?, ?, ?, ?, ?)");
		       stmt.setInt(1, num);
		       stmt.setString(2, name);
		       stmt.setString(3, email);
		       stmt.setString(4, password);
		       stmt.setInt(5, price);
		       stmt.setString(6, ordername);
		       stmt.setBinaryStream(7, fis); 
		   } else {
		       // Insert into signup table
		       stmt = con.prepareStatement("INSERT INTO signup (cid, firstname, lastname, username, email, password, conpassword, mobilenumber, address, photo, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		       stmt.setInt(1, num);
		       stmt.setString(2, name); // Assuming firstname and lastname are extracted from cname
		       stmt.setString(3, ""); // No lastname for signup users
		       stmt.setString(4, ""); // No username for signup users
		       stmt.setString(5, email);
		       stmt.setString(6, password);
		       stmt.setString(7, password); // Assuming conpassword is the same as password for signup users
		       stmt.setString(8, ""); // No mobilenumber for signup users
		       stmt.setString(9, ""); // No address for signup users
		       stmt.setBinaryStream(10, fis); 
		       stmt.setString(11, role);
		   }

		   int count = stmt.executeUpdate(); 

		   if (count > 0) { 
		       out.println("<center>");
		       out.println("<body bgcolor='lightorange'>");
		       out.println("<h1>One record inserted successfully</h1>"); 
		       out.println("<br><br>");
		       if (role.equals("user")) {
		           %> 
		           <a href='userhome.jsp?uid=<%=id %>'><button type='button' class='btn btn-success'><b>Retrieve Data</b></button></a>
		           <% 
		       } else {
		           %> 
		           <a href='login.jsp'><button type='button' class='btn btn-success'><b>Login</b></button></a>
		           <% 
		       }
		       out.println("<body>");
		       out.println("</center>");
		   } else {
		      out.println("Record insertion failed");
		   }

		   con.close();
		} catch (Exception ex) {
		   out.println("An error occurred: " + ex.getMessage());
		}
		%>