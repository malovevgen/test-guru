document.addEventListener('turbolinks:load', function() {
  var elem = document.querySelector('.progress-bar');
  if (elem) {
    width = elem.dataset.barWidth;
    elem.style.width = width + '%';
  }
})
