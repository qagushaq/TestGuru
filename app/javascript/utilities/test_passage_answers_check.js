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
    next_question_btn.classList.remove('btn_next_unactive')
    next_question_btn.disabled = false
  }
  if(!isChecked()) {
    next_question_btn.classList.add('btn_next_unactive')
    next_question_btn.disabled = true
  }
}
