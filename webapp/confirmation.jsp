<%@ page import="java.net.URLDecoder" %>

<%

String uid = request.getParameter("uid");

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receipt</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .receipt-container {
            background: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
            /* Gradient background */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); /* Slight shadow */
            padding: 40px;
            max-width: 600px;
            width: 100%;
            animation: slideInUp 0.5s ease forwards;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .receipt-container h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #333; /* Dark gray */
            text-align: center;
        }

        .payment-details {
            background-color: #f5f5f5; /* Light gray */
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        .payment-details h2 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #555; /* Dark gray */
            text-align: center;
        }

        .payment-details p {
            font-size: 18px;
            line-height: 1.6;
            color: #444; /* Gray */
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #333; /* Dark gray */
            font-weight: bold;
        }

        .back-link:hover {
            color: #555; /* Dark gray */
        }
    </style>
</head>
<body>
    <div class="receipt-container">
        <h1>Order Receipt</h1>
        <div class="payment-details">
        	<h2>Thank you for being an amazing customer! Your order is on its way, packed with care and gratitude. We can't wait for you to enjoy it </h2>
            <h2>An order confirmation mail is also sent to your registered mail</h2>
         
        </div>
        <a href="userhome.jsp?uid=<%= uid %>" class="back-link">Back to Home</a>
    </div>
</body>
</html>
