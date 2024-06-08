<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <head>
    <meta charset="UTF-8">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  
   
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  
    
    
    <title>Order Confirmation - Gifts Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .details {
            margin-bottom: 20px;
        }
        .details label {
            font-weight: bold;
        }
        .button {
            display: block;
            width: 100%;
            padding: 15px;
            background: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            text-align: center;
            font-size: 16px;
            margin-top: 20px;
        }
        .button:hover {
            background: #0056b3;
        }
    </style>
    
    
    <script>
    window.onload = function() {
        // Retrieve total price from hidden input field
        const total = parseFloat(document.getElementById('total').value);
        document.getElementById('totalAmount').innerText = 'Total: $' + total.toFixed(2);
        alert("Your order will be delivered to you in a few days. Thank you for shopping with us!");
    };
    </script>
</head>
<body>
    <div class="container">
        <h2>Order Confirmation</h2>
         <div class="row">
            <div class="col-md-6">
                <h3>Shipping Details</h3>
        <div class="details">
            <p><label>First Name:</label> <%= request.getParameter("firstName") %></p>
            <p><label>Last Name:</label> <%= request.getParameter("lastName") %></p>
            <p><label>Address:</label> <%= request.getParameter("address") %></p>
            <p><label>City:</label> <%= request.getParameter("city") %></p>
            <p><label>State:</label> <%= request.getParameter("state") %></p>
            <p><label>Zip Code:</label> <%= request.getParameter("zip") %></p>
            <p><label>Email:</label> <%= request.getParameter("email") %></p>
            <p><label>Phone:</label> <%= request.getParameter("phone") %></p>
            <p><label>Order Notes:</label> <%= request.getParameter("notes") %></p>
           <%--  <p><label>Product 1 Price:</label> $<%= request.getParameter("price") %></p>
            <p><label>Product 2 Price:</label> $<%= request.getParameter("price") %></p>
            <p><label>Product 3 Price:</label> $<%= request.getParameter("price") %></p>
            --%> </div>
             <%-- <div class="col-md-6">
                <h3>Total Amount</h3>
                <p id="totalAmount">Total: $0.00</p>
                 <input type="hidden" id="total" name="total" value="<%= request.getParameter("total") %>">
   
            </div> --%>
        </div>
        </div>
        <button onclick="window.location.href='shipping.jsp'" class="button">Place Another Order</button>
         <button onclick="window.location.href='userhome.jsp'" class="button">submit</button>
    
    </div>
</body>
</html>
            
            
           
