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
        <form class="form_worker" action="">
            <div class="form_worker__title">Create Worker</div>
            <input type="text" name="username" placeholder="Username" autocomplete="off" required>
            <input type="text" name="name" placeholder="Name" autocomplete="off" required>
            <input type="text" name="email" placeholder="Email" autocomplete="off" required>
            <input type="text" name="password" placeholder="Password" autocomplete="off" required>

            <button type="submit">Create</button>
            <span class="form_worker__link">Click <a href="#">here</a> to view worker.</span>
        </form>
    </div>
</body>
</html>
