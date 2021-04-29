document.addEventListener('turbolinks:load', function() {
let checkboxies = document.querySelector('.checkbox')
checkboxies.addEventListener('click', showBtnNext)
console.log(answered)
var answered = false
})

function showBtnNext() {
  check_chekboxiex()
  var next_question_btn = document.getElementById('subm')
  if (answered == true) {
    next_question_btn.classList.toggle('d-none')
  }else {
    next_question_btn.classList.toggle('d-none')
  }
}

function check_chekboxiex(){
  if (document.querySelectorAll('input[type=checkbox]:checked').length){
    answered = false
  }else
  answered = true
}
