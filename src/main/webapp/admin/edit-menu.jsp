<%--
  Created by IntelliJ IDEA.
  User: Aiman
  Date: 21/1/2022
  Time: 12:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Menu | SalizaEja Cafe</title>
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
    <link rel="stylesheet" href="css/edit-menu.css">
    <link rel="stylesheet" href="../css/modal_confirm.css">
    <%-- Script --%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="js/edit-menu.js" defer></script>
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
                <a href="./edit-menu.jsp" class="navigation__item active">
                    <i class="fas fa-clipboard-list"></i> Menu
                </a>
                <a href="./manage-worker.jsp" class="navigation__item">
                    <i class="fas fa-users"></i> Worker
                </a>
                </c:if>
                <a href="./settings.jsp" class="navigation__item line">
                    <i class="fas fa-user-cog"></i> Settings
                </a>
                <a href="../worker?action=logout" class="navigation__item">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </nav>
    </header>
    <div class="container">
        <div class="filter">
            <div class="filter__box">
                <div class="filter__item">
                    <button class="active" data-menu-type="food">Food</button>
                </div>
                <div class="filter__item">
                    <button data-menu-type="beverage">Beverage</button>
                </div>
                <div class="filter__item">
                    <button data-menu-type="dessert">Dessert</button>
                </div>
            </div>
        </div>
        <div class="menu">

        </div>
        <div class="add_menu">
            <div class="add_menu__item">
                <a href="add-menu.jsp">Add Menu</a>
            </div>
        </div>
    </div>

    <div class="modal_confirm__backdrop hide">
        <div class="modal_confirm__box">
            <div class="title error">
                Delete Menu
            </div>
            <div class="content">
                Are you confirm?
            </div>
            <div class="action">
                <button id="btnCancel" type="button" class="btn error" tabindex="0">
                    No
                </button>
                <button id="btnDelete" type="button" class="btn error" tabindex="0">
                    Yes
                </button>
            </div>
        </div>
    </div>

</body>
</html>
