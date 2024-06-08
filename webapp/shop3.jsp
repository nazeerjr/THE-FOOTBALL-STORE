<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
// Get user ID from session attribute
String cid = request.getParameter("cid");

if (cid == null) {
    // Handle case where userId is not available
    // For example, redirect to login page
    response.sendRedirect("login.jsp");
    return; // Stop further execution
}

String pid = request.getParameter("pid");
String imageName = request.getParameter("photo");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "Lali@1234");
    
    // Check if the product is already in the cart for the current user
    PreparedStatement checkStmt = con.prepareStatement("SELECT COUNT(*) AS count FROM Cart WHERE cid = ? AND pid = ?");
    checkStmt.setString(1, cid);
    checkStmt.setString(2, pid);
    ResultSet checkRs = checkStmt.executeQuery();
    checkRs.next();
    int count = checkRs.getInt("count");
    checkStmt.close();
    
    if (count > 0) {
        // Product already exists in the cart, update the quantity
        PreparedStatement updateStmt = con.prepareStatement("UPDATE Cart SET quantity = quantity + 1 WHERE cid = ? AND pid = ?");
        updateStmt.setString(1, cid);
        updateStmt.setString(2, pid);
        updateStmt.executeUpdate();
        updateStmt.close();
    } else {
        // Product does not exist in the cart, insert a new entry
        PreparedStatement insertStmt = con.prepareStatement("INSERT INTO Cart (cid, pid, quantity) VALUES (?, ?, 1)");
        insertStmt.setString(1, cid);
        insertStmt.setString(2, pid);
        insertStmt.executeUpdate();
        insertStmt.close();
    }
    
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}

// Redirect back to the previous page
response.sendRedirect("viewproduct.jsp?photo=" + imageName + "&cid=" + cid);
%>