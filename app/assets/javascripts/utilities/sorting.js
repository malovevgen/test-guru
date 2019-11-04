document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.sort-by-title');

  if (typeof control != 'undefined') {
//https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Errors/Unexpected_type
    control.addEventListener('click', sortRowsByTitle) 
    
  }
});

function sortRowsByTitle() {
  var table = document.querySelector('table');

   // NodeList
   // https://developer.mozilla.org/ru/docs/Web/API/NodeList

  var rows = table.querySelectorAll('tr');
  //console.log(rows)

  var sortedRows = [];

  // select all table rows except the first one which is the header
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
  }
  //console.log(sortedRows)

  sortedRows.sort(compareRows)

  var sortedTable = document.createElement('table');

  sortedTable.classList.add('table');

  sortedTable.appendChild(rows[0]);

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i]);
  }

  table.parentNode.replaceChild(sortedTable, table);
}

function compareRows(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent;
  var testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) { return -1; }
  if (testTitle1 > testTitle2) { return 1; }
  return 0;
}
