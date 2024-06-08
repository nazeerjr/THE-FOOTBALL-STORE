<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.util.*" %>


<%
    // Retrieve form data
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zipcode = request.getParameter("zipcode");
    String paymentMethod = request.getParameter("paymentMethod");
    String cardNumber = request.getParameter("cardNumber");
    String paypalEmail = request.getParameter("paypalEmail");
    String uid = request.getParameter("uid");
    System.out.println(uid);
    
    

    // Assuming you have a database connection established
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Insert shipping address into the database
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");
        String insertQuery = "INSERT INTO shipping_address (cid, address, city, state, zipcode, payment_method, card_number, paypal_email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(insertQuery);
        stmt.setString(1, uid); // Replace userId with actual user id
        stmt.setString(2, address);
        stmt.setString(3, city);
        stmt.setString(4, state);
        stmt.setString(5, zipcode);
        stmt.setString(6, paymentMethod);
        stmt.setString(7, cardNumber);
        stmt.setString(8, paypalEmail);
        stmt.executeUpdate();
        
        // Redirect to order confirmation page
        response.sendRedirect("orderConfirmation.jsp?uid=" + uid);
    } catch (SQLException ex) {
        ex.printStackTrace();
        // Handle database errors
    } finally {
        // Close resources
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>