window.addEventListener("DOMContentLoaded", function(event) {
    const formProfile = document.querySelector(".form_profile");
    const modal = document.querySelector(".modal__backdrop");
    const modalTitle = document.querySelector(".modalbox__title");
    const modalContent = document.querySelector(".modalbox__content");
    const modalBtn = document.querySelector(".modalbox__action > .btn");

    formProfile.addEventListener("submit", function(event) {
        event.preventDefault();

        const formData = new FormData(formProfile);
        const params = new URLSearchParams();
        const url = "/worker?action=updateprofile";

        for(let key of formData.keys()) {
            params.append(key, String(formData.get(key)));
        }

        axios.post(url,params)
            .then(response => {
                const {message} = response.data;

                if(message === "Profile updated") {
                    modalTitle.innerText = "Success";
                    modalTitle.classList = "modalbox__title success";
                    modalContent.innerText = "Your profile has been updated!";
                    modalBtn.classList = "btn success";
                    modal.classList = "modal__backdrop";
                }
            })
            .catch(err => {
                const {error} = err.response.data;

                modalTitle.innerText = "Failed";
                modalTitle.classList = "modalbox__title error";
                if(error ===  "Username duplicated") {
                    modalContent.innerText = "Please use another username!";
                } else {
                    modalContent.innerText = error;
                }
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