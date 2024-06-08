<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%

    String uid = request.getParameter("uid"); 

    // Variable to store the total quantity in the cart
    int totalQuantity = 0;

    try {
        // Your database connection code
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");

        // Query to retrieve the cart items for the user
        PreparedStatement cartStmt = con.prepareStatement("SELECT SUM(quantity) AS totalQuantity FROM cart WHERE cid = ?");
        cartStmt.setString(1, uid);
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            text-align: center;
            background-image: url('Images/img4.jpg');
            background-size: cover;
            background-repeat: no-repeat;
        }
        
        table {
        	background-color: cyan;
            margin: auto;
            width: 70%;  
        }
        
        th, td {
            padding: 10px;
            text-align: left;
        }
                 table {
            margin: auto;
          
            width: 70%;  
        }
        th, td {
            padding: 10px;
            
            text-align: left;
        }
        img.photo {
            width: 20%; 
            height: 40%;
            border-radius:50%;
            padding: 10px;
        }
        .actions a {
            text-decoration: none;
            padding: 5px 10px;
         
        }
        
         .head
    {
     text-align:center;
    }
    
    
    
    
    li.nav-link px-2 text-secondary a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}
 
 
 
li.nav-link px-2 text-secondary a.active {
  background-color: #4CAF50;
  color: white;
}

li.nav-link px-2 text-secondary a:hover:not(.active) {
  background-color: #555;
  color: white;
}
  
  li.nav-link px-2 text-secondary a {
    text-align: center;
    float: none;
  }
  
  .container1
  {
    background-color:DarkCyan;
  }
        
        .cart-icon {
            position: fixed;
            top: 80px;
            right: 20px;
            background-color: #007bff;
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 1000;
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
<header class="p-3  text-white container1">
    <div class="container">
        <div class="d-flex flex-wrap align-items-left justify-content-between justify-content-lg-start">
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 " >
                <li><a href="userhome.jsp?uid=<%=uid %>" class="nav-link px-2 text-white">Home</a></li>
                <li><a href="viewProducts.jsp?uid=<%=uid %>" class="nav-link px-2 text-white">View All Products</a></li>
                <li><a href="viewCart.jsp?uid=<%=uid%>" class="nav-link px-2 text-white" style="margin-right: 200px;">View Cart</a></li>
            </ul>

           

            
                    
            <div class="text-end">
                <a href="logout.jsp" class="btn btn-secondary">logout</a>
            </div>
        </div>
    </div>
</header>

<div class="bg-light">
    <h3 style="font-style: italic; text-align: center;">Products Details</h3>
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
        <% try {
            // Your database connection code
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");

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
                PreparedStatement cartStmt = con.prepareStatement("SELECT quantity FROM cart WHERE cid = ? AND pid = ?");
                cartStmt.setString(1, uid);
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
                <div style="display: flex; align-items: center;">
                    <form action="removeFromCart.jsp?uid=<%=uid %>&pid=<%=pid %>" method="post" style="margin-left: 10px;">
                        <input type="hidden" name="pid" value="<%= pid %>">
                        <button type="submit" style="padding: 8px 12px; background-color: #dc3545; color: white; border: none; border-radius: 5px;">-</button>
                    </form>
                    <span style="font-size: 16px; margin: 0 10px;"><%= quantity %></span>
                    <form action="addToCart.jsp?uid=<%=uid %>&pid=<%=pid %>" method="post" style="margin-right: 10px;">
                        <input type="hidden" name="pid" value="<%= pid %>">
                        <button type="submit" style="padding: 8px 12px; background-color: #007bff; color: white; border: none; border-radius: 5px;">+</button>
                    </form>
                </div>
            </td>
        </tr>
        <% }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</div>

<!-- Cart icon -->
<a href="viewCart.jsp?uid=<%= uid %>">
    <div class="cart-icon">
        <img src="Images/icart_icon.jpg" alt="Cart">
        <span class="cart-item-count"><%= totalQuantity %></span>
    </div>
</a>

<!-- Your JavaScript code -->
<script>
    // JavaScript code here
</script>

</body>
</html>
