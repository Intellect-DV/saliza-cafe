<%--
  Created by IntelliJ IDEA.
  User: Aiman
  Date: 21/1/2022
  Time: 2:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Worker | SalizaEja Cafe</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <%-- Google Font --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;600;700&display=swap" rel="stylesheet">
    <%-- Font Awesome --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <%-- Boilerplate --%>
    <link rel="stylesheet" href="../css/boilerplate.css">
    <%-- Custom style --%>
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/manage-worker.css">
    <link rel="stylesheet" href="../css/modal.css">

    <%-- Axios --%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
    <header>
        <nav class="navigation">
            <div class="navigation__title">
                Admin Name
            </div>
            <div class="navigation__list">
                <a href="./" class="navigation__item">
                    <i class="fas fa-th-large"></i> General
                </a>
                <a href="#" class="navigation__item">
                    <i class="fas fa-utensils"></i> Order
                </a>
                <a href="./edit-menu.jsp" class="navigation__item">
                    <i class="fas fa-clipboard-list"></i> Menu
                </a>
                <a href="./manage-worker.jsp" class="navigation__item active">
                    <i class="fas fa-users"></i> Worker
                </a>
                <a href="#" class="navigation__item line">
                    <i class="fas fa-user-cog"></i> Settings
                </a>
                <a href="#" class="navigation__item">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </nav>
    </header>
    <div class="container">
        <form class="form_worker">
            <div class="form_worker__title">Create Worker</div>
            <input type="text" name="username" placeholder="Username" autocomplete="off" required>
            <input type="text" name="name" placeholder="Name" autocomplete="off" required>
            <input type="email" name="email" placeholder="Email" autocomplete="off" required>
            <input type="password" name="password" placeholder="Password" autocomplete="off" required>

            <button type="submit">Create</button>
            <span class="form_worker__link">Click <a href="./view-worker.jsp">here</a> to view worker.</span>
        </form>
    </div>

    <div class="modal__backdrop hide">
        <div class="modalbox">
            <div class="modalbox__title success">
                Success
            </div>
            <div class="modalbox__content">
                New worker has been added!
            </div>
            <div class="modalbox__action">
                <button class="btn success">
                    Okay
                </button>
            </div>
        </div>
    </div>

    <script>
        window.addEventListener('DOMContentLoaded', function(event) {
            const  formWorker = document.querySelector('.form_worker');
            const modal = document.querySelector('.modal__backdrop');
            const modalboxTitle = document.querySelector('.modalbox__title');
            const modalboxContent = document.querySelector('.modalbox__content');
            const modalboxBtn = document.querySelector('.modalbox__action > .btn');

            formWorker.addEventListener('submit', function(event) {
                event.preventDefault();
                const formData = new FormData(formWorker);
                const  params = new URLSearchParams();
                const url = '/worker?action=add';

                for(let key of formData.keys()) {
                    params.append(key, String(formData.get(key)));
                }

                axios.post(url,params)
                .then(response => {
                    const {message} = response.data;
                    if(message === "New worker added") {
                        modalboxTitle.innerText = "Success";
                        modalboxTitle.classList = "modalbox__title success";
                        modalboxContent.innerText = "New worker has been added!";
                        modalboxBtn.classList = "btn success";
                        modal.classList = "modal__backdrop";
                    }
                })
                .catch(err => {
                    const {error} = err.response.data;
                    modalboxTitle.innerText = "Failed";
                    modalboxTitle.classList = "modalbox__title error";
                    modalboxContent.innerText = error;
                    modalboxBtn.classList = "btn error";
                    modal.classList = "modal__backdrop";
                })
            })

            modalboxBtn.addEventListener('click', function(event) {
                event.preventDefault();
                modal.classList = "modal__backdrop hide";
            })
        })
    </script>
</body>
</html>
