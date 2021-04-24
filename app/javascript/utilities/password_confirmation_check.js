document.addEventListener('turbolinks:load', function() {

  let control = document.querySelector('#user_password_confirmation')

  if (control) { control.addEventListener('input', checkPasswordConfirmation) }
})

function checkPasswordConfirmation() {
  let password = document.querySelector('#user_password').value
  let passwordConfirmation = document.querySelector('#user_password_confirmation').value

  let matchIcon = document.querySelector('.confirm')
  let noMatchIcon = document.querySelector('.notconfirm')

  if (passwordConfirmation.length > 0) {
    if (password == passwordConfirmation) {
      matchIcon.classList.remove('hide')
      noMatchIcon.classList.add('hide')
    }
    else {
      matchIcon.classList.add('hide')
      noMatchIcon.classList.remove('hide')
    }
  }
  else {
    matchIcon.classList.add('hide')
    noMatchIcon.classList.add('hide')
  }
}
