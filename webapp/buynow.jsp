<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

    String uid = request.getParameter("uid");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buy Now</title>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
form{
width:500px;
background-color:white;
}
     
    </style>
</head>
<body>

<section id="navbar">
    <header class="p-3 container1 text-white">
        <div class="container ">
            <div class="d-flex flex-wrap align-items-left justify-content-between justify-content-lg-start">
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="userhome.jsp?uid=<%= uid%>" class="nav-link px-2 text-white">Home</a></li>
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



<h1>Buy Now</h1>

<!-- Shipping address form -->
<section >
    <div class=" d-flex justify-content-center align-items-center form-container mt-2 " >

        <form action="proceedCheckout.jsp?uid=<%= uid%>"  method="post" >
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea class="form-control" name="address" id="address" rows="3" placeholder="Enter Address" required></textarea>
            </div>
            <br>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" class="form-control" id="city" name="city" placeholder="Enter City" required>
            </div>
            <br>
            <div class="form-group">
                <label for="state">State:</label>
                <input type="text" class="form-control" id="state" name="state" placeholder="Enter State" required>
            </div>
            <br>
            <div class="form-group">
                <label for="zipcode">Zip Code:</label>
                <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="Enter Zip Code" required>
            </div>
            <!-- Payment method dropdown -->
            <div class="form-group">
                <label for="paymentMethod">Select Payment Method:</label>
                <select class="form-control" id="paymentMethod" name="paymentMethod">
                    <option value="creditCard">Credit Card</option>
                    <option value="paypal">PayPal</option>
                    <!-- Add more payment methods if needed -->
                </select>
            </div>
            <!-- Additional payment fields based on selected method -->
            <div id="creditCardFields" style="display: none;">
                <div class="form-group">
                    <label for="cardNumber">Card Number:</label>
                    <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="Enter Card Number">
                </div>
                <!-- Add more fields for credit card details -->
            </div>
            <div id="paypalFields" style="display: none;">
                <div class="form-group">
                    <label for="paypalEmail">PayPal Email:</label>
                    <input type="email" class="form-control" id="paypalEmail" name="paypalEmail" placeholder="Enter PayPal Email">
                </div>
                <!-- Add more fields for PayPal details -->
            </div>
            <div align="center">	    
                <button type="submit" class="btn btn-success mt-2">Proceed to Checkout</button>		 
            </div>		  
        </form>
    </div>
</section>

<script>
    // Show or hide additional fields based on selected payment method
    document.getElementById('paymentMethod').addEventListener('change', function() {
        var paymentMethod = this.value;
        document.getElementById('creditCardFields').style.display = paymentMethod === 'creditCard' ? 'block' : 'none';
        document.getElementById('paypalFields').style.display = paymentMethod === 'paypal' ? 'block' : 'none';
    });
</script>

</body>
</html>