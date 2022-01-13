<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SalizaEja Cafe</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<%@ include file="account.html"%>


<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
        <a href="index.jsp" class="w3-bar-item w3-button">SalizaEja Cafe</a>
        <!-- Right-sided navbar links. Hide them on small screens -->
        <div class="w3-right w3-hide-small">
            <a href="#about" class="w3-bar-item w3-button">About</a>
            <a href="signup-account.jsp" class="w3-bar-item w3-button">Sign Up</a>
            <a href="login-account.jsp" class="w3-bar-item w3-button">Login</a>
        </div>
    </div>
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1600px;min-width:500px" id="home">
    <img src="download/satu.jpg" alt="Hamburger Catering" width="1600" height="800">
    <div class="w3-display-bottomleft w3-padding-large w3-opacity">
        <h1 class="w3-xxlarge">Moh Ler Order!</h1>
    </div>
</header>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px">

    <!-- About Section -->
    <div class="w3-row w3-padding-64" id="about">
        <div class="w3-col m6 w3-padding-large w3-hide-small">
            <img src="download/dua.jpg" class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="600" height="750">
        </div>

        <div class="w3-col m6 w3-padding-large">
            <h1 class="w3-center">About SalizaEja Cafe</h1><br>
            <h5 class="w3-center">Tradition since 1889</h5>
            <p class="w3-large">The Cafe was founded in 2015 by Puan Saliza Binti Ishar,
                an operate at UiTM Tapah since 2015. We are providing several type of foods
                for our customers.
                We only use seasonal ingredients.</p>
            <p class="w3-large w3-text-grey w3-hide-medium">
                To our customers, WELCOME to SalizaEja Cafe and please enjoy your meal happily.</p>
        </div>
    </div>


    <!-- End page content -->
</div>

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32">
    <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">copyright 2022 by IntellectDV</a></p>
</footer>

</body>
</html>