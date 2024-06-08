<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>

<%@ page import="org.apache.commons.io.IOUtils" %>

<% String name = request.getParameter("name"); %>
<%





%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    


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
        
        
        
          
    </style>
    <title>fetch data</title>
    </head>

     
     
     
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
 


    
    

<!-- <center> -->
<!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><a class="td-n d-ib pt-9 pb-10 plr-12 p-rel" referrerpolicy="unsafe-url" href="https://images.search.yahoo.com/search/images;_ylt=AwrO7m60QUxmcgQAkbtXNyoA;_ylu=Y29sbwNncTEEcG9zAzEEdnRpZAMEc2VjA3BpdnM-?p=only+gifts+images&amp;fr2=piv-web&amp;type=E211US1316G0&amp;fr=mcafee">
     <span class="d-ib ico ico-modern ico-images img"></span>Images</a></button>
      -->


 

	
   <div>
 

 </div>
    
 
 <div align="center"> 
     <h1  style="background-color:white; width:fit-content" >Welcome <%= name %> </h1>   
</div>
<br>
<br>
<<%-- h3>Data from Admin</h3>

<table border="1" >
<tr>
<td>First name</td>
<td>Last Name</td>
<td>Username</td>
<td>Email</td>
<td>Phone Number</td>
<td>Address</td>


                      

 
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gifts", "root", "Lali@1234");
statement=connection.createStatement();
String sql ="select * from signup";
resultSet = statement.executeQuery(sql);
while(resultSet.next())
{
%>
<tr>
<td><%=resultSet.getString(1) %></td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getString(3) %></td>
<td><%=resultSet.getString(4) %></td>
<td><%=resultSet.getString(7) %></td>
<td><%=resultSet.getString(8) %></td>
 --%>
<%-- <td><img src="data:image/jpeg;base64, <%= encodeImage(resultSet.getBlob(5)) %>" width="100" height="100" /></td> --%>
<%-- <td><a href="Updateproduct.jsp?cid=<%=resultSet.getInt("cid")%>">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;  |
<a href="deleteproduct.jsp?cid=<%=resultSet.getInt("cid")%>">Delete</a></td>
 --%>
 
 <%-- </tr>
  
  <%  
                    photoStream = resultSet.getBinaryStream("photo");
                    if (photoStream != null) {
                %>  
                     <tr>
                         <td>Photo:</td> 
                        <td><img src="data:image/jpeg;base64,<%= Base64.encodeBase64String(IOUtils.toByteArray(photoStream)) %>" width="80px" height="80px" /></td>
                    </tr> 
                <%  
                    } else {
                %>
                    <tr>
                        <td>No photo available</td>
                    </tr>
                <%  
                    }
  
                    %>
 </tr>
<%

}
connection.close();
} catch (Exception e)
{
e.printStackTrace();

}
%> --%>
<%-- 
<%
out.println("<h1><a href='AddingUsers.jsp'>Adding User's Detail</a></h1>");
%>  --%>


<!--  </center> -->
</body>
</html>
