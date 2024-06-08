<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<!DOCTYPE html>
<html>
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
  
  body {
  transition: background-color 0.3s, color 0.3s;
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
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
  margin: 20px;
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

.social-media {
  display: none;
}

.show-icons .social-media {
  display: block;
}

.show-icons .toggle-text {
  display: none;
}

.icons {
  display: none;
}

.show-icons .icons {
  display: inline-block;
}
  

 </style>
</head>
<body>
<%

InputStream photoStream = null;


%>


 <div class="container1">
                    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                        <a href="/" class="d-flex align-items-center col-md  -3 mb-2 mb-md-0 text-dark text-decoration-none">
                            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
                        </a>
            
                       
                        <nav class="navbar">
                            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                                <li><a href="fetching.jsp" class="nav-link px-2 link-dark"></a></li>
                                <li><a href="shop1.jsp" class="nav-link px-2 link-dark">View gifts</a></li>
                                <li><a href="addp.jsp" class="nav-link px-2 link-dark">Add products</a></li>
                                <li><a href="#" class="nav-link px-2 link-dark"></a></li>
                                <li><a href="#" class="nav-link px-2 link-dark"></a></li>
                            </ul>
                        </nav> 
                        <div class="text-end">
                            <a href="login.jsp"><button type="button" class="btn btn-success"><b>Logout</b></button></a>
                            <a href="SignUp.jsp"><button type="button" class="btn btn-outline-info">Sign-up</button></a>
                            <a href="" type="button" class="btn btn-outline-primary me-2">
                            
                                <img style="width:50px; height:50px; border-radius:50%;" src="Images/profile.jpg" />
                         
                          
                        </a>
       </div>
       <div class="mode-toggle" onclick="toggleMode()">
    <div class="switch"></div>
  </div>
       
                </header>
                
           
            </div>
            
            
          
          
          
          
            

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

    </script>





</body>
</html>