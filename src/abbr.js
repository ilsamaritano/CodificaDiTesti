$(document).ready(function () {
  click4 = 0;

  $(".expan").hide();

  $("#abbreviazioni").on("click", function () {
    click4 += 1;

    if (click4 % 2 == 1) {
      $(".abbr").css("font-weight", "bold");
      $(".expan").fadeIn();
    }

    if (click4 % 2 == 0) {
      $(".abbr").css("font-weight", "normal");
      $(".expan").fadeOut();
    }
  });
});
