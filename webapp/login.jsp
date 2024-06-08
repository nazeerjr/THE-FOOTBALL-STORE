<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page with Validation</title>
 
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
/* Custom CSS for demonstration */
.container {
    max-width: 400px;
    margin: auto;
    margin-top: 50px;
    
}

body
{
 background-color:#e8bcf0;
}

h2 {
    text-align: center;
    margin-bottom: 30px;
}

/* .container1
  {
    background-color:Bisque;
  }
   */
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
a{
color:black;
}

  li.nav-link px-2 text-secondary a {
    text-align: center;
    float: none;
  }
  
  
.signin-image
{
  margin-right: auto;
  float:right;
  position: absolute;
    top: 50%; /* Align to the middle vertically */
    right: 0; /* Align to the right side of the page */
    transform: translateY(-50%); 

}
  
  
</style>
</head>


<body>

 <div class="container1">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
      </a>
   <nav class="navbar">
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="home.jsp" class="nav-link px-2 link-dark"></a></li>
        <li><a href="#" class="nav-link px-2 link-dark"></a></li>
        <li><a href="#" class="nav-link px-2 link-dark"></a></li>
        <li><a href="#" class="nav-link px-2 link-dark"></a></li>
        <li><a href="#" class="nav-link px-2 link-dark"></a></li>
      </ul>
  </nav> 
  
  
       <!--  <form class=" ">
          <button type="button"  class="btn btn-outline-info"><input type="search" class="form-control form-control-dark" placeholder="Search..."></button>
          
        </form>-->
        
        

        <div class="text-end">
       
          <a href="login.jsp"><button  type="button" class="btn btn-success">Login</button></a>
          <a href="SignUp.jsp"><button type="button" class="btn btn-outline-warning">Sign-up</button></a>
        </div>
     
 </header>
 
   </div> 
  <h2>Login</h2>
  <section id="">
<div class="container">
    
    <form id="login-form" class="needs-validation" novalidate action="LoginSuccess.jsp"  method="post">
        <div class="form-group">
            <label for="email">Email address:</label>
            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" maxlength=40 pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" required>
            <div class="invalid-feedback">Please enter a valid email address.</div>
        </div><br>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"required>
            <div class="invalid-feedback">Please enter a password.</div>
        </div>
        
        
        <button type="submit" class="btn btn-primary" onclick="submitForm()">Login</button>
          <a type="submit" class="btn btn-info" href='forgotPassword.jsp'>Forgot Password</a><br><br>
       
    </form>
</div>
</section>
<div class="signin-image">
						<figure>
							<img src="Images/signin-image.jpg" alt="sing ip image">
						</figure>
						</div>
<script>
// JavaScript for form validation
(function() {
    'use strict';
    window.addEventListener('load', function() {
        var form = document.getElementById('login-form');
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
    var form = document.getElementById('login-form');
    if (form.checkValidity()) {
       
        alert('Form submitted successfully!');
          } else {
        
        alert('Please fill in all fields.');
    }
}
</script>

</body>
</html>
