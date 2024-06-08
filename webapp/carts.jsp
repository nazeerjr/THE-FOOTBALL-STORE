<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
   <!--  <link rel="stylesheet" href="css/styles.css">
   
    -->
   
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
  
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  
   <script src="js/script.js" defer></script>

</head>
    
    
    
    <style>
   
   @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;500;600&display=swap');

*{
   font-family: 'Nunito', sans-serif;
   margin:0; padding:0;
   box-sizing: border-box;
   outline: none; border:none;
   text-decoration: none;
   transition: all .2s linear;
   text-transform: capitalize;
}

html{
   font-size: 62.5%;
   overflow-x: hidden;
}

body{
   background: #eee;
}

.container{
   max-width: 1200px;
   margin:0 auto;
   padding:3rem 2rem;
}

.container .title{
   font-size: 3.5rem;
   color:#444;
   margin-bottom: 3rem;
   text-transform: uppercase;
   text-align: center;
}

.container .products-container{
   display: grid;
   grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
   gap:2rem;
}

.container .products-container .product{
   text-align: center;
   padding:3rem 2rem;
   background: #fff;
   box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
   outline: .1rem solid #ccc;
   outline-offset: -1.5rem;
   cursor: pointer;
}

.container .products-container .product:hover{
   outline: .2rem solid #222;
   outline-offset: 0;
}

.container .products-container .product img{
   height: 18rem;
}

.container .products-container .product:hover img{
   transform: scale(.9);
}

.container .products-container .product h3{
   padding:.5rem 0;
   font-size: 2rem;
   color:#444;
}

.container .products-container .product:hover h3{
   color:#27ae60;
}

.container .products-container .product .price{
   font-size: 2rem;
   color:#444;
}

.products-preview{
   position: fixed;
   top:0; left:0;
   min-height: 100vh;
   width: 100%;
   background: rgba(0,0,0,.8);
   display: none;
   align-items: center;
   justify-content: center;
}



@media (max-width:991px){

   html{
      font-size: 55%;
   }

}

@media (max-width:768px){

   .products-preview .preview img{
      height: 25rem;
   }

}

@media (max-width:450px){

   html{
      font-size: 50%;
   }

}
   
  .btn {
    font-size: 15px; 
    padding: 10px 20px;
    margin-left:50%;
    }
    .h1{
         position: absolute;
            top: 3%;
            right: 50px;
           
          
           
        }
    
    
   </style>
   
<body>
   
<div class="container">

   <div><h3 class="title"> products </h3></div>
<div class="h1">

 <a href="Videos.jsp"><button type="submit" class="btn btn-primary" size="20">Next</button>
  </a>
</div>

   <div class="products-container">

      <div class="product" data-name="p-1">
         <img src="Images/c1.jpg" alt="">
         <h3>Personalized Gifts</h3>
         <div class="price"></div>
      </div>

      <div class="product" data-name="p-2">
         <img src="Images/c2.png" alt="">
         <h3>Experience Gifts</h3>
         <div class="price"></div>
      </div>

      <div class="product" data-name="p-3">
         <img src="Images/c3.jpg" alt="">
         <h3>DIY Gifts</h3>
         <div class="price"></div>
      </div>

      <div class="product" data-name="p-4">
         <img src="Images/c4.jpg" alt="">
         <h3>Charitable Gifts</h3>
         <div class="price"></div>
      </div>

      <div class="product" data-name="p-5">
         <img src="Images/c5.jpg" alt="">
         <h3>Accessories</h3>
         <div class="price"></div>
      </div>
        <div class="product" data-name="p-5">
         <img src="Images/c5.jpg" alt="">
         <h3>Accessories</h3>
         <div class="price"></div>
      </div>
      
        <div class="product" data-name="p-5">
         <img src="Images/c5.jpg" alt="">
         <h3>Accessories</h3>
         <div class="price"></div>
      </div>
      
        <div class="product" data-name="p-5">
         <img src="Images/c5.jpg" alt="">
         <h3>Accessories</h3>
         <div class="price"></div>
      </div>

      <div class="product" data-name="p-6">
         <img src="Images/c6.jpeg" alt="">
         <h3>Home Decor </h3>
         <div class="price"></div>
      </div>
</div>
   </div><br>

<!-- 
  <a href="viewproduct.jsp"><button type="submit" class="btn btn-primary" size="20">Back</button>
  </a>

 <a href="Videos.jsp"><button type="submit" class="btn btn-primary" size="20">Back</button>
  </a> -->


  <a href="viewproduct.jsp"><button type="submit" class="btn btn-primary" size="20">Back</button>
  </a>


 <script src="js/scripts.js" defer>
    
    let preveiwContainer = document.querySelector('.products-preview');
    let previewBox = preveiwContainer.querySelectorAll('.preview');

    document.querySelectorAll('.products-container .product').forEach(product =>{
      product.onclick = () =>{
        preveiwContainer.style.display = 'flex';
        let name = product.getAttribute('data-name');
        previewBox.forEach(preview =>{
          let target = preview.getAttribute('data-target');
          if(name == target){
            preview.classList.add('active');
          }
        });
      };
    });

    previewBox.forEach(close =>{
      close.querySelector('.fa-times').onclick = () =>{
        close.classList.remove('active');
        preveiwContainer.style.display = 'none';
      };
    });
    </script>
</body>
</html>
