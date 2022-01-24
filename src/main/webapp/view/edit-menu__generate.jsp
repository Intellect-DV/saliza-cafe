<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="menu" items="${requestScope.menus}">
<div class="menu__item">
    <div class="menu__image">
        <img src="${menu.getItemPicUrl()}" alt="Nasi Lemak">
    </div>
    <div class="menu__title">${menu.getItemName()}</div>
    <div class="menu__price">${menu.getItemPriceToCurrency()}</div>
    <div class="menu__action">
        <button onclick='window.location.href="update-menu.jsp?id=${menu.getItemId()}"'>Update</button>
        <button>Delete</button>
    </div>
</div>
</c:forEach>