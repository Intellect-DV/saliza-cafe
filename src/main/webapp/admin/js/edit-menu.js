const filterBtn = document.querySelectorAll(".filter__item > button");
window.addEventListener("DOMContentLoaded", () => {

    for(let i = 0; i <  filterBtn.length; i++) {
        filterBtn[i].addEventListener("click", event => {
            filterBtn[0].removeAttribute("class");
            filterBtn[1].removeAttribute("class");
            filterBtn[2].removeAttribute("class");

            filterBtn[i].classList = "active";
        })
    }
})