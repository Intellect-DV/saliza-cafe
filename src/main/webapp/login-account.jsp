<%--
  Created by IntelliJ IDEA.
  User: NADHIRAH
  Date: 5/1/2022
  Time: 12:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LOGIN</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
    .container
    {
        background-color : gainsboro;
        margin-left: 500px;
        margin-right: 500px;
        margin-top: 100px;
        font-family: "Times New Roman", Georgia, Serif;
        font-size: 15px;
        font-stretch: initial;
        border-radius: 20px;

    }

    .w3-btn {
        background: darkgrey;
        color: white;
        border-color: black;
        padding-bottom: 10px;
    }


    .w3-container
    {
        padding-bottom: 20px;
        font-family: "Times New Roman", Georgia, Serif;
        font-size: 15px;
    }

</style>
<body>

<div class="container">
    <div class="w3-card-4">
        <div class="w3-container w3-grey">
            <h2>Register your account</h2>
        </div>
        <form class="w3-container" action="/action_page.php">
            <p>
                <label class="w3-text-black"><b>Username</b></label>
                <input class="w3-input w3-border w3-lightgrey" style="border-radius: 10px" name="username" type="text"></p>
            <p>
                <label class="w3-text-black"><b>Phone Number</b></label>
                <input class="w3-input w3-border w3-lightgrey" style="border-radius: 10px" name="phoneNo" type="text"></p>
            <p>
                <label class="w3-text-black"><b>Email Address</b></label>
                <input class="w3-input w3-border w3-lightgrey" style="border-radius: 10px" name="email" type="text"></p>
            <p>
                <label class="w3-text-black"><b>Password</b></label>
                <input class="w3-input w3-border w3-lightgrey" style="border-radius: 10px" name="password" type="text"></p>

            <p>
                <button class="w3-btn w3-grey" style="float: right; border-radius: 10px">Login</button></p>
        </form>
    </div>
</div>


</body>
</html>
