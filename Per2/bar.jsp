<%-- 
    Document   : bar
    Created on : 7 Sep, 2018, 10:13:30 AM
    Author     : Rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["imagebarchart"]});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Team', 'Games', 'Points'],
          ['CSK',  14, 18],
          ['SRH', 14, 18],
          ['KKR',  14, 16],
          ['RR',  14, 14],
          ['MI',  14,12],
          ['RCB',  14,12],
          ['KXIP', 14,12],
          ['DD',  14,10]
        ]);

        var chart = new google.visualization.ImageBarChart(document.getElementById('chart_div'));

        chart.draw(data, {width: 800, height: 480, min: 0});
      }
    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 400px; height: 240px;"></div>
  </body>
</html>
