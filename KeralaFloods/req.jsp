<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
        <style>
            body{
                background-color:powderblue;
            }
            div{
                float:left;
                
            }
            td{
                padding:2px;
            }
            section{
                background-color:powderblue;
            }
        </style> 
       
        <h1 style="text-align: center;color: red;">Registration Form</h1>
        <form action="/floods/request">
            <table border='0' width='7px' cellpadding='0' cellspacing='0'>
               
                <tr><td>District</td><td><select name="dis" size="1">
                <option value="Palakkad">Palakkad</option>
                <option value="Kochi">Kochi</option>
                <option value="Coimbatore">Coimbatore</option>
                <option value="Salem">Salem</option>
                <option value="Trivandrum">Trivandrum</option>
            </select></td></tr>
                <tr><td>Location:</td><td><input type="text" name="loc" required/></td></tr>
                <tr><td>Name:</td><td><input type="text" name="fname" required /></td></tr>
                <tr><td>Phone Number:</td><td><input type="tel" name="pnum" required/></td></tr>
                <tr><td>Required Items:</td><td><input type="checkbox" name="req0" value="Food" />Food
                <input type="checkbox" name="req1" value="Water" />Water
                <input type="checkbox" name="req2" value="Cloth" />Clothing
                <input type="checkbox" name="req3" value="Medicine" />Medicine</td></tr>
            <tr><td><button type="button" onclick="download(this.form)" id="submitButton">Download</button></td></tr>
            <tr><td><input type="submit" value="Insert into Bucket" /></td></tr>
            
            </table> 
            <p id="date"></p>
        </form>
    </body>
    `   <script>
            document.getElementById("date").innerHTML= new Date();
        </script>
</html>
