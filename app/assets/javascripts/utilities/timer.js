function setTimer(date) {
  // Set the date we're counting down to
  var countDownDate = new Date(date).getTime();

  var form = document.querySelector("form");

  // Update the count down every 1 second
  var x = setInterval(function() {

    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the element with id="demo"
    document.getElementById("demo").innerHTML = minutes + " ' " + seconds + " '' ";

    // If the count down is finished, write some text
    if (distance < 1) {
      clearInterval(x);
      form.submit();
    }
  }, 1000);  
}
