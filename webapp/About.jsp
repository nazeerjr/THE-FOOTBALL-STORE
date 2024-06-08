<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
<style>
   
  .head
    {
     text-align:center;
    }
    
    .center
    {
    text-align:center;
    }
    
     .customized-carousel{
     width:500px;
     height:300px;
      
    }
    
   .customized-carousel .carousel-item img{
   width:500px;
   height:300px;
  
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
  

  
 .btn btn-success
 {
   border-radius:25px;
 }

.h1
{
 font-size:30px;
}

.flip-box {
    background-color: transparent;
    width: 300px;
    height: 400px;
    perspective: 1000px;
    border-radius: 15px;
    overflow: hidden;
    align:center;
}

.flip-box-inner {
    position: relative;
    width: 100%;
    height: 100%;
    text-align: center;
    transition: transform 0.8s;
    transform-style: preserve-3d;
}

.flip-box:hover .flip-box-inner {
    transform: rotateY(180deg);
}

.flip-box-front, .flip-box-back {
    position: absolute;
    width: 100%;
    height: 100%;
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    border-radius: 15px;
}

.flip-box-front {
    background-color: #4CAF50;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
}

.flip-box-front img {
    width: 100%;
    height: 100%;
    border-radius: 15px;
}

.flip-box-back {
    background-color: #f44336;
    color: white;
    transform: rotateY(180deg);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 20px;
    box-sizing: border-box;
}

.flip-box-back p {
    margin-bottom: 20px;
}

.social-media {
    display: flex;
    justify-content: center;
    align-items: center;
}

.social-media a {
    margin: 0 10px;
}

.social-media img {
    width: 30px;
    height: 30px;
    transition: transform 0.3s;
}

.social-media img:hover {
    transform: scale(1.2);
}
 

    </style>
</head>
   
      
   
    </style>
     
<div class="container1">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
      </a>
   <nav class="navbar">
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="home.jsp" class="nav-link px-2 link-dark">Home</a></li>
        <li><a href="maps.jsp" class="nav-link px-2 link-dark">Location</a></li>
        <li><a href="gallery.jsp" class="nav-link px-2 link-dark">Gallery</a></li>
        <li><a href="contact.jsp" class="nav-link px-2 link-dark">Contact</a></li>
        <li><a href=" " class="nav-link px-2 link-dark"></a></li>
      </ul>
  </nav>
        

        <div class="text-end">
          <a href="Login.jsp"><button  type="button" class="btn btn-success"><b>Login</b></button></a>
          <a href="SignUp.jsp"><button type="button" class="btn btn-outline-warning" onclick="redirectToNextPage()">Sign-up</button></a>
          
    
  <a href="test.jsp"><button type="button" class="btn btn-success" ><b>Next</b></button></a>
     
   
 
        </div>
        
       

     
    
 </header>
 
  </div>
 
  
  
  
</head>



 <body>
   <center>
<div class="flip-box" >
    <div class="flip-box-inner">
        <div class="flip-box-front">
            <img src="Images/four.jpeg" alt="Cart">
        </div>
        <div class="flip-box-back">
            <p>Gift comes from the old Germanic root for “to give.” It referred to an act of giving, and then, to the thing being given. In Old English it meant the dowry given to a bride’s parents. 
            Present comes from the French for “to present.” A present is the thing presented or bestowed.</p>
            </div>
          
        </div>
    </div>
    </center><br><br>
      <div class="social-media">
                <a href="https://www.facebook.com" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="Facebook"></a>
                <a href="https://www.instagram.com" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png" alt="Instagram"></a>
               <a href="https://www.linkedin.com/in/your-profile" target="_blank">
                         <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png" alt="LinkedIn">
                      </a>
                  <a href="https://t.me/yourtelegramusername" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg" alt="Telegram"></a>
          
                      
               <a href="https://twitter.com/your-profile" target="_blank"><i class="fab fa-twitter"></i>
                    <img src="https://upload.wikimedia.org/wikipedia/en/6/60/Twitter_Logo_as_of_2021.svg" alt="Twitter">
                   </a>
                      
                      </div>

    <br><br>
    
    
   
       <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
    
    
 
    
    <script src="scripts.js" defer>
    
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slide');
    const totalSlides = slides.length;

    document.querySelector('.next').addEventListener('click', () => {
        slides[currentSlide].classList.remove('active');
        currentSlide = (currentSlide + 1) % totalSlides;
        slides[currentSlide].classList.add('active');
    });

    document.querySelector('.prev').addEventListener('click', () => {
        slides[currentSlide].classList.remove('active');
        currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
        slides[currentSlide].classList.add('active');
    });

    window.addEventListener('DOMContentLoaded', () => {
        slides[currentSlide].classList.add('active');
    });

    
    
   
    </script>
    
      
</body>
</html>