const formAddMenu = document.querySelector("#form_add_menu");
const modal = document.querySelector(".modal__backdrop");
const modalTitle = document.querySelector(".modalbox__title");
const modalContent = document.querySelector(".modalbox__content");
const modalBtn = document.querySelector(".modalbox__action > .btn");

window.addEventListener("DOMContentLoaded", () => {
    formAddMenu.addEventListener("submit", event => {
        event.preventDefault();

        const formData = new FormData(formAddMenu);
        const {enctype} = formAddMenu;
        const url = "/menu?action=createmenu"

        const config = {
            method: 'post',
            url: url,
            headers: {
                "Content-Type": enctype
            },
            data : formData
        };

        axios(config)
            .then(response => {
                // success message
                const {message} = response.data;

                modalTitle.innerText = "Success";
                modalTitle.classList = "modalbox__title success";
                modalContent.innerText = message;
                modalBtn.classList = "btn success";
                modal.classList = "modal__backdrop";
            })
            .catch(err => {
                // error message
                const {error} = err.response.data;

                modalTitle.innerText = "Failed";
                modalTitle.classList = "modalbox__title error";
                modalContent.innerText = error;
                modalBtn.classList = "btn error";
                modal.classList = "modal__backdrop";
            })
    })

    modalBtn.addEventListener("click", (event) => {
        if(modal.classList == "modal__backdrop") {
            modal.classList = "modal__backdrop hide";
        }
    })
})