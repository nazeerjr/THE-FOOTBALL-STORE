<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% String name = request.getParameter("name"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Userdata</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
       .head
    {
     text-align:center;
    }
    
    .center
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
  
 
  body::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
   background-image: url('Images/bg.jpg');
    background-size: cover;
    background-position: center;
    filter: blur(1px); 
    z-index: -1;
}
  
 .btn btn-success
 {
   border-radius:25px;
 }

h1
{
 font-size:30px;
 text-align:center;
}
   
    </style>
    <body>
    
    <div class="container1">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-10 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
      </a>
   <nav class="navbar">
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <marquee><h1>This is  Admin Page</h1></marquee>
        
        
      </ul>
  </nav>
         <!-- <form class=" ">
          <button type="button"  class="btn btn-outline-info"><input type="search" class="form-control form-control-dark" placeholder="Search..."></button>
          
        </form> -->
       
        

        <div class="text-end">
          <a href="login.jsp"><button  type="button" class="btn btn-success"><b>Logout</b></button></a>
       
        </div>
        
       

     
    
 </header>
 
  </div>
 
</head>      
      <body> 
        
 
<hr>
<h1>check out the Admin Page</h1>
<h1><a href="fetching.jsp?name=<%=name  %>">User Info</a></h1>
<br><br>
<!-- <h1>Redirect to Users Page</h1>
<h1><a href="retriveUsers.jsp">View Product</a></h1>
 -->
         
</body>
</html>