document.addEventListener('turbolinks:load', function () {

let progressDiv = document.querySelector('.progress');
let progressBar = document.querySelector('.progress-bar')

if (progressDiv && progressBar) {
    progressBar.style.width = `${progressDiv.dataset.percent}%`
}
});
