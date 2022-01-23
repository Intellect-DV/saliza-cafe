const filterBtn = document.querySelectorAll(".filter__item > button");
const menuDiv = document.querySelector("div.menu");
window.addEventListener("DOMContentLoaded", () => {

    for(let i = 0; i <  filterBtn.length; i++) {
        filterBtn[i].addEventListener("click", event => {
            filterBtn[0].removeAttribute("class");
            filterBtn[1].removeAttribute("class");
            filterBtn[2].removeAttribute("class");

            filterBtn[i].classList = "active";
            switch (filterBtn[i].dataset.menuType) {
                case "food":
                    getFoodMenu();
                    break;
                case "beverage":
                    getBeverageMenu();
                    break;
                case "dessert":
                    getDessertMenu();
                    break;
            }
        })
    }

    getFoodMenu();
})

const getFoodMenu = () => {
    axios.get("/view/edit-menu__food.jsp")
        .then(response => {
            menuDiv.innerHTML = response.data;
        })
        .catch(err => {
            console.log(err.response.data)
        })
}

const getBeverageMenu = () => {
    axios.get("/view/edit-menu__beverage.jsp")
        .then(response => {
            menuDiv.innerHTML = response.data;
        })
        .catch(err => {
            console.log(err.response.data)
        })
}

const getDessertMenu = () => {
    axios.get("/view/edit-menu__dessert.jsp")
        .then(response => {
            menuDiv.innerHTML = response.data;
        })
        .catch(err => {
            console.log(err.response.data)
        })
}