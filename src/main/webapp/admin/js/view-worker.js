window.addEventListener("DOMContentLoaded", event => {
    axios.get("/worker?action=retrieveworker")
        .then(response => {
            const root = document.querySelector("#root");
            root.innerHTML = response.data;
        })
        .catch(err => {

        })
})