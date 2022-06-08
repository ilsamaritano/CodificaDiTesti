$(document).ready(function () {
  click5 = 0;
  click2 = 0;

  $("del").hide();

  $("#del").on("click", () => {
    click5 += 1;

    if (click5 % 2 == 1) {
      $("del").fadeIn();
      $(".gaps").fadeIn();
    }
    if (click5 % 2 == 0) {
      $("del").fadeOut();
      $(".gaps").fadeOut();
    }
  });

  $('input[type="checkbox"]').click(function () {
    if ($(this).prop("checked") == true) {
      gaps = $(".gap");

      for (i = 0; i <= gaps.length; i++) {
        gaps[i].style.background = "green";
      }
    } else if ($(this).prop("checked") == false) {
      for (i = 0; i <= gaps.length; i++) {
        gaps[i].style.background = "none";
      }
    }
  });
});
