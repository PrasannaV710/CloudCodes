<%-- 
    Document   : test1
    Created on : 12 Jul, 2018, 11:40:49 PM
    Author     : Rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div id="map"></div>
        
    <script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 41.850033, lng: -87.6500523},
          zoom: 11
        });

        /*var layer = new google.maps.FusionTablesLayer({
          query: {
            select: '\'Geocodable address\'',
            from: '18f-obMpQGc_bdaWOh4-qTJIfds7JxqP7SH6n8Xp2'
          }
        });
        layer.setMap(map);*/
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrJUdZpj1gxsrMROArRRq8zwS796Fu_nw&callback=initMap">
    </script>
    </body>
</html>
