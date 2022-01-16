window.addEventListener('DOMContentLoaded',() => {
    const form = document.querySelector("#signup-form");
    const password = document.querySelector("#password");
    const confPassword = document.querySelector("#confirm-password");

    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const output = document.querySelector("#message");
        if(confPassword.value !== password.value ) {
            output.classList = "message show failed";
            output.innerText = "Password confirmation does not match!";
            return;
        }
        const formData = new FormData(event.target);
        const params = new URLSearchParams();
        const url = "./customer?action=signup";


        for(let key of formData.keys()) {
            params.append(key, formData.get(key));
        }

        if (output.classList.contains("show")) output.classList.add("show");

        axios.post(url, params)
            .then(response => {
                const message = response.data.message;
                if(message === "New user added") {
                    output.classList = "message show succeed";
                    output.innerText = "Succesfully registered!";
                }
            })
            .catch(error => {
                const message = error.response.data.error;
                output.classList = "message show failed";
                if (message === "Username duplicated") output.innerText = "Please use another username!";
                else output.innerText = message;
            })
    })
})