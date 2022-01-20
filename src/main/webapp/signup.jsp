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
    <title>Sign Up | SalizaEja Cafe</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <%-- Google Font --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;600;700&display=swap" rel="stylesheet">
    <%-- Boilerplate --%>
    <link rel="stylesheet" href="css/boilerplate.css">

    <link rel="stylesheet" href="css/signup.css">

    <%-- AXIOS - make  http request --%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="js/signup.js" defer></script>
</head>
<body>
<div class="container">
    <div class="signup-box">
        <div class="left"></div>
        <div class="right">
            <h2>REGISTER ACCOUNT</h2>
            <br>
            <br>
            <form id="signup-form">

                <input type="text" placeholder="username" name="username" class="inp" autocomplete="off" required>

                <input type="text" placeholder="name" name="name" class="inp" autocomplete="off" required>

                <input type="email" placeholder="email address" name="email" class="inp" autocomplete="off" required>

                <input type="password" placeholder="password" id="password" name="password" class="inp" autocomplete="off" required>

                <input type="password" placeholder="confirm password" id="confirm-password" name="confirm-password" class="inp" autocomplete="off" required>
                <div id="message" class="message">Please wait</div>
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
