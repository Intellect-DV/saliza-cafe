window.addEventListener("DOMContentLoaded", event => {
    modalBtn.addEventListener("click", event => {
        if(modal.classList == "modal__backdrop") {
            modal.classList = "modal__backdrop hide";
        }
        getWorker();
    })

    getWorker();
})
const modal = document.querySelector(".modal__backdrop");
const modalTitle = document.querySelector(".modalbox__title");
const modalContent = document.querySelector(".modalbox__content");
const modalBtn = document.querySelector(".modalbox__action > .btn");

function deleteWorker(event) {
    console.log(event.target.dataset);
    const params = new URLSearchParams({
        workerId: event.target.dataset.workerId
    });

    axios.post("/worker?action=delete",params)
        .then(response => {
            const {message} = response.data;

            if(message === "Worker has been deleted") {
                modalTitle.innerText = "Success";
                modalContent.innerText = message;
                modalTitle.classList = "modalbox__title success";
                modalBtn.classList = "btn success";
                modal.classList = "modal__backdrop";
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
}

function getWorker() {
    axios.get("/worker?action=retrieveworker")
        .then(response => {
            const root = document.querySelector("#root");
            root.innerHTML = response.data;
        })
        .catch(err => {
            const {error} = err.response.data;

            modalTitle.innerText = "Failed";
            modalContent.innerText = error;
            modalTitle.classList = "modalbox__title error";
            modalBtn.classList = "btn error";
            modal.classList = "modal__backdrop";
        })
}
