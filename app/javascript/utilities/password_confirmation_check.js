document.addEventListener('turbolinks:load', function() {

  let control = document.querySelector('#user_password_confirmation')

  if (control) { control.addEventListener('input', checkPasswordConfirmation) }
})

let matchIcon = document.querySelector('.confirm')
let noMatchIcon = document.querySelector('.notconfirm')

function confirm() {
  matchIcon.classList.remove('hide')
  noMatchIcon.classList.add('hide')
}

function notconfirm() {
  matchIcon.classList.add('hide')
  noMatchIcon.classList.remove('hide')
}

function hide() {
  matchIcon.classList.add('hide')
  noMatchIcon.classList.add('hide')
}

function checkPasswordConfirmation() {
  let password = document.querySelector('#user_password').value
  let passwordConfirmation = document.querySelector('#user_password_confirmation').value

  if (passwordConfirmation.length > 0) {
    return hide()
  }

  if (password == passwordConfirmation) {
    confirm()
  }else {
      notconfirm()
  }
}
