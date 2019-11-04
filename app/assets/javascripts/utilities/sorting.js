document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.sort-by-title');

  if (typeof control != 'undefined') {
//https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Errors/Unexpected_type
    control.addEventListener('click', sortRowsByTitle) 
    
  }
});

function sortRowsByTitle() {
  var table = document.querySelector('table');

  var rows = table.querySelectorAll('tr');
  console.log(rows)
}
