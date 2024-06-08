<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.ism.DBConnections" %>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Your Shopping Cart</h1>
        <form action="CartServlet">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        conn = DBConnections.getConnection();
                        String query = "SELECT p.id, p.name, p.price, c.quantity FROM products p JOIN cart_items c ON p.id = c.product_id WHERE c.session_id = ?";
                        ps = conn.prepareStatement(query);
                        ps.setString(1, session.getId());
                        rs = ps.executeQuery();
                        boolean cartIsEmpty = true;
                        while (rs.next()) {
                            cartIsEmpty = false;
                            int productId = rs.getInt("id");
                            String productName = rs.getString("name");
                            double price = rs.getDouble("price");
                            int quantity = rs.getInt("quantity");
                            double total = price * quantity;
                %>
                <tr>
                    <td><%= productName %></td>
                    <td>$<%= price %></td>
                    <td><%= quantity %></td>
                    <td>$<%= total %></td>
                    <td>
                        <form action="CartServlet" method="post" style="display:inline;">
                            <input type="hidden" name="productId" value="<%= productId %>">
                            <input type="hidden" name="action" value="add">
                            <button type="submit" class="btn btn-success">+</button>
                        </form>
                        <form action="CartServlet" method="post" style="display:inline;">
                            <input type="hidden" name="productId" value="<%= productId %>">
                            <input type="hidden" name="action" value="remove">
                            <button type="submit" class="btn btn-warning">-</button>
                        </form>
                        <form action="CartServlet" method="post" style="display:inline;">
                            <input type="hidden" name="productId" value="<%= productId %>">
                            <input type="hidden" name="action" value="delete">
                            <button type="submit" class="btn btn-danger">Remove</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                        if (cartIsEmpty) {
                %>
                <tr>
                    <td colspan="5">Your cart is empty.</td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                    }
                %>
            </tbody>
            
        </table>
        
        </form>
        <a href="shop1.jsp" class="btn btn-primary">Continue Shopping</a>
    </div>
</body>
</html>
