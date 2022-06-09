$(document).ready(function () {
  clicked = 0;
  click1 = 0;
  click2 = 0;
  click3 = 0;
  click5 = 0;

  function control(click, vettore, color) {
    if (click % 2 == 1) {
      for (i = 0; i <= vettore.length; i++) {
        vettore[i].style.background = color;
      }
    }

    if (click % 2 == 0) {
      for (i = 0; i <= vettore.length; i++) {
        vettore[i].style.background = "none";
      }
    }
  }

  $("#mark").on("click", function () {
    clicked += 1;

    vect = $(".termini");

    control(clicked, vect, "yellow");
  });

  $("reg").hide();

  $("#reg").on("click", function () {
    click1 += 1;

    $("reg").fadeIn();

    vect = $("reg");

    if (click1 % 2 == 1) {
      $("orig").hide();
      $("reg").fadeIn();
    }

    if (click1 % 2 == 0) {
      $("orig").fadeIn();
      $("reg").hide();
    }

    control(click1, vect, "red");
  });

  $("#esling").each(function () {
    $(this).on("click", function (e) {
      click3 += 1;

      vect = $("mentioned");

      control(click3, vect, "#dfedff");
    });
  });

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
