<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
    // Retrieve user ID from request parameter
    String uid = request.getParameter("uid");


    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "root");

        // Query to retrieve cart items for the user
        PreparedStatement pstmt = con.prepareStatement("SELECT p.pname, p.pprice, c.quantity, p.photo FROM products p INNER JOIN cart c ON p.pid = c.pid WHERE c.cid = ? AND c.quantity > 0");
        pstmt.setString(1, uid);
        ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Your Cart</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="index.js" defer></script>
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

      
    </style></head>
<body>
<header class="p-3 container1 text-white">
    <div class="container ">

        <div class="d-flex flex-wrap align-items-left justify-content-between justify-content-lg-start">


             <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="userhome.jsp?uid=<%=uid %>"class="nav-link px-2 text-white">Home</a></li>
                <li><a href="viewProducts.jsp?uid=<%=uid %>" class="nav-link px-2 text-white">View All Products</a></li>
                <li><a href="viewCart.jsp?uid=<%=uid %>" class="nav-link px-2 text-white" style="margin-right: 200px;">Buy Products</a></li>
            </ul>

            <div class="text-end">
                <a href="#" type="button"  class="btn btn-outline-primary me-2" >
                 
                </a>
            </div>

          <div class="text-end">
				          <a href="logout.jsp" class="btn btn-secondary">logout</a>
				</div>
        </div>
    </div>
</header>



<div class="bg-light">
    <h3 style="font-style:italic; text-align:center;">Your Cart</h3>
</div>
<div align="center">
   
    <table border="1">
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Photo</th>
        </tr>
        <% while (rs.next()) { %>
        <% int quantity = rs.getInt("quantity"); %>
        <% if (quantity > 0) { %>
        <tr>
            <td><%= rs.getString("pname") %></td>
            <td><%= rs.getString("pprice") %></td>
            <td><%= quantity %></td>
            <td><img src="data:image/jpeg;base64,<%= org.apache.tomcat.util.codec.binary.Base64.encodeBase64String(rs.getBytes("photo")) %>" alt="Product Photo" style="width: 100px; height: 100px;"></td>
        </tr>
        <% } %>
        <% } %>
    </table>
    <div class="d-flex justify-content-center align-items-center mt-3">
		    <form action="buynow.jsp?uid=<%=uid %>" method="post">
			    <input type="hidden" name="uid" value="<%= uid %>">
			    <button type="submit" class="btn btn-success">Buy Now</button>
			</form>
	</div>
	
	
</div>



</body>
</html>



<%
    // Close database connection
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>