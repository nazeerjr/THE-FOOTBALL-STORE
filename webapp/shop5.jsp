<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<%@ page import="com.ism.DBConnections" %>
<html>
<head>
    <title>Shop</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="header">
        <h1>Shopping Cart</h1>
        <a href="Cart.jsp"><button class="btn btn-success">View Cart</button></a>
    </div>
    <div class="products-container">
        <div class="products">
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    conn = DBConnections.getConnection();
                    String query = "SELECT id, name, price, photo, rating FROM products";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        int productId = rs.getInt("id");
                        String name = rs.getString("name");
                        double price = rs.getDouble("price");
                        String image = rs.getString("image");
                        int rating = rs.getInt("rating");
            %>
            <div class="product">
                <img src="<%= image %>" alt="Product Image">
                <h2><%= name %></h2>
                <p>$<%= price %></p>
                <div class="stars"><%= "★★★★★".repeat(rating) %></div>
                <form action="CartServlet" method="post">
                    <input type="hidden" name="productId" value="<%= productId %>">
                    <input type="hidden" name="action" value="add">
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
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
        </div>
    </div>
</body>
</html>
