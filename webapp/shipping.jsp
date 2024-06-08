<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Checkout</title>
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
        form {
            display: flex;
            flex-wrap: wrap;
        }
        .form-group {
            flex: 1 1 100%;
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        .form-group textarea {
            resize: vertical;
        }
        .form-group-half {
            flex: 1 1 48%;
            margin-right: 4%;
        }
        .form-group-half:nth-child(2n) {
            margin-right: 0;
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
        .total {
            text-align: right;
            margin-top: 20px;
            font-size: 18px;
        }
        .form-group.space-between {
            display: flex;
            justify-content: space-between;
        }
        .form-group.space-between .form-group-half {
            margin-right: 2%;
        }
        .form-group.space-between .form-group-half:last-child {
            margin-right: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Shipping & Billing Information</h2>
        <form id="checkoutForm" action="confirm.jsp" method="post">
            <div class="form-group-half">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" required>
            </div>
            <div class="form-group-half">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <input type="text" id="city" name="city" required>
            </div>
            <div class="form-group space-between">
                <div class="form-group-half">
                    <label for="state">State</label>
                    <input type="text" id="state" name="state" required>
                </div>
                <div class="form-group-half">
                    <label for="zip">Zip Code</label>
                    <input type="text" id="zip" name="zip" required>
                </div>
            </div>
            <div class="form-group space-between">
                <div class="form-group-half">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group-half">
                    <label for="phone">Phone</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
            </div>
            <div class="form-group">
                <label for="notes">Order Notes</label>
                <textarea id="notes" name="notes" rows="4"></textarea>
            </div>
            <div class="form-group">
                <label for="product1">Product 1 Price</label>
                <input type="number" id="product1" name="price" value="0" step="0.01" required onchange="calculateTotal()">
            </div>
            <div class="form-group">
                <label for="product2">Product 2 Price</label>
                <input type="number" id="product2" name="price" value="0" step="0.01" required onchange="calculateTotal()">
            </div>
            <div class="form-group">
                <label for="product3">Product 3 Price</label>
                <input type="number" id="product3" name="price" value="0" step="0.01" required onchange="calculateTotal()">
            </div>
            <div class="total" id="totalAmount">
                Total: $0.00
            </div>
            <input type="hidden" id="total" name="total" value="0">
            <button type="submit" class="button">Place Order</button>
        </form>
    </div>
    <script>
        function calculateTotal() {
            const priceInputs = document.querySelectorAll('input[name="price"]');
            let total = 0;
            priceInputs.forEach(input => {
                const price = parseFloat(input.value);
                if (!isNaN(price)) {
                    total += price;
                }
            });
            document.getElementById('totalAmount').innerText = 'Total: $' + total.toFixed(2);
            document.getElementById('total').value = total.toFixed(2);
        }

        function placeOrder(event) {
            event.preventDefault(); // Prevent the default form submission
            alert("Thank you for your order! Your order has been placed successfully.");
            // Submit the form programmatically if needed
            // document.getElementById('checkoutForm').submit();
        }

        document.getElementByClassName('confirm').addEventListener('submit', placeOrder);

        window.onload = function() {
            calculateTotal();
        };
    </script>
</body>
</html>
