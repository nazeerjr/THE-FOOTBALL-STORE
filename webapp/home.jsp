<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
 <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <style>
    .customized-carousel{
     width:500px;
     height:300px;
      
    }
    
   .customized-carousel .carousel-item img{
   width:500px;
   height:300px;
  
   }   
    
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
   background-image: url('Images/bg1.jpg');
    background-size: cover;
    background-position: center;
    filter: blur(2px);
    z-index: -1;
}
  
 .btn btn-success
 {
   border-radius:25px;
 }

.h1
{
 font-size:30px;
}
    </style>
    
<title>Insert title here</title>


 
<div class="container1">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
      </a>
   <nav class="navbar">
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="home.jsp" class="nav-link px-2 link-dark">Home</a></li>
        <li><a href="About.jsp" class="nav-link px-2 link-dark">About Us</a></li>
        <li><a href="gallery.jsp" class="nav-link px-2 link-dark">Collections</a></li>
        <li><a href="contact.jsp" class="nav-link px-2 link-dark">Contact</a></li>
        <li><a href="#" class="nav-link px-2 link-dark"></a></li>
      </ul>
  </nav>
        <!--  <form class=" ">
          <button type="button"  class="btn btn-outline-info"><input type="search" class="form-control form-control-dark" placeholder="Search..."></button>
          
        </form> -->
       
        

        <div class="text-end">
          <a href="login.jsp" class="btn btn-success">Login</a>
          <a href="SignUp.jsp"><button type="button" class="btn btn-outline-warning" onclick="redirectToNextPage()">Sign-up</button></a>
        </div>
        
       

     
    
 </header>
 
  </div>
 

</head>
<body>
<section id="home" >
      <h2 class="center">Welcome to Blissful Moments</h2>
      <!--  <p class="h1">Giftster" is an online platform designed to simplify gift-giving among family and friends. It offers features such as creating wish lists, 
        sharing gift ideas, and organizing gift exchanges.
        Giftster aims to streamline the gift-giving process and make it more enjoyable for everyone involved.
      </p>--->
     
     <div class="container d-flex justify-content-center align-items-center">
      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators " >
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
  </div>
  
  <div class="carousel-inner customized-carousel">
    <div class="carousel-item active">
      <img class="d-block  img-rounded" src="Images/four.jpeg"  alt="..."   >
    </div>
    <div class="carousel-item">
      <img src="Images/one.jpeg" class="d-block " alt="..." >
    </div>
    <div class="carousel-item">
      <img class="d-block" src="Images/three.jpeg" alt="..." >
    </div>
     <div class="carousel-item">
      <img class="d-block " src="Images/two.jpeg" alt="..."  >
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
  </button>
</div>
</div>

</section>

  
</body>
</html>