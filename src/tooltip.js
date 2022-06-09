
function handler(ev) {

  $(".tooltipTermine").css("display", "none");
  
  var target = $(ev.target);
  var selettore = target.attr('id');
  if( target.is(".tooltipTermine") ) {
     alert('The mouse was over'+ selettore );
  }
}
$(".tooltipTermine").mouseleave(handler);


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
