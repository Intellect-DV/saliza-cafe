<%--
  Created by IntelliJ IDEA.
  User: NADHIRAH
  Date: 11/1/2022
  Time: 5:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>UPDATE ACCOUNT</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">

</head>
<body>
<%@ include file="updateAccountUser.html"%>
<div class="container">
    <div class="signup-box">
        <div class="left">

        </div>
        <div class="right">
            <h2>UPDATE ACCOUNT</h2>
            <br>
            <br>
            <form action="" method="">

                <input type="text" placeholder="username" name="" class="inp">

                <input type="text" placeholder="phone number" name="" class="inp">

                <input type="text" placeholder="email address" name="" class="inp">

                <input type="password" placeholder="password" name="" class="inp">

                <input type="password" placeholder="confirm password" name="" class="inp">

                <input type="reset" value="Update Account" class="inp submit-inp">
                <input type="submit" value="Back" class="inp submit-inp">
            </form>
        </div>
    </div>
</div>
</body>
</html>