<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>

.image-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
    gap: 15px;
    padding: 10px;
    max-width: 1000px;
    margin: auto;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.grid-item {
    border: 2px solid #ccc;
    border-radius: 8px;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.grid-item:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.grid-item img {
    width: 100%;
    height: auto;
    display: block;
    border-bottom: 1px solid #ccc;
}

.grid-item:last-child img {
    border-bottom: none;
}

body
{

background-image: url('Images/img4.jpg');
}


</style>
</head>
<body bgcolor="lightred" align="center">
<h1><marquee>Gallery of Images</marquee></h1>

<h1>Images</h1>
 <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><a class="td-n d-ib pt-9 pb-10 plr-12 p-rel" referrerpolicy="unsafe-url" href="https://images.search.yahoo.com/search/images;_ylt=AwrO7m60QUxmcgQAkbtXNyoA;_ylu=Y29sbwNncTEEcG9zAzEEdnRpZAMEc2VjA3BpdnM-?p=only+gifts+images&amp;fr2=piv-web&amp;type=E211US1316G0&amp;fr=mcafee">
     <span class="d-ib ico ico-modern ico-images img"></span>Album</a></button><br>
  
   <h2><a href="Videos.jsp">Videos</a></h2>
<form action="">

<body>
    <div class="image-grid">
        <%
            List<String> images = new ArrayList<>();
            images.add("Images/th3.jpg");
            images.add("Images/i1.jpg");
            images.add("Images/bg3.jpg");
            images.add("Images/two.jpeg");
            images.add("Images/three.jpeg");
            images.add("Images/four.jpeg");
            
            images.add("Images/bg3.jpg");
            images.add("Images/bg1.jpg");
            images.add("Images/th2.jpeg");
            images.add("Images/th3.jpg");
            images.add("Images/th8.jpg");
            images.add("Images/bg.jpg");
            
            
            images.add("Images/th6.jpeg");
            images.add("Images/th1.jpeg");
            images.add("Images/th4.jpeg");
            images.add("Images/th9.jpg");
            images.add("Images/th5.jpg");
            images.add("Images/i2.jpeg");
            
            images.add("Images/thh.jpg");
            images.add("Images/th0.jpg");     
            images.add("Images/th6.jpeg");
            images.add("Images/th1.jpeg");
            images.add("Images/i3.jpeg");
            images.add("Images/th0.jpg");
            
            
            
            
            

            for(String image : images) {
        %>
            <div class="grid-item"><img src="<%= image %>" alt="Image"></div>
            
        <%
            }
        %>
    </div>
</body>
</form>
</body>
</html>