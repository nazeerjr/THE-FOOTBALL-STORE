<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places"></script>

<title>Insert title here</title>
</head>
<body>
<div id="map"></div>

<p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60926.93259103742!2d78.39662352167969!3d17.3669429!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb99a87a9ba943%3A0xe78068a107bc00e6!2sAMT%20Gifts!5e0!3m2!1sen!2sin!4v1716362846022!5m2!1sen!2sin"
     width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>

<script>
    var map;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: YOUR_LATITUDE, lng: YOUR_LONGITUDE},
            zoom: INITIAL_ZOOM_LEVEL
        });
    }
</script>










</body>
</html>