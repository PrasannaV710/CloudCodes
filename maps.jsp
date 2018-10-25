<%-- 
    Document   : maps
    Created on : 5 Jul, 2018, 10:02:15 PM
    Author     : Rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="GetLocation()">
        <h1>Hello World!</h1>
        <select id="mod">
      <option value="DRIVING">Driving</option>
      <option value="WALKING">Walking</option>
      <option value="BICYCLING">Bicycling</option>
      <option value="TRANSIT">Transit</option>
        </select>
        <div id="map" style="width:100%;height:500px">   </div>	
        
        
		
	
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyBsj5cuHMDjaRe9oLXOhihcFe3pXd_KoCI"></script>
    <script type="text/javascript">	
            function $_GET(param) {
	var vars = {};
	window.location.href.replace( location.hash, '' ).replace( 
		/[?&]+([^=&]+)=?([^&]*)?/gi, // regexp
		function( m, key, value ) { // callback
			vars[key] = value !== undefined ? value : '';
		}
	);

	if ( param ) {
		return vars[param] ? vars[param] : null;	
	}
	return vars;
}
var zip1=$_GET("zip");
console.log(zip1);
        var a,b;
	function GetLocation() {
            var geocoder = new google.maps.Geocoder();
            var address = zip1+",India";
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    a= results[0].geometry.location.lat();
                    b = results[0].geometry.location.lng();
                    alert("Latitude: " + a + "\nLongitude: " + b);
                } else {
                    alert("Request failed.");
                }
            });
            var directionsService = new google.maps.DirectionsService();
         var directionsDisplay = new google.maps.DirectionsRenderer();
    
         var map = new google.maps.Map(document.getElementById("map"), {
           zoom:7,
           mapTypeId: google.maps.MapTypeId.ROADMAP
         });
        
         directionsDisplay.setMap(map);
         var layer = new google.maps.FusionTablesLayer({
          query: {
            select: '\'Geocodable address\'',
            from: '1ytnE1jL4mMfsFMEoHNuc3zmPwgPPSf3qZ6Tc48fp'
          }
        });
        layer.setMap(map);
         //directionsDisplay.setPanel(document.getElementById('panel'));
         modes(address,directionsService,directionsDisplay);
         document.getElementById("mod").addEventListener('change', function() { modes(address,directionsService,directionsDisplay);});
     
        }
        function modes(ar,directionsService,directionsDisplay){
         var selectedMode = document.getElementById("mod").value;
         var request = {
           origin: ar, 
           destination: 'Ettimadai',
           travelMode: google.maps.DirectionsTravelMode[selectedMode]
         };
    
         directionsService.route(request, function(response, status) {
           if (status === google.maps.DirectionsStatus.OK) {
             directionsDisplay.setDirections(response);
           }
         });
            }
	</script>	
		
	
        <%
            out.println(request.getParameter("zip")); %>
    </body>
</html>
