document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.check-pass');

  if (control) { control.addEventListener('input', passwordCheck) }
});

function passwordCheck() {
  var password = document.getElementById('user_password');
  var confirmation = document.getElementById('user_password_confirmation');
  var match = document.querySelector('.octicon-thumbsup').classList;
  var notMatch = document.querySelector('.octicon-thumbsdown').classList;
  function confirmationRed() {
    confirmation.classList.add('border-red');
    confirmation.classList.remove('border-green');
  };
  function confirmationGreen() {
    confirmation.classList.remove('border-red');
    confirmation.classList.add('border-green');
  }; 

  if (confirmation.value == '') {
    match.add('hide');
    notMatch.add('hide');
    confirmationRed();    
  }
  else if (confirmation.value == password.value) {
    match.remove('hide');
    notMatch.add('hide');
    confirmationGreen();
  }
  else {
    match.add('hide');
    notMatch.remove('hide');
    confirmationRed()
  }
}
