<%--
  Created by IntelliJ IDEA.
  User: NADHIRAH
  Date: 11/1/2022
  Time: 1:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<html>
<head>
    <title>Login | SalizaEja Cafe</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="signin-box">
        <div class="left">

        </div>
        <div class="right">
            <h2>SIGN IN</h2>
            <div class="toggle-parent">
                <input type="checkbox" id="toggle-btn" class="toggle-btn">
            </div>

            <form class="loginCustomer" action="" method="post">

                <input type="text" placeholder="username" name="username" class="inp">

                <input type="password" placeholder="password" name="password" class="inp" style="margin-bottom: 40px;">

                <div class="register-link">Do not register yet? <a href="signup.jsp"> Register Now </a> </div>


                <input type="submit" value="Login" class="inp submit-inp">

            </form>

            <form class="loginStaff" action="" method="post">

                <input type="text" placeholder="username" name="username" class="inp">

                <input type="password" placeholder="password" name="password" class="inp">

                <input type="submit" value="Login" class="inp submit-inp">

            </form>


            <a href="index.jsp">
                <input type="button" value="Back" class="inp submit-inp">
            </a>
        </div>
    </div>
</div>
<script>
    window.addEventListener('DOMContentLoaded', function(event){
        document.querySelector('#toggle-btn').addEventListener('click', function(event) {
            const toggleBtn = event.target;
            const custForm = document.querySelector(".loginCustomer");
            const staffForm = document.querySelector(".loginStaff");
            if(toggleBtn.checked) {
                custForm.style.display  = "none";
                staffForm.style.display = "block";
            } else {
                custForm.style.display  = "block";
                staffForm.style.display = "none";
            }
        })
    })
</script>
</body>
</html>