$(document).ready(function(){


function mark(elem, color) {

    testo = elem.text();

  $(elem).replaceWith(`<mark>${testo}</mark>`);
  $("mark").css("background-color", color);

}

    $("#mark").on("click", function(){

        mark($("mentioned"), "yellow")


    });

});