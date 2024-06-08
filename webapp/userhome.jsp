<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 
      <%String uid= request.getParameter("uid");  %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title></title>
   
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">

  <link rel="stylesheet" href="style.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <script src="index.js" defer></script>
  <style type="text/css">
 
ul li {
    margin-bottom: 10px;
    width:fit-content; /* Adjust spacing between list items */
}

ul li a {
    display: block;
    padding: 10px;
    text-decoration: none;
    color: #333; /* Default color for light mode */
    background-color: #f5f5f5; /* Default background color for light mode */
    transition: background-color 0.3s, color 0.3s;
}

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

  </style>
  
</head>


<body>

            <section id="navbar">

         
<header class="p-3 container1 text-white">
    <div class="container ">
    
	<div class="d-flex flex-wrap align-items-left justify-content-between justify-content-lg-start">
	
			 
			  <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
			     <li><a href="userhome.jsp?uid=<%= uid%>"class="nav-link px-2 text-white">Home</a></li>
			     <li><a href="viewProducts.jsp?uid=<%= uid%>" class="nav-link px-2 text-white">View All Products</a></li>
			     <li><a href="viewCart.jsp?img=uid=<%= uid%>" class="nav-link px-2 text-white" style="margin-right: 200px;">View Cart</a></li>
			  </ul>
	
			   		
<div>
   
</div>

<div class="text-end">
                     
                      
                      
                    </div>  
                    
                  <div class="text-end">
				          <a href="logout.jsp" class="btn btn-secondary">logout</a>
				</div>

                  </div>
                </div>
              </header>
                    

            </section>
            

           
           
 <div align="center" class="mt-2 ">
<h3 style=" font-style:italic; text-align:center;width:300px;height:50px; background-color: cyan " >Welcome User     </h3>
</div>
   
   <div align="center">
    <ul style="list-style-type: none; padding: 0;">
        <li><a href="viewProducts.jsp?uid=<%= uid%>">View All Products</a></li>
        <li><a href="viewCart.jsp?uid=<%= uid%>">View Cart </a></li>
        <!-- Add more links as needed -->
    </ul>
</div>
</body>
</html>