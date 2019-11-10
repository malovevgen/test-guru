document.addEventListener('turbolinks:load', function () {
  var controls = document.querySelectorAll('.form-inline-link');

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInLineLinkHandler);
    }
  }
})
function formInLineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId;
  console.log(testId)
}
