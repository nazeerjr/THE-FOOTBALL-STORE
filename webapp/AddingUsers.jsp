<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
  
  body {
        background-color: lightblue;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    table {
        width: 800px;
        height:300px;
        background-color: #ff5733;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #000;
        padding: 10px;
        text-align: center;
    }
    form {
        text-align: center;
    }
    h1 {
        margin-top: 0;
    }
    
    .btn-custom {
            padding: 10px 20px;
            border: 2px solid #4CAF50;
            border-radius: 0 25px 25px 0;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .btn-custom:hover {
            background-color: #3e8e41;
            border-color: #3e8e41;
        }

        .btn-custom:focus {
            outline: none;
        }

       
    
    
</style>

</head>
<body>



<form action="Insertdetail.jsp" method="post">

<h1>Enter User Details</h1>
<table >
                 <tr>
                 <b><td>UserId</td></b>
                 <td><input type="text" name="cid" /></td>
                  </tr>
                  
                  
               
                 <tr>
                 <b><td>User name</td></b>
                 <td><input type="text" name="cname" /></td>
                  </tr>
                  
                   <tr>
                  <td>User Email</td>
                  <td><input type="text" name="email" required/></td>
                  </tr>
                   <tr>
                  <td>password</td>
                  <td><input type="password" name="password" required/></td>
                  </tr>
                   
                   
                   <tr>
                 <td> Price</td>
                 <td><input type="text" name="cprice" /></td>
                  </tr>
                  
                  <tr>
                 <b><td>Order Name</td></b>
                 <td><input type="text" name="corder" /></td>
                  </tr>
                  <tr>
                  <td>UserImage</td>
                  <td><input type="file" name="photo"></input></td></br>
                  </tr>
                 
                 </table><br><br>
                 <input type="submit" value="Submit" class="btn btn-custom">
                 
                 
                <!--  <a href="reteiveUsers.jsp"><button type="submit" value="previous" class="btn btn-custom"></button></a>
                 -->
                 </form>
 

 <script>
        
       
        const submitButton = document.querySelector('.btn-custom');
        submitButton.addEventListener('mouseover', () => {
            submitButton.style.backgroundColor = '#2e7031';
            submitButton.style.borderColor = '#2e7031';
        });

        submitButton.addEventListener('mouseout', () => {
            submitButton.style.backgroundColor = '#4CAF50';
            submitButton.style.borderColor = '#4CAF50';
        });
        
        const searchForm = document.getElementById('searchForm');
        searchForm.addEventListener('submit', (event) => {
            event.preventDefault(); 
            const query = searchInput.value.trim();
            if (query === '') {
                alert('Please enter a search term.');
            } else {
                alert('Form submitted successfully!');
            }
        });
        
    </script>

 </body>