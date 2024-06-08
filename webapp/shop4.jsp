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
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "Lali@1234");

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
            width: 50px;
            height: 50px;
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
                <li><a href="userhome.jsp?>uid=<%=uid %>"class="nav-link px-2 text-white">Home</a></li>
                <li><a href="viewProducts.jsp?uid=<%=uid %>" class="nav-link px-2 text-white">View All Products</a></li>
                <li><a href="viewCart.jsp?uid=<%=uid%>" class="nav-link px-2 text-white" style="margin-right: 200px;">View Cart </a></li>
            </ul>

			   		
<div>
    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" action="search.jsp" method="GET">
      
   		 <input type="hidden" name="uid" value="<%= uid %>">
        <input type="search" class="form-control form-control-dark" name="query" placeholder="Search products..." aria-label="Search">
        <button type="submit" class="btn btn-light mt-2"><i class="bi bi-search"></i> </button>
    </form>
</div>

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
            <th>Company</th>
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
                    PreparedStatement cartStmt = con.prepareStatement("SELECT quantity FROM cart WHERE sid = ? AND pid = ?");
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
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</div>

<!-- Cart icon -->
<a href="viewCart.jsp?uid=<%= uid %>">
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


























<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
   
    String uid = request.getParameter("cid");

    // Variable to store the total quantity in the cart
    int totalQuantity = 0;

    try {
        // Your database connection code
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "Lali@1234");

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
    <title>User Dashboard</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background-color: silver;
            margin: 0;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: gray;
            border-bottom: 1px solid #ddd;
            width: 100%;
        }
        .cart {
            display: flex;
            align-items: center;
            position: relative;
        }
        .cart-icon {
            width: 32px;
            height: 32px;
            margin-left: 10px;
            color:black;
        }
        #cart-count {
            font-size: 18px;
            font-weight: bold;
            color: red;
             border-radius: 50%;
        }
        .products-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            width: 100%;
        }
        .products {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            padding: 20px;
            width: 80%;
        }
        .product {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 4px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .product img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            margin-bottom: 10px;
        }
        .product h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }
        .product p {
            margin-bottom: 10px;
        }
        .stars {
            color: #f39c12;
            margin-bottom: 10px;
        }
        .add-to-cart {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .add-to-cart:hover {
            background-color: #0056b3;
        }
        
        .light-mode {
  background-color: #ffffff;
  color: #333333;
}

.dark-mode {
  background-color: #333333;
  color: #ffffff;
}

.mode-toggle {
  cursor: pointer;
  padding: 10px;
  width: 60px;
  height: 30px;
  position: relative;
  background-color: #ccc;
  border-radius: 15px;
  margin-left: 70%;
}

.switch {
  width: 30px;
  height: 30px;
  background-color: #fff;
  border-radius: 50%;
  position: absolute;
  left: 0;
  transition: left 0.3s;
}

.dark-mode .switch {
  left: 30px;
}

  .social-toggle {
  cursor: pointer;
  padding: 10px;
  width: 150px;
  background-color: #ccc;
  border-radius: 5px;
  margin: 20px;
  text-align: center;
}
        
  .cart-details {
            display: none;
            position: fixed;
            top: 50px;
            right: 50px;
            width: 300px;
            max-height: 400px;
            overflow-y: auto;
            background-color: white;
            border: 1px solid #ddd;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            z-index: 1000;
        }
        .cart-details h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .cart-item img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            margin-right: 10px;
        }
        .cart-item-details {
            flex-grow: 1;
        }
        .cart-item-controls {
            display: flex;
            align-items: center;
        }
        .cart-item-controls button {
            margin: 0 5px;
        }       
 
 .cart-sidebar {
            position: fixed;
            right: -300px;
            top: 0;
            width: 300px;
            height: 100%;
            background-color: #fff;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.5);
            transition: right 0.3s ease;
            padding: 20px;
            z-index: 1000;
            overflow-y: auto;
        }
        .cart-sidebar.open {
            right: 0;
        }
        .cart-sidebar h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .cart-item img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            margin-right: 10px;
        }
        .cart-item-details {
            flex-grow: 1;
        }
        .cart-item-controls {
            display: flex;
            align-items: center;
        }
        .cart-item-controls button {
            margin: 0 5px;
        }
        .cart-item-controls span {
            width: 30px;
            text-align: center;
        }
        .cart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
  
    
        .cart-total {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
        }
        
    </style>
</head>
<body>
    <div class="header">
        <h1>Shopping Cart</h1>
        <div class="mode-toggle" onclick="toggleMode()">
            <div class="switch"></div>
        </div>
        <div class="cart" onclick="toggleCartSidebar()">
            <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 20" alt="Cart" class="cart-icon">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 15a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm0 0h8m-8 0-1-4m9 4a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm-9-4h10l2-7H3m2 7L3 4m0 0-.792-3H1"/>
            </svg>
            <span id="cart-count">0</span>
        </div>
    </div>
    <div class="products-container">
        <div class="products">
            <div class="product">
                <img src="Images/c1.jpg" alt="Product Image">
                <h2>Personalized Gifts</h2>
                <p>$10.00</p>
              <div class="stars">★★★★★</div>
                <button class="add-to-cart" data-product-id="1">Add to Cart</button>
            </div>
            <div class="product">
                <img src="Images/c2.png" alt="Product Image">
                <h2>Experience Gifts</h2>
                <p>$15.00</p>
             
                <div class="stars">★★★★☆</div>
                <button class="add-to-cart" data-product-id="2">Add to Cart</button>
            </div>
            <div class="product">
                <img src="Images/c3.jpg" alt="Product Image">
                <h2>DIY Gifts</h2>
                <p>$20.00</p>
                <div class="stars">★★★☆☆</div>
                <button class="add-to-cart" data-product-id="3">Add to Cart</button>
            </div>
            <div class="product">
                <img src="Images/c4.jpg" alt="Product Image">
                <h2>Charitable Gifts</h2>
                <p>$25.00</p>
                <div class="stars">★★☆☆☆</div>
                <button class="add-to-cart" data-product-id="4">Add to Cart</button>
            </div>
            <div class="product">
                <img src="Images/c5.jpg" alt="Product Image">
                <h2>Accessories</h2>
                <p>$30.00</p>
                <div class="stars">★☆☆☆☆</div>
                <button class="add-to-cart" data-product-id="5">Add to Cart</button>
            </div>
            <div class="product">
                <img src="Images/c6.jpeg" alt="Product Image">
                <h2>Home Decor</h2>
                <p>$35.00</p>
                <div class="stars">★★★★★</div>
                <button class="add-to-cart" data-product-id="6">Add to Cart</button>
            </div>
            <div class="product">
                <img src="Images/i1.jpg" alt="Product Image">
                <h2>TechGadgets</h2>
                <p>$40.00</p>
                <div class="stars">★★★★☆</div>
                <button class="add-to-cart" data-product-id="7">Add to Cart</button>
            </div>
            <div class="product">
                <img src="Images/i2.jpeg" alt="Product Image">
                <h2>RevocableGifts</h2>
                <p>$45.00</p>
                <div class="stars">★★★☆☆</div>
                <button class="add-to-cart" data-product-id="8">Add to Cart</button>
            </div>
            <div class="product">
                <img src="Images/i3.jpeg" alt="Product Image">
                <h2>Bridal Gifts</h2>
                <p>$50.00</p>
                <div class="stars">★★☆☆☆</div>
                <button class="add-to-cart" data-product-id="9">Add to Cart</button>
            </div>
        </div>
    </div>
 <div id="cart-sidebar" class="cart-sidebar">
        <div class="cart-header">
            <h2>Your Cart</h2>
            <button onclick="toggleCartSidebar()">Close</button>
        </div>
       <div id="cart-items"></div>
        <div id="cart-total" class="cart-total"></div>
         
        <button class="btn btn-primary" onclick="checkout()">Checkout</button>
      </div>
    <center>
        <a href="userhome.jsp"><button class="btn btn-success" data-product-id="2">View Carts</button></a>
    </center>


    <script>
       
        
        function toggleMode() {
      	  const body = document.querySelector('body');
      	  body.classList.toggle('dark-mode');
      	  body.classList.toggle('light-mode');
      	}

       function toggleSocial() {
      	  const socialMedia = document.getElementById('social-media');
      	  socialMedia.classList.toggle('show-icons');
      	}
       
       document.addEventListener('DOMContentLoaded', function() {
    	    const cartCountElement = document.getElementById('cart-count');
    	    const cartItemsElement = document.getElementById('cart-items');
    	    const cartTotalElement = document.getElementById('cart-total');
    	    let cartCount = 0;
    	    let cart = {};

    	    document.querySelectorAll('.add-to-cart').forEach(button => {
    	        button.addEventListener('click', () => {
    	            const productId = button.getAttribute('data-product-id');
    	            const productElement = button.closest('.product');
    	            const productName = productElement.querySelector('h2').textContent;
    	            const productPrice = parseFloat(productElement.querySelector('p').textContent.replace('$', ''));
    	            const productImage = productElement.querySelector('img').src;

    	            if (!cart[productId]) {
    	                cart[productId] = {
    	                    id: productId,
    	                    name: productName,
    	                    price: productPrice,
    	                    image: productImage,
    	                    quantity: 1
    	                };
    	            } else {
    	                cart[productId].quantity += 1;
    	            }
    	            updateCart();
    	            toggleCartSidebar(true);
    	        });
    	    });

    	    function updateCart() {
    	        cartCount = Object.values(cart).reduce((sum, item) => sum + item.quantity, 0);
    	        cartCountElement.textContent = cartCount;
    	        renderCartItems();
    	    }

    	    function renderCartItems() {
    	        cartItemsElement.innerHTML = '';
    	        let total = 0;

    	        Object.values(cart).forEach(item => {
    	            total += item.price * item.quantity;

    	            const cartItemElement = document.createElement('div');
    	            cartItemElement.classList.add('cart-item');
    	            cartItemElement.innerHTML = `
    	                <img src="${item.image}" alt="${item.name}">
    	                <div class="cart-item-details">
    	                    <div>${item.name}</div>
    	                    <div>$${item.price.toFixed(2)}</div>
    	                </div>
    	                <div class="cart-item-controls">
    	                    <button onclick="decreaseQuantity(${item.id})">-</button>
    	                    <span>${item.quantity}</span>
    	                    <button onclick="increaseQuantity(${item.id})">+</button>
    	                </div>
    	            `;
    	            cartItemsElement.appendChild(cartItemElement);
    	        });

    	        cartTotalElement.textContent = `Total: $${total.toFixed(2)}`;
    	    }

    	   
    	    function decreaseQuantity(productId) {
    	        if (cart[productId].quantity > 1) {
    	            cart[productId].quantity -= 1;
    	        } else {
    	            delete cart[productId];
    	        }
    	        updateCart();
    	        renderCartItems(); 
    	    }

    	    function increaseQuantity(productId) {
    	        cart[productId].quantity += 1;
    	        updateCart();
    	        renderCartItems(); 
    	    }

    	   /*  function decreaseQuantity(productId) {
    	        if (cart[productId].quantity > 1) {
    	            cart[productId].quantity -= 1;
    	            updateCart();
    	        }
    	    }

    	    function increaseQuantity(productId) {
    	        cart[productId].quantity += 1;
    	        updateCart();
    	    }
 */
    	    function updateQuantityDisplay(productId) {
    	        const quantityElement = document.querySelector(`.product[data-product-id="${productId}"] .quantity`);
    	        if (quantityElement) {
    	            quantityElement.textContent = cart[productId].quantity;
    	        }
    	    }

    	    function updateCart() {
    	        cartCount = Object.values(cart).reduce((sum, item) => sum + item.quantity, 0);
    	        cartCountElement.textContent = cartCount;
    	        renderCartItems();
    	    }

    	    
           window.toggleCartSidebar = function(open) {
               const cartSidebarElement = document.getElementById('cart-sidebar');
               if (open) {
                   cartSidebarElement.classList.add('open');
               } else {
                   cartSidebarElement.classList.toggle('open');
               }
           };

          
           window.toggleCartDetails = function() {
               const cartDetailsElement = document.getElementById('cart-details');
               cartDetailsElement.style.display = cartDetailsElement.style.display === 'none' || cartDetailsElement.style.display === '' ? 'block' : 'none';
           };

           window.checkout = function() {
               alert('Proceeding to checkout');
               // Implement checkout logic here
           };
       });

       function toggleMode() {
           const body = document.querySelector('body');
           body.classList.toggle('dark-mode');
           body.classList.toggle('light-mode');
       }
  

       
       
     
       
       
       
       
    </script>
</body>
</html>
 --%>