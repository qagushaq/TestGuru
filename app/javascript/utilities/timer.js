document.addEventListener('turbolinks:load', function () {
  let timer = document.querySelector('.timer')
  if (timer) {
    let time_left = timer.dataset.timeLeft
    let time = document.querySelector('.time')
    let toResult = document.getElementById('btn')
    testTimer(time_left, time, toResult)
}})

function testTimer(time_left, time, toResult) {
  let minutes = Math.floor(time_left/60)
  let seconds = Math.floor(time_left%60)

  let s = setInterval (() => {
    if (minutes == -1 && seconds == 59) {
      toResult.click()
    }else{
      time.innerHTML = minutes + ':' + seconds--
      if (seconds == 0) {
      minutes--
      seconds = 59 }
  }},1000)
}
