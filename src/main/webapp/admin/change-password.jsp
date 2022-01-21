<%--
  Created by IntelliJ IDEA.
  User: Aiman
  Date: 22/1/2022
  Time: 4:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="css/change-password.css">
    <link rel="stylesheet" href="../css/modal.css">
    <%-- AXIOS - make  http request --%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="js/change-password.js"></script>
</head>
<body>
    <form class="form_password">
        <div class="form_password__item title">
            <span>Change Password</span>
        </div>
        <div class="form_password__item input">
            <label for="current-password">Current Password</label>
            <input type="password" id="current-password" name="current-password" autocomplete="off" required>
        </div>
        <div class="form_password__item input">
            <label for="new-password">New Password</label>
            <input type="password" id="new-password" name="new-password" autocomplete="off" required>
        </div>
        <div class="form_password__item input">
            <label for="confirm-password">Confirm Password</label>
            <input type="password" id="confirm-password" name="confirm-password" autocomplete="off" required>
        </div>
        <div class="form_password__item btn">
            <button type="submit" tabindex="0">Update Password</button>
        </div>
    </form>

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
