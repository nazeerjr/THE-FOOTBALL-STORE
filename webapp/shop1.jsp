<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        
        
        
    </style>
</head>
<body>
    <div class="header">
        <h1>Shopping Cart</h1>
          <div class="mode-toggle" onclick="toggleMode()">
    <div class="switch"></div>
  </div>
        <div class="retriveUsers.jsp">
            <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 20" alt="Cart" class="cart-icon">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 15a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm0 0h8m-8 0-1-4m9 4a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm-9-4h10l2-7H3m2 7L3 4m0 0-.792-3H1"/>
            </svg>
            <a href=" "><span id="cart-count">0</span></a>
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

<center>
<a href="userhome.jsp"><button class="btn btn-success" data-product-id="2">View Carts</button>
</a>


</center>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cartCountElement = document.getElementById('cart-count');
            let cartCount = 0;

            document.querySelectorAll('.add-to-cart').forEach(button => {
                button.addEventListener('click', () => {
                    cartCount++;
                    cartCountElement.textContent = cartCount;
                });
            });
        });
        
        
        function toggleMode() {
      	  const body = document.querySelector('body');
      	  body.classList.toggle('dark-mode');
      	  body.classList.toggle('light-mode');
      	}

       function toggleSocial() {
      	  const socialMedia = document.getElementById('social-media');
      	  socialMedia.classList.toggle('show-icons');
      	}

       
       
       
       
       
       
       
       
    </script>
</body>
</html>
