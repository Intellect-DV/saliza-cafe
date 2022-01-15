<%--
  Created by IntelliJ IDEA.
  User: NADHIRAH
  Date: 11/1/2022
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>SIGN UP</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <link rel="stylesheet" href="css/signup.css">
    <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="signup-box">
        <div class="left">

        </div>
        <div class="right">
            <h2>REGISTER ACCOUNT</h2>
            <br>
            <br>
            <form action="" method="">

                <input type="text" placeholder="username" name="username" class="inp" required>

                <input type="text" placeholder="name" name="name" class="inp" required>

                <input type="email" placeholder="email address" name="email" class="inp" required>

                <input type="password" placeholder="password" name="password" class="inp" required>

                <input type="password" placeholder="confirm password" name="confirm-password" class="inp" required>

                <input type="submit" value="Register" class="inp submit-inp">

                <a href="index.jsp">
                    <input type="button" value="Back" class="inp submit-inp">
                </a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
