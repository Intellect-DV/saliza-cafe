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
    <%-- Google Font --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;600;700&display=swap" rel="stylesheet">
    <%-- Boilerplate --%>
    <link rel="stylesheet" href="css/boilerplate.css">
    <%-- Custom style --%>
    <link rel="stylesheet" href="css/login.css">
    <%-- Modal style --%>
    <link rel="stylesheet" href="css/modal.css">

    <%-- AXIOS - make  http request --%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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

            <form class="loginCustomer">

                <input type="text" placeholder="username" name="username" class="inp" autocomplete="off" required>

                <input type="password" placeholder="password" name="password" class="inp" style="margin-bottom: 40px;" autocomplete="off" required>

                <div class="register-link">Do not register yet? <a href="signup.jsp"> Register Now </a> </div>


                <input type="submit" value="Login" class="inp submit-inp">

            </form>

            <form class="loginWorker">

                <input type="text" placeholder="username" name="username" class="inp" autocomplete="off" required>

                <input type="password" placeholder="password" name="password" class="inp" autocomplete="off" required>

                <input type="submit" value="Login" class="inp submit-inp">

            </form>


            <a href="index.jsp">
                <input type="button" value="Back" class="inp submit-inp">
            </a>
        </div>
    </div>
</div>

<div class="modal__backdrop hide">
    <div class="modalbox">
        <div class="modalbox__title error">
            Login Failed
        </div>
        <div class="modalbox__content">
            Username or Password is invalid. Please try again!
        </div>
        <div class="modalbox__action">
            <button class="btn error">
                Okay
            </button>
        </div>
    </div>
</div>
<script>
    window.addEventListener('DOMContentLoaded', function(event){
        const custForm = document.querySelector("form.loginCustomer");
        const workerForm = document.querySelector("form.loginWorker");
        const modal = document.querySelector('.modal__backdrop');
        const modalBtn = document.querySelector('.modalbox__action>button.btn');

        // switch form (customer / worker)
        document.querySelector('#toggle-btn').addEventListener('click', function(event) {
            const toggleBtn = event.target;
            if(toggleBtn.checked) {
                custForm.style.display  = "none";
                workerForm.style.display = "block";
            } else {
                custForm.style.display  = "block";
                workerForm.style.display = "none";
            }
        })

        // customer form handler
        custForm.addEventListener('submit', function(event) {
            event.preventDefault();

            const formData = new FormData(custForm);
            const params = new URLSearchParams();
            const url = "./customer?action=login";

            for(let key of formData.keys()) {
                params.append(key, String(formData.get(key)));
            }

            axios.post(url,params)
            .then(response => {
                // const message = response.data.message;
                const {message} = response.data;
                console.log(response);
                console.log("Response: " + message)
            })
            .catch(err => {
                const {error} = err.response.data;

                if(error === "Wrong username or password!") {
                    modal.classList.remove("hide")
                }
            })
        })

        // worker form handler
        workerForm.addEventListener('submit', function(event) {
            event.preventDefault();
        })

        // close modal popup
        modalBtn.addEventListener('click', function(event) {
            console.log("button clicked: " + (modal.classList[1] === undefined));
            if(modal.classList[1] === undefined) {
                modal.classList.add("hide")
            }
        })
    })
</script>
</body>
</html>