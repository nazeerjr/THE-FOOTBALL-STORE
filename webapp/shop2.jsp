<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
    String imageName = request.getParameter("photo");
    String cid = request.getParameter("cid");

    // Variable to store the total quantity in the cart
    int totalQuantity = 0;

    try {
        // Your database connection code
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "Lali@1234");

        // Query to retrieve the cart items for the user
        PreparedStatement cartStmt = con.prepareStatement("SELECT SUM(quantity) AS totalQuantity FROM Cart WHERE cid = ?");
        cartStmt.setString(1, cid);
        ResultSet cartRs = cartStmt.executeQuery();
        if (cartRs.next()) {
            totalQuantity = cartRs.getInt("totalQuantity");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Products</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="index.js" defer></script>
  <style>
        body {
            position: static;
        }

        .container {
            display: flex;
            justify-content: center;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 70%;
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

        /* Styling for the cart icon */
        .cart-icon {
            position: fixed;
            top: 80px; /* Adjust the top position as needed */
            right: 20px;
            background-color: #007bff;
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 1000; /* Ensure the cart icon is above other elements */
        }

        .cart-icon img {
            width: 100%;
            border-radius: 50%;
        }

        .cart-icon .cart-item-count {
            position: absolute;
            top: 0;
            right: 0;
            background-color: red;
            color: white;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            font-size: 12px;
            line-height: 20px;
            text-align: center;
        }
    </style>

</head>
<body>
<header class="p-3 bg-black text-white">
    <div class="container ">

        <div class="d-flex flex-wrap align-items-left justify-content-between justify-content-lg-start">


            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="userhome.jsp?photo=<%=imageName%>&cid=<%=cid %>"class="nav-link px-2 text-white">Home</a></li>
                <li><a href="shop2.jsp?photo=<%=imageName%>&cid=<%=cid %>" class="nav-link px-2 text-white">View All Products</a></li>
                <li><a href="buyProducts.jsp?photo=<%=imageName%>&cid=<%=cid %>" class="nav-link px-2 text-white" style="margin-right: 200px;">Buy Products</a></li>
            </ul>

            <div class="text-end">
                <a href="#" type="button"  class="btn btn-outline-primary me-2" >
                    <%
                        if(imageName!=null){
                    %>
                    <img style="width:50px; height:50px; border-radius:50%;" src="img/dynamic/<%= imageName%>"/>
                    <%
                        } else {
                    %>
                    No photo available
                    <%
                        }
                    %>
                </a>
            </div>

            <div class="text-end">
                <a href="logout.jsp">logout</a>
            </div>
        </div>
    </div>
</header>

<div class="dark-mode-toggle">
    <label class="switch">
        <input type="checkbox" id="theme-toggle">
        <span class="slider"></span>
    </label>
</div>

<div class="bg-light">
	<h3 style=" font-style:italic; text-align:center;" >Products Details  </h3>
</div>
<div class="container">
    
    <table border="1">
        <tr>
            <th>Product Id</th>
            <th>Product Name</th>
            <th>Product Price</th>
           
            <th>Product Image</th>
            <th>Add to Cart</th>
        </tr>
        <%
            try {
                // Your database connection code
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "Lali@1234");

                // Query to retrieve products
                PreparedStatement pstmt = con.prepareStatement("SELECT pid, pname, pprice, photo FROM products");
                ResultSet rs = pstmt.executeQuery();

                // Loop through products
                while (rs.next()) {
                    String pid = rs.getString("pid");
                    String pname = rs.getString("pname");
                    String pprice = rs.getString("pprice");
                   
                    byte[] photoBytes = rs.getBytes("photo");

                    // Query to retrieve cart items for this product
                    PreparedStatement cartStmt = con.prepareStatement("SELECT quantity FROM Cart WHERE cid = ? AND pid = ?");
                    cartStmt.setString(1, cid);
                    cartStmt.setString(2, pid);
                    ResultSet cartRs = cartStmt.executeQuery();
                    String quantity = "0";
                    if (cartRs.next()) {
                        quantity = cartRs.getString("quantity");
                    }
        %>
        <tr>
            <td><%= pid %></td>
            <td><%= pname %></td>
            <td><%= pprice %></td>
           
            <td><img style="width:100px; height:100px; border-radius:50%;" src="data:image/jpeg;base64,<%= org.apache.tomcat.util.codec.binary.Base64.encodeBase64String(photoBytes) %>"/></td>
            <td>
                <!-- Plus and minus buttons -->
                
				<form action="shop3.jsp?cid=<%=cid %>&pid=<%=pid %>&photo=<%=imageName%>" method="post">
				    <input type="hidden" name="pid" value="<%= pid %>">
				    <button type="submit">+</button>
				</form>
				<span ><%= quantity %></span>
				<form action="shop4.jsp?cid=<%=cid %>&pid=<%=pid %>&photo=<%=imageName%>" method="post">
				    <input type="hidden" name="pid" value="<%= pid %>">
				    <button type="submit">-</button>
				</form>
              
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</div>

<!-- Cart icon -->
<a href="viewCart.jsp?cid=<%= cid %>&photo=<%=imageName%>">
<div class="cart-icon">
    <img src="img/cart_icon.png" alt="Cart">
    <span class="cart-item-count"><%= totalQuantity %></span>
</div>
</a>

<!-- Your JavaScript code -->
<script>
   
  
</script>

</body>
</html>