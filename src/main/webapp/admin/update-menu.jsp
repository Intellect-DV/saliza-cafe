<%--
  Created by IntelliJ IDEA.
  User: Aiman
  Date: 24/1/2022
  Time: 5:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Menu | SalizaEja Cafe</title>
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
    <link rel="stylesheet" href="css/update-menu.css">
    <link rel="stylesheet" href="../css/modal.css">
    <%-- AXIOS - make  http request --%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="js/update-menu.js" defer></script>
</head>
<body>
    <form id="form_update_menu" enctype="multipart/form-data" data-menu-id='${param.id}'>
        <div class="title">Update Menu</div>

        <label>Name</label>
        <input type="text" name="name" autocomplete="off" placeholder="Name" required>

        <label>Price (RM)</label>
        <input type="number" name="price" min="0.00" max="1000.00" step="0.01" placeholder="Price" autocomplete="off" required>

        <label>Description</label>
        <input type="text" name="description" placeholder="Description" autocomplete="off" required>

        <button type="submit">Update</button>
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
