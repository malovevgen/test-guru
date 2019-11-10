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
  console.log('Handle form inline link')
}
