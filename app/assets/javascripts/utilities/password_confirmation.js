document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.check-pass');

  if (control) { control.addEventListener('input', passwordCheck) }
});

function passwordCheck() {
  var password = document.getElementById('user_password');
  var confirmation = document.getElementById('user_password_confirmation');
  var match = document.querySelector('.octicon-thumbsup').classList;
  var notMatch = document.querySelector('.octicon-thumbsdown').classList;

  if (confirmation.value == '') {
    match.add('hide');
    notMatch.add('hide');
    confirmation.classList.add('border-red');
    confirmation.classList.remove('border-green');
  }
  else if (confirmation.value == password.value) {
    match.remove('hide');
    notMatch.add('hide');
    confirmation.classList.remove('border-red');
    confirmation.classList.add('border-green');
  }
  else {
    match.add('hide');
    notMatch.remove('hide');
    confirmation.classList.add('border-red');
    confirmation.classList.remove('border-green');
  }
}
