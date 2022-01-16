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
    <%-- AXIOS - make  http request --%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript">
        window.addEventListener('DOMContentLoaded',() => {
            const form = document.querySelector("#signup-form");
            const password = document.querySelector("#password");
            const confPassword = document.querySelector("#confirm-password");

            form.addEventListener('submit', (event) => {
                event.preventDefault();
                const output = document.querySelector("#message");
                if(confPassword.value !== password.value ) {
                    output.classList = "message show failed";
                    output.innerText = "Password confirmation does not match!";
                    return;
                }
                const formData = new FormData(event.target);
                const params = new URLSearchParams();
                const url = "./customer?action=signup";


                for(let key of formData.keys()) {
                    params.append(key, formData.get(key));
                }

                if (output.classList.contains("show")) output.classList.add("show");

                axios.post(url, params)
                .then(response => {
                    const message = response.data.message;
                    if(message === "New user added") {
                        output.classList = "message show succeed";
                        output.innerText = "Succesfully registered!";
                    }
                })
                .catch(error => {
                    const message = error.response.data.error;
                    output.classList = "message show failed";
                    if (message === "Username duplicated") output.innerText = "Please use another username!";
                    else output.innerText = message;
                })
            })
        })
    </script>
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
