window.addEventListener('DOMContentLoaded', function(event) {
    const  formWorker = document.querySelector('.form_worker');
    const modal = document.querySelector('.modal__backdrop');
    const modalboxTitle = document.querySelector('.modalbox__title');
    const modalboxContent = document.querySelector('.modalbox__content');
    const modalboxBtn = document.querySelector('.modalbox__action > .btn');

    formWorker.addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(formWorker);
        const  params = new URLSearchParams();
        const url = '/worker?action=add';

        for(let key of formData.keys()) {
            params.append(key, String(formData.get(key)));
        }

        axios.post(url,params)
            .then(response => {
                const {message} = response.data;
                if(message === "New worker added") {
                    modalboxTitle.innerText = "Success";
                    modalboxTitle.classList = "modalbox__title success";
                    modalboxContent.innerText = "New worker has been added!";
                    modalboxBtn.classList = "btn success";
                    modal.classList = "modal__backdrop";
                }
            })
            .catch(err => {
                const {error} = err.response.data;
                modalboxTitle.innerText = "Failed";
                modalboxTitle.classList = "modalbox__title error";
                modalboxContent.innerText = error;
                modalboxBtn.classList = "btn error";
                modal.classList = "modal__backdrop";
            })
    })

    modalboxBtn.addEventListener('click', function(event) {
        event.preventDefault();
        modal.classList = "modal__backdrop hide";
    })
})