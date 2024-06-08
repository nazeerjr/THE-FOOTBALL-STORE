<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Gifts Shop</title>
    <!-- Include Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
     body {
            font-family: Arial, sans-serif;
          
            background-color: ;
           
            justify-content: center;
            align-items: center;
         
        }
       .container {
            max-width: 800px;
            padding: 10px;
            margin-left:20%;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: lightblue;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        
            align-items: center;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header img {
            width: 150px;
            height: auto;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
            width: 100%;
            display: flex;
            justify-content: space-between;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"],
        textarea {
            width: calc(50% - 6px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        textarea {
            height: 150px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .icon {
            margin-right: 10px;
            color: orange;
        }
        .contact-info {
            display: flex;
            align-items: center;
        }
        .contact-info i {
            margin-right: 10px;
            color: orange;
            font-size: 20px;
        }
        .contact-info span {
            font-size: 16px;
            color: #555;
        }
    </style>
    
    
     <script>
        function submitForm() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var phone = document.getElementById("phone").value;
            var address = document.getElementById("address").value;
            var message = document.getElementById("message").value;

            alert("Thanks for your feedback, " + name + "! We appreciate your input.");
            window.location.href = "home.jsp"; 
            return false; 
        }
    </script>
    
    
    
    
</head>
<body bgcolor="lightblue">
     <div class="container">
        <div class="header">
            <img src="Images/th1.jpeg" alt="Gifts Shop Logo">
        </div>
        <h1>Contact Us</h1>
        <form onsubmit="return submitForm()">
            <div class="form-group">
                <label for="name">Your Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email"><i class="fas fa-envelope icon"></i>Your Email:</label>
                <input type="text" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone"><i class="fas fa-phone icon"></i>Your Phone:</label>
                <input type="text" id="phone" name="phone">
            </div>
            <div class="form-group">
                <label for="address"><i class="fas fa-map-marker-alt icon"></i>Your Address:</label>
                <input type="text" id="address" name="address">
            </div>
            <div class="form-group">
                <label for="message">Your Message:</label>
                <textarea id="message" name="message" required></textarea>
            </div>
            <div class="form-group">
                <input type="submit" value="Submit Feedback">
            </div>
        </form>
        <div class="contact-info">
            <div class="contact-info">
                <i class="fas fa-phone icon"></i>
                <span>+1234567890</span>
            </div>
            <div class="contact-info">
                <i class="fas fa-envelope icon"></i>
                <span>customerservice@brecksgifts.com</span>
            </div>
            <div class="contact-info">
                <i class="fas fa-map-marker-alt icon"></i>
                <span>123 Mailing Address: Breck's Gifts P.O. Box 3979 Lawrenceburg, 
                877-846-8149 Fax: 513-354-1505 Customer Service</span>
            </div>
        </div>
    </div>
</body>
</html>
