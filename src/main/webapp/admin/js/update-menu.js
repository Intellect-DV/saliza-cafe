const formUpdate = document.querySelector("#form_update_menu");
const menuId = formUpdate.dataset.menuId;
const inputName = document.querySelector("input[name='name']");
const inputPrice = document.querySelector("input[name='price']")
const inputDescription = document.querySelector("input[name='description']");

window.addEventListener("DOMContentLoaded", () => {
    getMenuInfo();
})

const getMenuInfo = () => {
    if(menuId == null || menuId === "") return;

    axios.get(`/menu?action=getmenuinfo&id=${menuId}`)
        .then(response => {
            const {content} = response.data;
            inputName.value = content.menuName;
            inputPrice.value = content.menuPrice;
            inputDescription.value = content.menuDescription;
        })
        .catch(err => {
            console.log(err.response.data);
        })
}