<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

String uid = request.getParameter("uid");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="index.js" defer></script>
    
<style type="text/css">
        <style type="text/css">
     body {
    position: relative;}
    
       table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            background-color: whitesmoke;
            color:black;
        }

        th {
            background-color: whitesmoke;
            color:black; /* Default background color for light mode */
        }

        /* Dark mode styles */
        @media (prefers-color-scheme: dark) {
            th {
                background-color: whitesmoke; /* Background color for dark mode */
                color: black; /* Text color for dark mode */
            }
            td {
                border-bottom-color: #555;

            }
        }

        /* Hover effect */
        tr:hover {
            background-color:whitesmoke  ;
            color:black;/* Lighter background color on hover */
        }

        /* Styling for the image */
        img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

    
    </style>
</head>
<body>

<section id="navbar">
    <header class="p-3 bg-black text-white">
        <div class="container ">
            <div class="d-flex flex-wrap align-items-left justify-content-between justify-content-lg-start">
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="userhome.jsp?uid=<%= uid%>"class="nav-link px-2 text-white">Home</a></li>
                    <li><a href="viewProducts.jsp?uid=<%= uid%>" class="nav-link px-2 text-white">View All Products</a></li>
                    <li><a href="viewCart.jsp?uid=<%= uid%>" class="nav-link px-2 text-white" style="margin-right: 200px;">Buy Products</a></li>
                </ul>

                
				<div class="text-end">
				          <a href="logout.jsp" class="btn btn-secondary">logout</a>
				</div>
            </div>
        </div>
    </header>
</section>


<div class="container mt-5">
    <div class="row">
        <div class="col">
            <div class="bg-light p-3 mb-3">
                <h1 class="text-center">Order Confirmation</h1>
            </div>
            
            <!-- Product Details Table -->
            <div class="bg-light p-3 mb-3">
                <h2 class="text-center">Product Details</h2>
                <table class="">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Photo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");

                            PreparedStatement pstmt = con.prepareStatement("SELECT p.pname, p.pprice, c.quantity, p.photo FROM products p INNER JOIN cart c ON p.pid = c.pid WHERE c.cid = ? AND c.quantity > 0");
                            pstmt.setString(1, uid);
                            ResultSet rs = pstmt.executeQuery();

                            while (rs.next()) { 
                                int quantity = rs.getInt("quantity");
                                if (quantity > 0) {
                        %>
                        <tr>
                            <td><%= rs.getString("pname") %></td>
                            <td><%= rs.getString("pprice") %></td>
                            <td><%= quantity %></td>
                            <td><img src="data:image/jpeg;base64,<%= org.apache.tomcat.util.codec.binary.Base64.encodeBase64String(rs.getBytes("photo")) %>" alt="Product Photo" style="width: 100px; height: 100px;"></td>
                        </tr>
                        <% 
                                }
                            }
                        } catch (SQLException | ClassNotFoundException ex) {
                            ex.printStackTrace();
                        }
                        %>
                    </tbody>
                </table>
            </div>
            
            <!-- Order Confirmation Form -->
            <div class="bg-light p-3 mb-3">
                <form action="confirm" method="post">
                    <input type="hidden" name="uid" value="<%= uid %>">
                
                    <% 
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");

                        PreparedStatement pstmt = con.prepareStatement("SELECT pname, pprice FROM products p INNER JOIN cart c ON p.pid = c.pid WHERE c.cid = ? AND c.quantity > 0");
                        pstmt.setString(1, uid);
                        ResultSet rs = pstmt.executeQuery();

                        while (rs.next()) { 
                    %>
                    <input type="hidden" name="productName[]" value="<%= rs.getString("pname") %>">
                    <input type="hidden" name="productPrice[]" value="<%= rs.getString("pprice") %>">
                    <% 
                        }
                    } catch (SQLException | ClassNotFoundException ex) {
                        ex.printStackTrace();
                    }
                    %>
                    <div align="center">
                    <button type="submit" class="btn btn-success">Confirm Order</button>
                	</div>
                </form>
            </div>
        </div>
    </div>
</div>


<%
try {
    // Re-establish database connection if needed
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");

    // Query to retrieve shipping information for the user
    PreparedStatement pstmt1 = con.prepareStatement("SELECT * FROM shipping_address WHERE cid = ?");
    pstmt1.setString(1, uid); // Replace userId with actual user id
    ResultSet shippingRs = pstmt1.executeQuery();

    if (shippingRs.next()) {
%>
<div class="bg-light p-3 mb-3">
    <h2 class="text-center">
        <button class="btn btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#shippingInfoCollapse" aria-expanded="false" aria-controls="shippingInfoCollapse">
           Click Here To View Shipping Information
        </button>
    </h2>
    <div class="collapse" id="shippingInfoCollapse">
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th>Address</th>
                    <td><%= shippingRs.getString("address") %></td>
                </tr>
                <tr>
                    <th>City</th>
                    <td><%= shippingRs.getString("city") %></td>
                </tr>
                <tr>
                    <th>State</th>
                    <td><%= shippingRs.getString("state") %></td>
                </tr>
                <tr>
                    <th>Zip Code</th>
                    <td><%= shippingRs.getString("zipcode") %></td>
                </tr>
                <tr>
                    <th>Payment Method</th>
                    <td><%= shippingRs.getString("payment_method") %></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<%
    } else {
%>
<p>No shipping information found.</p>
<%
    }
} catch (SQLException ex) {
    ex.printStackTrace();
    // Handle database errors
}
%>

</body>
</html>
