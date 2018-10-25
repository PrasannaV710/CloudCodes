<%-- 
    Document   : Test
    Created on : 23 Jun, 2018, 12:06:12 PM
    Author     : Rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
    </head>
    <body onload="assign()">
       
        <h1 style="text-align: center;color: red;">Registration Form</h1>
        <form action="/WebApplication3/Form" id="pass1" padding='0' method="POST">
            <table border='0' width='7px' cellpadding='0' cellspacing='0'>
                <tr>
                    <td>UserName:</td><td><input type="text" name="username" required/></td>
                </tr>
                
                <tr><td>Password:</td><td><input type="password" name="password" required/></td></tr>
                <tr><td>Name:</td><td><input type="text" name="names" required /></td></tr>
                <tr><td>Address:</td><td><input type="text" name="address"/></td></tr>
                <tr><td>Country:</td><td><select name="country" size="1">
                <option value="india">India</option>
                <option value="unitedstates">US</option>
                <option value="unitedkingdom">UK</option>
            </select></td></tr>
                <tr><td>City:</td><td><input type="text" name="city" required /></td></tr>
            <tr><td>ZIP Code:</td><td><input type="number" name="zip" required/></td></tr>
            <tr><td>Email:</td><td><input type="email" name="email" required/></td></tr>
            <tr><td>Sex:</td><td><input type="radio" name="gender" value="male" required/>Male
            <input type="radio" name="gender" value="female" required/>Female</td></tr>
            <tr><td>Language:</td><td><input type="checkbox" name="lang" value="eng" required/>English
            <input type="checkbox" name="lang" value="noteng" />Non-English</td></tr>
            <tr><td>About:<textarea rows="8" cols="20"></textarea></td></tr>
            
            <tr><td><h3 style="color:grey;">Captcha</h3></td></tr>
             <td><div id="one" name ="num1" style="color:red;"></div>
            <div id="two" name="operator" style="color:red;"></div>
            <div id="three" name ="num2" style="color:red;"></div></td>
             <td><input type="number" name="result" required></td></tr>
            
            <tr><td><input type="submit" value="Submit" onclick="pass()" /></td></tr>
            </table>    
        </form>
        <script>
            var w,x,y,z;
            var oper=['+','-','*','/'];
            function assign(){
                w=Math.floor(Math.random() * 4);
                y=oper[w];
                x=Math.floor(Math.random() * 50)+50;
                z=Math.floor(Math.random() * 50);
                document.getElementById("one").innerHTML =x;
                document.getElementById("two").innerHTML =y;
                document.getElementById("three").innerHTML =z;
            }
            
            function pass(){
                var str="/WebApplication3/Form?a="+x+"&b="+w+"&c="+z;
                document.getElementById("pass1").action=str;
                //document.getElementById("pass1").submit();
            }
        </script>
    </body>
</html>
