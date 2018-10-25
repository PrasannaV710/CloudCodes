<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <title>Google Visualization API Sample</title>
  <script type="text/javascript" src="http://www.google.com/jsapi"></script>
  <script type="text/javascript">
    /*google.charts.load('current', {
        'packages':['geochart'],
        // Note: you will need to get a mapsApiKey for your project.
        // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
        'mapsApiKey': 'AIzaSyBsj5cuHMDjaRe9oLXOhihcFe3pXd_KoCI'
      });*/
    google.load('visualization', '1', {packages: ['geochart']});
    google.setOnLoadCallback(drawVisualization);

        function drawVisualization() {
          var query = new google.visualization.Query('https://docs.google.com/spreadsheets/d/1kfgCESFkwPF43rztVa1nOKqmQwn9CS6_Fp4ruxEsNiI/edit?usp=sharing');
          query.send(handleQueryResponse);
        }
        
        function handleQueryResponse(response) {
          if (response.isError()) {
            alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
            return;
          }
          var options = {
            displayMode: 'regions',
            resolution: 'countries',
            width: 640, 
            height: 480};
        
          var data = response.getDataTable();
          var chart = new google.visualization.GeoChart(document.getElementById('visualization'));
          chart.draw(data, options);
        }

    
  </script>
</head>
<body style="font-family: Arial;border: 0 none;">
    
<div id="visualization"></div>
<h1>Rohith</h1>
</body>
</html>