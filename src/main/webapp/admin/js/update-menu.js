const formUpdate = document.querySelector("#form_update_menu");
const menuId = formUpdate.dataset.menuId;
const inputName = document.querySelector("input[name='name']");
const inputPrice = document.querySelector("input[name='price']")
const inputDescription = document.querySelector("input[name='description']");

const modal = document.querySelector(".modal__backdrop");
const modalTitle = document.querySelector(".modalbox__title");
const modalContent = document.querySelector(".modalbox__content");
const modalBtn = document.querySelector(".modalbox__action > .btn");

window.addEventListener("DOMContentLoaded", () => {
    getMenuInfo();

    formUpdate.addEventListener("submit", event => {
        event.preventDefault();
        updateMenuInfo();
    })

    modalBtn.addEventListener("click", (event) => {
        if(modal.classList == "modal__backdrop") {
            modal.classList = "modal__backdrop hide";
        }
    })
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

const updateMenuInfo = () => {
    const formData = new FormData(formUpdate);
    const params = new URLSearchParams();
    const url = '/menu?action=updatemenuinfo';

    params.append("id", menuId);
    for(let key of formData.keys()) {
        params.append(key, String(formData.get(key)));
    }

    axios.post(url, params)
        .then(response => {
            const {message} = response.data;

            modalTitle.innerText = "Success";
            modalTitle.classList = "modalbox__title success";
            modalContent.innerText = message;
            modalBtn.classList = "btn success";
            modal.classList = "modal__backdrop";
        })
        .catch(err => {
            const {error} = err.response.data;

            modalTitle.innerText = "Failed";
            modalTitle.classList = "modalbox__title error";
            modalContent.innerText = error;
            modalBtn.classList = "btn error";
            modal.classList = "modal__backdrop";
        })
}