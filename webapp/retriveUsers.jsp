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
<% String name = request.getParameter("name"); %>
<html>
<head>
<meta charset="UTF-8">
 <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
<style>

 .profile-image{
   border-radius:50%;
   } 
body {
    text-align: center;
    background-color: pink;
    background-image: url('Images/img4.jpg'); /* Default background image */
    background-size: cover; /* Ensures the background image covers the entire body */
    background-repeat: no-repeat; /* Prevents the background image from repeating */
}
 
 form {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 50px;
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
 

         table {
            margin: auto;
            background-color:white;
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


     
        
  

</style>

 
</head>
<body align="center">

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
<h1>Visitors List</h1>
 

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

<table border="1">
<tr>
<td><h3>User Id</h3></td>
<td><h3>User Name</h3></td>
<td><h3>Email-ID</h3></td>
<td><h3>Photo</h3></td>
<td><h3>Role</h3></td>

</tr>
<%
try
{
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
int count=0;
String sql = "SELECT * FROM customers";
if (search != null && !search.isEmpty()) 
{
    sql += " WHERE cname LIKE '%" + search + "%'";
}
rs = statement.executeQuery(sql);
while(rs.next())
{
%>
<tr>
<td><%=rs.getInt("cid") %></td>
<td><%=rs.getString("cname") %></td>
<td><%=rs.getString("email") %></td>



<td><img src="data:image/jpeg;base64, <%= encodeImage(rs.getBlob("photo")) %>" width="100" height="100" /></td>
<td><b> <%=rs.getString("role") %></b></td>
<%-- <td><a href="Updateproduct.jsp?cid=<%=rs.getInt("cid")%>">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;  |
<a href="deleteproduct.jsp?cid=<%=rs.getInt("cid")%>">Delete</a></td>
 --%></tr>
<%

}
connection.close();
} 

catch (Exception e) 
{
e.printStackTrace();
}
%>
</table><br><br>

<%-- 
<%
out.println("<h2><a href='AddingUsers.jsp'>Add User's Detail</a></h2>");
%> 
  --%>



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
    </script>
</body>
</html>
