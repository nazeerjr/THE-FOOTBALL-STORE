<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
 
 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <style>
  
  @import url('https://fonts.googleapis.com/css2?family=Oleo+Script+Swash+Caps&family=Poppins:wght@600&family=Roboto+Slab&display=swap');

:root{
    --yellow:#f9d806;
    --light-yellow:#ffee80;
    --black:#130f40;
    --light-color:#666;
    --border:.1rem solid rgba(0,0,0,.1);
    --box-shadow:0 .5rem 1rem rgba(0,0,0,.1);
    --green:rgba(9, 244, 25, 0.933);
}

*{
    font-family:'poppins',sans-serif;
    margin: 0;padding: 0;
    box-sizing: border-box;
    outline: none;border: none;
    text-decoration: none;
    text-transform: capitalize;
    transition: all .2s linear;
}

html{
    font-size: 62.5%;
    overflow-x: hidden;
    scroll-padding-top: 7rem;
    scroll-behavior: smooth;

}
section{
    padding:5rem 30%;
}


 body{
  background-color:#FFCDD5;
}
 
.signup-image
{
  margin-left: auto;
  float:right;
  position: absolute;
    top: 50%; 
    right: 0; 
    transform: translateY(-50%); 

}


.register-form
{
font-size: 18px; 
}

.form-title
{
 text-align:center;
font-size: 28px; 
}

.form-group
{
  font-size: 18px; 
}

form-control
{
 font-size: 10px; 
}
  
  .btn {
    font-size: 15px; 
    padding: 10px 20px;
    }
  
  
  </style>

<!-- Main css -->

</head>
<body>

	<div class="main">

		
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2><br>
					
		 <form id="signup-form" class="needs-validation" novalidate action="Insertdata.jsp"   method="post" >
        <div class="form-group">
            <label for="username">FirstName:</label><br>
            <input type="text" class="form-control" name="fn" id="Fn" placeholder="Enter firstname" pattern="[A-Za-z]{1,25}" required>
            <div class="invalid-feedback">Please enter a firstname.</div>
        </div><br>
        
        <div class="form-group">
            <label for="username">LastName:</label><br>
            <input type="text" class="form-control" id="Ln" placeholder="Enter lastname" name="ln" pattern="[A-Za-z]{1,25}" required>
            <div class="invalid-feedback">Please enter a lastname.</div>
        </div><br>
        
         
						 <div class="form-group ">
            <label for="username">UserName:</label><br>
            <input type="text" class="form-control" id="Un" placeholder="Enter username" pattern="[A-Za-z]{1,25}" name="un" required>
            <div class="invalid-feedback">Please enter a username.</div>
        </div><br>
        
       
        <div class="form-group">
            <label for="email">Email address:</label>
            <input type="email" class="form-control" id="Email" placeholder="Enter email" name="email" maxlength="40" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" required>
            <div class="invalid-feedback">Please enter a valid email address.</div>
        </div><br>
        <div class="form-group needs-validated" >
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="Password" placeholder="Enter password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required> 
            <div class="invalid-feedback">Please enter a password.</div>
         </div><br>
         
        <div class="form-group">
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" class="form-control" id="ConfirmPassword" placeholder="Confirm password" name="confirmPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
            <div class="invalid-feedback">Please confirm your password.</div>
           </div><br>
        
         <div class="form-group">
            <label for="username">Mobile Number:</label><br>
            <input type="text" class="form-control" id="Ph" placeholder="Enter mobile number" name="ph" pattern="[0-9]{10}"required>
            <div class="invalid-feedback">Please enter a mobile number.</div>
        </div><br>
        
        <div class="form-group">
            <label for="username">Address:</label><br>
            <textarea class="form-control" id="Add" placeholder="Enter address" required name="add" maxlength="50"></textarea>
            <div class="invalid-feedback">Please enter a Address.</div>
        </div><br>
        
        
					 
					  <div class="form-group">
                        Select Photo: <input type="file" name="photo" id="Photo"><br><br>
           </div>
       
                     
         
        
        <div class="form-group">
        
        
  <label for="cars">Role:</label>
  <select name="role" id="role">
    
    <option value="admin">Admin</option>
     <option value="user">user</option>
    
  </select>
  <br><br>
  
            <div class="invalid-feedback">Please enter a Role.</div>
  
 
</div>
    

							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							 <button type="submit" class="btn btn-primary" size="20" onclick="submitForm()">Sign Up</button>
       <button type="reset" class="btn btn-warning" onclick="submitForm()">Reset</button>
       <div id="error-msg" class="text-danger-mt-2"></div>
       
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="Images/signup-image.jpg" alt="sing up image">
						</figure>
						<h4><a href="login.jsp">Already have an Account? Log in</a></h4>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<!-- <script type="text/javascript">
	    var status = document.getElementById("status").value;
	    if(status == "success"){
	    	swal("Congrats","Account Created Successfully","success");
	    }
	 -->
	    
	    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	    <script>
	    // JavaScript for form validation



	    (function() {
	        'use strict';
	        window.addEventListener('load', function() {
	            var form = document.getElementById('signup-form');
	            form.addEventListener('submit', function(event) {
	                if (!form.checkValidity()) {
	                    event.preventDefault();
	                    event.stopPropagation();
	                }
	                form.classList.add('was-validated');
	            }, false);
	        }, false);
	    })();

	    function submitForm() {
	        var form = document.getElementById('signup-form');
	        if (form.checkValidity()) {
	            // Form is valid, submit it
	            alert('Form submitted successfully!');
	            // window.location.href = "Insertdata.jsp";
	            // You can add code to submit the form to a server here
	        } else {
	            // Form is not valid, show alert
	            alert('Please fill in all fields correctly.');
	        }
	    }

	    function validateForm() {
	        var password = document.getElementById("password").value;
	        var confirmPassword = document.getElementById("confirmPassword").value;
	        var error_message = document.getElementById("error-msg");
	        if (password !== confirmPassword) {
	            error_message.innerHTML = "Passwords do not match.";
	            //alert("Passwords do not match.");
	            //return false;
	        } else {
	            error_message.innerHTML = "";
	        }
	        //return true;
	    }

	      
	    
	    
	</script>



</body>
</html>