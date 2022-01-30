<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 28/1/2022
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .button1 {
            background-color: White; /* Green */
            border-radius: 10px;
            color: black;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            -webkit-transition-duration: 0.4s;
            transition-duration: 0.4s;
            float: left;
        }
        .button2 {
            background-color: green; /* Green */
            border-radius: 10px;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            -webkit-transition-duration: 0.4s;
            transition-duration: 0.4s;
            float: right;
        }

        .button:hover {
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
        }
    </style>
</head>
<body>

<div class="w3-container ">
    <div class="w3-dropdown-click w3-right">
        <button onclick="myFunction()" class="w3-button w3-black">Click Me!</button>
        <div id="Demo" class="w3-dropdown-content w3-bar-block w3-border w3-card-4" style="width: 500%; right:0">
            <header class="w3-container">
                <h5>Shopping Cart</h5>
            </header>
            </br>
            <div class="w3-container" style="width: 100%">
                <table class="w3-table w3-striped">
                    <tr>
                        <td>Jill</td>
                        <td>Smith</td>
                        <td>50</td>
                    </tr>
                    <tr>
                        <td>Eve</td>
                        <td>Jackson</td>
                        <td>94</td>
                    </tr>
                    <tr>
                        <td>Adam</td>
                        <td>Johnson</td>
                        <td>67</td>
                    </tr>
                </table>
            </div>
            </br>
            <div class="w3-container " style="width: 100%">
                <table class="w3-table w3-bordered">
                    <tr>
                        <td>Total</td>
                        <td>rm100</td>
                    </tr>
                </table>
            </div>
            </br>
            <footer class="w3-container">
                <button class="button button1"><a href="#"></a>View Cart</button>
                <button class="button button2"><a href="#"></a>Checkout</button>
            </footer>
        </div>
    </div>
</div>

<script>
    function myFunction() {
        var x = document.getElementById("Demo");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
</script>
</body>
</html>
