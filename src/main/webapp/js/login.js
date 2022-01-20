window.addEventListener('DOMContentLoaded', function(event){
    const custForm = document.querySelector("form.loginCustomer");
    const workerForm = document.querySelector("form.loginWorker");
    const modal = document.querySelector('.modal__backdrop');
    const modalBtn = document.querySelector('.modalbox__action>button.btn');

    // switch form (customer / worker)
    document.querySelector('#toggle-btn').addEventListener('click', function(event) {
        const toggleBtn = event.target;
        if(toggleBtn.checked) {
            custForm.style.display  = "none";
            workerForm.style.display = "block";
        } else {
            custForm.style.display  = "block";
            workerForm.style.display = "none";
        }
    })

    // customer form handler
    custForm.addEventListener('submit', function(event) {
        event.preventDefault();

        const formData = new FormData(custForm);
        const params = new URLSearchParams();
        const url = "./customer?action=login";

        for(let key of formData.keys()) {
            params.append(key, String(formData.get(key)));
        }

        axios.post(url,params)
            .then(response => {
                // const message = response.data.message;
                const {message} = response.data;
                console.log(response);
                console.log("Response: " + message)

                // todo -- redirect
            })
            .catch(err => {
                const {error} = err.response.data;

                if(error === "Wrong username or password!") {
                    modal.classList.remove("hide")
                }
            })
    })

    // worker form handler
    workerForm.addEventListener('submit', function(event) {
        event.preventDefault();

        // todo -- make http request for worker login
    })

    // close modal popup
    modalBtn.addEventListener('click', function(event) {
        if(modal.classList[1] === undefined) {
            modal.classList.add("hide")
        }
    })
})