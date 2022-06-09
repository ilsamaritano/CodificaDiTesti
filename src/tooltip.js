jQuery.fn.getParent = function(num) {
  var last = this[0];
  for (var i = 0; i < num; i++) {
      last = last.parentNode;
  }
  return jQuery(last);
};



$(document).ready(function () {

  $(".tooltipTermine").css("display", "none");

  $(document).on("mouseover", ".termini", function (e) {
    e.preventDefault();
  
    var target = $(e.target);
    if(target.is(".termini")) {

      var selettore = target.attr('id');
      selett = selettore.replace("#", "").trim(); // Rimuovo l'#
      var desc = $(`#desc_${selett}`).text(); // Ottengo la stringa descrittiva

    } else {
      if(target.is(".abbr")){

       father = target.getParent(1);
       var selettore = father.attr('id');
       selett = selettore.replace("#", "").trim(); // Rimuovo l'#
       var desc = $(`#desc_${selett}`).text(); // Ottengo la stringa descrittiva

      }
    }

    $(target).attr("title", desc); // aggiungo e ci inserisco la stringa

    $(document).tooltip({
      tooltipClass: "tooltip-styling",
    }); // A questo punto faccio apparire il tooltip

  });

});

/* $(document).ready(function () {
  $(".tooltipTermine").css("display", "none");

  $(document).on("mouseover", ".termini", function (e) {
    e.preventDefault();

    var exists = $(e.target).attr("title");

    if (typeof exists == "undefined" || exists == false) {
      // Controllo se il "title" non esiste già...se non esiste...

      var selettore = $(e.target).attr("id"); // Ottengo l'id per sapere a quale  si riferisce
      selett = selettore.replace("#", "").trim(); // Rimuovo l'#
      var desc = $(`#desc_${selett}`).text(); // Ottengo la stringa descrittiva

      $(e.target).attr("title", desc); // Allora lo aggiungo e ci inserisco la stringa

      $(document).tooltip({
        tooltipClass: "tooltip-styling",
      }); // A questo punto faccio apparire il tooltip
    }
  });

  $(document).on("mouseover", ".tooltipLuogo", function(f){

      f.preventDefault();
      
    $(document).tooltip({
      tooltipClass: "tooltip-styling",
    }); // A questo punto faccio apparire il tooltip

  });


}); */
