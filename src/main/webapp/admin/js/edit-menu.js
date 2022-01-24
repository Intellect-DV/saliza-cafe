const filterBtn = document.querySelectorAll(".filter__item > button");
const menuDiv = document.querySelector("div.menu");
const modal = document.querySelector(".modal_confirm__backdrop");
const btnDelete = document.querySelector("#btnDelete");
const btnCancel = document.querySelector("#btnCancel");

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

    btnDelete.addEventListener("click", event => {
        const {menuId} = btnDelete.dataset;
        const {menuType} = btnDelete.dataset;
        const url = "/menu?action=deletemenu";
        const params = new URLSearchParams();

        params.append("id", menuId);

        axios.post(url,params)
            .then(response => {
                if (response.data.message === "The menu has been successfully deleted!") {
                    switch (menuType.toLowerCase()) {
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
                    modal.classList = "modal_confirm__backdrop hide";
                }
            })
            .catch (err => {
                console.log(err.response.data);
                modal.classList = "modal_confirm__backdrop hide";
            })
    })

    btnCancel.addEventListener("click", event => {
        modal.classList = "modal_confirm__backdrop hide";
    })

    getFoodMenu();
})

const getFoodMenu = () => {
    axios.get("/menu?action=getmenu&type=food")
        .then(response => {
            menuDiv.innerHTML = response.data;
        })
        .catch(err => {
            console.log(err.response.data)
        })
}

const getBeverageMenu = () => {
    axios.get("/menu?action=getmenu&type=beverage")
        .then(response => {
            menuDiv.innerHTML = response.data;
        })
        .catch(err => {
            console.log(err.response.data)
        })
}

const getDessertMenu = () => {
    axios.get("/menu?action=getmenu&type=dessert")
        .then(response => {
            menuDiv.innerHTML = response.data;
        })
        .catch(err => {
            console.log(err.response.data)
        })
}

const triggerPopup = (event) => {
    const btn = event.target;
    showPopup(btn.dataset.menuId, btn.dataset.menuType);
}

const showPopup = (menuId, menuType) => {
    btnDelete.dataset.menuId = menuId;
    btnDelete.dataset.menuType = menuType;
    modal.classList = "modal_confirm__backdrop";
}