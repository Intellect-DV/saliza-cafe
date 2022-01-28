window.addEventListener("DOMContentLoaded", event => {
    const formPassword = document.querySelector(".form_password");
    const currentPassword = document.querySelector("#current-password");
    const newPassword = document.querySelector("#new-password");
    const confirmPassword = document.querySelector("#confirm-password");
    const modal = document.querySelector(".modal__backdrop");
    const modalTitle = document.querySelector(".modalbox__title");
    const modalContent = document.querySelector(".modalbox__content");
    const modalBtn = document.querySelector(".modalbox__action > .btn");

    modalBtn.addEventListener("click", (event) => {
        if(modal.classList == "modal__backdrop") {
            modal.classList = "modal__backdrop hide";
        }
    })

    formPassword.addEventListener("submit", event => {
        event.preventDefault();

        if(newPassword.value !== confirmPassword.value) {
            modalTitle.innerText = "Failed";
            modalContent.innerText = "Password confirmation not same!";

            modalTitle.classList = "modalbox__title error";
            modalBtn.classList = "btn error";
            modal.classList = "modal__backdrop";
            return;
        }

        const formData = new FormData(formPassword);
        const params = new URLSearchParams();
        const url = "/worker?action=updatepassword";

        for(let key of formData.keys()) {
            params.append(key, String(formData.get(key)));
        }

        axios.post(url, params)
            .then(response => {
                const {message} = response.data;
                if(message === "Password updated") {
                    modalTitle.innerText = "Success";
                    modalContent.innerText = "Your password has been updated!";

                    modalTitle.classList = "modalbox__title success";
                    modalBtn.classList = "btn success";
                    modal.classList = "modal__backdrop";

                    currentPassword.value = "";
                    newPassword.value = "";
                    confirmPassword.value = "";
                }
            })
            .catch(err => {
                const {error} = err.response.data;
                modalTitle.innerText = "Failed";
                modalContent.innerText = error;

                modalTitle.classList = "modalbox__title error";
                modalBtn.classList = "btn error";
                modal.classList = "modal__backdrop";
            })
    })
})