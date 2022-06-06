$(document).ready(function(){


function mark(elem, color) {

    testo = elem.text();

  $(elem).replaceWith(`<mark>${testo}</mark>`);
  $("mark").css("background-color", color);

}

    $("#mark").on("click", function(){

       num = $(".termini").length();
       vect = $(".termini");

        for(i=0, i<=num; i++) {

        mark(vect[i], "yellow");

        }

    });

});