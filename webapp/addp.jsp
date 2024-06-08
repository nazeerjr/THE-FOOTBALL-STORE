<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<% String name = request.getParameter("name"); %>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Userdata</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
       <!--  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    -->
   
   
<style>
body {
    text-align: center;
    background-color: pink;
    background-image: url('Images/img4.jpg'); /* Default background image */
    background-size: cover; /* Ensures the background image covers the entire body */
    background-repeat: no-repeat; /* Prevents the background image from repeating */
}
   .profile-image{
   border-radius:50%;
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
  

  
 .btn btn-success
 {
   border-radius:25px;
 }

        .welcome-message {
            font-size: 2em;
            text-align: center;
            margin-right:15%;
            
        }
        .rounded-image {
            position: absolute;
            top: 30%;
            right: 20px;
            transform: translateY(-50%);
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
        }
        .rounded-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .text-end {
    display: flex; /* Use flexbox to arrange items */
    justify-content: flex-end; /* Align items to the end of the container (right in this case) */
    align-items: center; /* Center items vertically */
}

.logout-link {
    margin-left: 10px; /* Optional: Add margin between the button and the image */
}
        

 
 form {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }

        
        .form-control {
            width: 300px;
            padding: 10px 15px;
            border: 2px solid #4CAF50;
            border-radius: 25px 0 0 25px;
            outline: none;
            transition: all 0.3s ease-in-out;
        }

        .form-control:focus {
            border-color: #3e8e41;
            box-shadow: 0 0 10px #4CAF50;
        }

        /* Styling the search button */
        .btn {
            padding: 10px 20px;
            border: 2px solid #4CAF50;
            border-radius: 0 25px 25px 0;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .btn:hover {
            background-color: #3e8e41;
            border-color: #3e8e41;
        }

        .btn:focus {
            outline: none;
        }

     .button {
	display: flex;
	height: 50px;
	padding: 0;
	background: #009578;
	border: none;
	outline: none;
	border-radius: 5px;
	overflow: hidden;
	font-family: "Quicksand", sans-serif;
	font-size: 16px;
	font-weight: 500;
	cursor: pointer;
}

.button:hover {
	background: #008168;
}

.button:active {
	background: #006e58;
}

.button__text,
.button__icon {
	display: inline-flex;
	align-items: center;
	padding: 0 24px;
	color: #fff;
	height: 100%;
}

.button__icon {
	font-size: 1.5em;
	background: rgba(0, 0, 0, 0.08);
}
 
table
{
  margin-left: 20%;
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
  
    


  
 .btn btn-success,primary
 {
   border-radius:25px;
   text-decoration: none !important;
 }


  .table-container {
            display: flex;
            margin-right:20%;
            margin-left:10%
            justify-content: center;
        }      


@media only screen and (max-width: 992px) {
    .listProduct{
        grid-template-columns: repeat(3, 1fr);
    }
}


s
@media only screen and (max-width: 768px) {
    .listProduct{
        grid-template-columns: repeat(2, 1fr);
    }
}
   
 .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    background-color: #f8f8f8;
    border-bottom: 1px solid #ddd;
}


   .head
    {
     text-align:center;
    }
    
    .center
    {
    text-align:center;
    }
    
    
  
  .container1
  {
    background-color:DarkCyan;
  }
  
  /* body {
  transition: background-color 0.3s, color 0.3s;
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
} */



</style>
<body>

<div class="container1">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
      </a>
  <nav class="navbar">
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="fetching.jsp?name=<%=name  %>" class="nav-link px-2 link-dark"><h4>Admin</h4></a></li>
       
        <li><a href="addp.jsp?name=<%=name  %>" class="nav-link px-2 link-dark"><h5>Add Gifts</h5></a></li>
     
        <li><a href="retriveUsers.jsp?name=<%=name  %>" class="nav-link px-2 link-dark"><h5>Visitors List</h5></a></li>
        <li><a href="ProductAnalysis.jsp?name=<%=name  %>" class="nav-link px-2 link-dark"><h5>Product Analysis</h5></a></li>
          
     
      </ul>
  </nav>
  </nav>
        <!--  <form class=" ">
          <button type="button"  class="btn btn-outline-info"><input type="search" class="form-control form-control-dark" placeholder="Search..."></button>
          
        </form> -->
       
        <div class="text-end">
   
    <img src="<%= request.getContextPath() %>/Images/bg1.jpg" alt="Profile Image" width="50px" height="50px" class="profile-image">
     <a href="login.jsp" class="logout-link">
        <button type="button" class="btn btn-success"><b>Logout</b></button>
    </a>
</div>
        

                </header>
            </div>
 
                            <!--  <a href="" type="button" class="btn btn-outline-primary me-2">
                             
                                <img style="width:50px; height:50px; border-radius:50%;" src="Images/profile.jpg" />    </a>
                           -->
                          
     <!--                      
       </div>
       <div class="mode-toggle" onclick="toggleMode()">
    <div class="switch"></div>
    
  </div> -->

                     

</head>
<body align="center">

<%

InputStream photoStream = null;


%>


<marquee><h1 align="center">Welcome To Gift Store!!....</h1></marquee>
 
    
<%
String search = request.getParameter("search");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "gifts";
String userid = "root";
String password = "root";
try
{
Class.forName(driver);
}
catch (ClassNotFoundException e)
{
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
byte[ ] imgData = null ;
%>

<div class="container mt-4">
                
        <div class="row">
            <div class="col-10 table-container">
          
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th><h3>Product ID</h3></th>
                            <th><h3>Product Name</h3></th>
                            <th><h3>Price</h3></th>
                            <th><h3>Image</h3></th>
                            <th><h3>Update</h3></th>
                            <th><h3>Delete</h3></th>
                           
                           
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        try {
                            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                            statement = connection.createStatement();
                            int count = 0;
                            String sql = "SELECT * FROM products";
                           
                            rs = statement.executeQuery(sql);
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt(1) %></td>
                            <td><%= rs.getString(2) %></td>
                             <td><%= rs.getString(3) %></td>
                            <td><img src="data:image/jpeg;base64,<%= encodeImage(rs.getBlob(4)) %>" width="100" height="100" /></td>
                           <td><a href="UpdateProduct.jsp?pid=<%=rs.getInt("pid")%>&name=<%= name %> ">Edit</a><!-- &nbsp;&nbsp;&nbsp;&nbsp; --> </td>
                               <td> <a href="deleteproduct.jsp?pid=<%=rs.getInt("pid")%>&name=<%= name %> "  onclick="return confirm('Are You sure you want to delete this Product')" >Delete</a></td>
                           
                        
                        </tr>
                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) rs.close();
                            if (statement != null) statement.close();
                            if (connection != null) connection.close();
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>








<h3><a href='addproduct.jsp?name=<%= name %>' class="btn btn-success">AddItems</a></h3>






<%!
String encodeImage(Blob blob) {
    try {
        InputStream inputStream = blob.getBinaryStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        byte[] imageBytes = outputStream.toByteArray();
        String base64Image = new String(Base64.encodeBase64(imageBytes));
        inputStream.close();
        outputStream.close();
        return base64Image;
    } catch (Exception e) {
        e.printStackTrace();
        return ""; 
    }
}
%>
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






        function filterProducts() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("productTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; 
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
      
        
        let iconCart = document.querySelector('.icon-cart');
        let iconCartSpan = document.querySelector('.icon-cart span');

        

        iconCart.addEventListener('click', () => {
            body.classList.toggle('showCart');
        })
        closeCart.addEventListener('click', () => {
            body.classList.toggle('showCart');
        })
        
          function addToCart(productName,Price,Image) {
        var cart = JSON.parse(localStorage.getItem('cart')) || [];
        var existingProduct = cart.find(function(item) {
            return item.pname === productname;
        });

        if (existingProduct) {
            existingProduct.quantity += 1;
        } else {
            cart.push({ name: productname, price: Price, quantity: 1 });
        }

    document.addEventListener('DOMContentLoaded', function() {
        const cartCountElement = document.getElementById('cart-count');
        let cartCount = 0;

        document.querySelectorAll('.add-to-cart').forEach(button => {
            button.addEventListener('click', () => {
                cartCount++;
                cartCountElement.textContent = cartCount;
            });
        });
    });
       
    </script>
</body>
</html>
