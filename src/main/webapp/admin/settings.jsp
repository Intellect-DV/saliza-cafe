<%--
  Created by IntelliJ IDEA.
  User: Aiman
  Date: 21/1/2022
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Settings | SalizaEja Cafe</title>
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
    <link rel="stylesheet" href="css/settings.css">
    <link rel="stylesheet" href="../css/modal.css">
    <%-- AXIOS - make  http request --%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="js/settings.js" defer></script>
</head>
<body>
    <header>
        <nav class="navigation">
            <div class="navigation__title">
                ${sessionScope.workerObj.getWorkerUsername()}
            </div>
            <div class="navigation__list">
                <a href="./" class="navigation__item">
                    <i class="fas fa-th-large"></i> General
                </a>
                <a href="#" class="navigation__item">
                    <i class="fas fa-utensils"></i> Order
                </a>
                <c:if test="${sessionScope.workerObj.getManagerId() == -1}">
                <a href="./edit-menu.jsp" class="navigation__item">
                    <i class="fas fa-clipboard-list"></i> Menu
                </a>
                <a href="./manage-worker.jsp" class="navigation__item">
                    <i class="fas fa-users"></i> Worker
                </a>
                </c:if>
                <a href="./settings.jsp" class="navigation__item active line">
                    <i class="fas fa-user-cog"></i> Settings
                </a>
                <a href="../worker?action=logout" class="navigation__item">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </nav>
    </header>
    <div class="container">
        <form class="form_profile">
            <div class="form_profile__title">Profile Settings</div>
            <div class="form_profile__item">
                <label for="username">Username: </label>
                <input type="text" id="username" name="username" placeholder="Username" autocomplete="off" required value="${sessionScope.workerObj.getWorkerUsername()}">
            </div>
            <div class="form_profile__item">
                <label for="name">Name: </label>
                <input type="text" id="name" name="name" placeholder="Name" autocomplete="off" required value="${sessionScope.workerObj.getWorkerName()}">
            </div>
            <div class="form_profile__item">
                <label for="email">Email: </label>
                <input type="email" id="email" name="email" placeholder="Email" autocomplete="off" required value="${sessionScope.workerObj.getWorkerEmail()}">
            </div>

            <button type="submit">Update</button>
            <span class="form_profile__link"><a href="change-password.jsp"> Change Password </a></span>
        </form>
    </div>

    <div class="modal__backdrop hide">
        <div class="modalbox">
            <div class="modalbox__title">

            </div>
            <div class="modalbox__content">

            </div>
            <div class="modalbox__action">
                <button type="button" class="btn" tabindex="0">
                    Okay
                </button>
            </div>
        </div>
    </div>
</body>
</html>
