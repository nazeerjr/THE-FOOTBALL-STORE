<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Testimonial Carousel</title>
    <link rel="stylesheet" href="styles.css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    
    <style>
    
  body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f0f0f0;
}


 
button {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    border: none;
    cursor: pointer;
    padding: 10px;
    border-radius: 5px;
}

button:hover {
    background-color: rgba(0, 0, 0, 0.8);
}


  
  
   .customized-carousel{
     width:500px;
     height:300px;
      
    }
    
   .customized-carousel .carousel-item img{
   width:500px;
   height:300px;
  
   }   
   
   .btn
   {
    width:20%;
    margin-top:20%;
    margin-left:15%;
   
   }
      

.carousel-item {
      text-align: center;
    }
    .carousel-caption {
      position: static;
      margin-top: 15px;
      color:black;
    }
    .social-icons {
      margin-top: 10px;
       margin-down: 50px;
      margin-left:30%;
      
    }
    .social-icons img {
      width: 30px;
      margin: 0 5px;
     
    }  

      
    </style>
    
    
    
    
    
</head>
<body>
<form action="">
    
    <div class="container d-flex justify-content-center align-items-center">
  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
    </div>

    <div class="carousel-inner customized-carousel">
      <div class="carousel-item active">
        <img class="d-block img-rounded" src="Images/four.jpeg" alt="...">
       
      </div>
      <div class="carousel-item">
        <img src="Images/bg.jpg" class="d-block" alt="...">
       
      </div>
      <div class="carousel-item">
        <img class="d-block" src="Images/bg3.jpg" alt="...">
       
      </div>
      <div class="carousel-item">
        <img class="d-block" src="Images/bg1.jpg" alt="...">
        <div class="carousel-caption">
          <p>"Excellent gift options for every occasion. Very happy with my purchase!"</p>
        </div>
        <div class="social-icons">
          <a href="https://www.facebook.com" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="Facebook"></a>
          <a href="https://www.instagram.com" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png" alt="Instagram"></a>
          <a href="https://www.linkedin.com/in/your-profile" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png" alt="LinkedIn"></a>
          <a href="https://t.me/yourtelegramusername" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg" alt="Telegram"></a>
        </div>
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
 <div class="carousel-caption">
          <p>"This is the first testimonial. The gifts were amazing!"
              "The gift selection is outstanding. Great service and quality!"<br>Excellent gift options for every occasion. Very happy with my purchase!</p>
        </div>
        <div class="social-icons">
          <a href="https://www.facebook.com" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="Facebook"></a>
          <a href="https://www.instagram.com" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png" alt="Instagram"></a>
          <a href="https://www.linkedin.com/in/your-profile" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png" alt="LinkedIn"></a>
          <a href="https://t.me/yourtelegramusername" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg" alt="Telegram"></a>
        </div>
   
    
 
    <br><br>
    
     <a href="About.jsp"><button type="button" class="btn btn-success" ><b>Back</b></button></a>
        </form>                     
    
    <script src="scripts.js">
    
    
    
    </script>
</body>
</html>
