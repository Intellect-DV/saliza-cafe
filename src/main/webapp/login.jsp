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
    <title>LOGIN</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <%@ include file="login.html"%>
    <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="box">
        <input type="checkbox" class="toggle-btn" name="">
        <div class="loginStaff">
            <form action="" method="">
                <div class="input-group">
                    <input type="text" placeholder="username" name="" class="inp">
                </div>

                <div class="input-group">
                    <input type="text" placeholder="*******" name="" class="inp">
                </div>

                <div class="input-group" style="margin-top: 20px;">
                    <input type="submit" value="Login" class="inp submit-inp">
                </div>
                <br>
                <h2>Do not register yet? <a href="signup.jsp"> Register Now </a> </h2>

            </form>
        </div>

        <div class="loginCustomer">
            <form action="" method="">
                <div class="input-group">
                    <input type="text" placeholder="username" name="" class="inp">
                </div>

                <div class="input-group">
                    <input type="text" placeholder="*******" name="" class="inp">
                </div>

                <div class="input-group" style="margin-top: 20px;">
                    <input type="submit" value="Login" class="inp submit-inp">
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>