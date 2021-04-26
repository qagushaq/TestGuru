document.addEventListener('turbolinks:load', function () {

 let progressBar = document.querySelector('.progress-bar')

 if (progressBar) {
   showProgress(progressBar)
 }
})

function showProgress(progressBar) {
  let totalQuestions = progressBar.dataset.totalQuestions
  let currentQuestionNumber = progressBar.dataset.questionNumber
  let percent = Math.round((currentQuestionNumber/totalQuestions)*100)
  progressBar.style.width = `${percent}%`
}
