document.addEventListener('turbolinks:load', function() {
  let form = document.getElementById('check-form')
  form.addEventListener('click',showBtnNext)
 })

function isChecked() {
 let checked = false;
 if (document.querySelectorAll('input[type=checkbox]:checked').length){
   checked = true
 }else
 checked = false
 return checked
}

function showBtnNext(event) {
  let next_question_btn = document.getElementById('btn')
  if(isChecked() && event.target.tagName == "INPUT" ) {
    next_question_btn.classList.remove('d-none')
  }
  if(!isChecked()) {
    next_question_btn.classList.add('d-none')
  }
}
