$(function() {
  $(".tooltipTermine").css("display", "none");
  $(".tooltipLuogo").css("display", "none");
  $(".tooltipPersona").css("display", "none");
  $('.testoorig').contents().each((i, c) => {
    // wrap text content nodes with a span
    if (c.nodeType === 3) {
      $(c).wrap('<span class="new-span" />');
    }
  });
});

  $(document).on("mouseover", ".termini", function (e) {
    e.preventDefault();

    var target = $(e.target);
    if (target.is(".termini")) {
      var selettore = target.attr("id");
      selett = selettore.replace("#", "").trim(); // Rimuovo l'#
      var desc = $(`#desc_${selett}`).text(); // Ottengo la stringa descrittiva
    } else {
      if (target.is(".abbr")) {
        // Bugfix per le abbreviazioni

        father = target.getParent(1); // E' necessario risalire il DOM e ritornare al padre span .termini
        var selettore = father.attr("id"); // Riprendere il suo ID e stesso procedimento
        selett = selettore.replace("#", "").trim(); // Rimuovo l'#
        var desc = $(`#desc_${selett}`).text(); // Ottengo la stringa descrittiva
      }
    }

    $(target).attr("title", desc); // aggiungo e ci inserisco la stringa

    $(document).tooltip({
      tooltipClass: "tooltip-styling",
    }); // A questo punto faccio apparire il tooltip
  });

  $(document).on("mouseover", ".placeName", function (f) {
    f.preventDefault();

    target = $(f.target);

    if (target.is(".placeName")) {
      var selettore = target.attr("id");
      selett = selettore.replace("#", "").trim(); // Rimuovo l'#
      var desc = $(`#desc_${selett}`).text(); // Ottengo la stringa descrittiva
    }

    $(f.target).attr("title", desc);

    $(document).tooltip({
      tooltipClass: "tooltip-styling-place",
    }); // A questo punto faccio apparire il tooltip
  });

  $(document).on("mouseover", ".author", function (f) {
    f.preventDefault();

    target = $(f.target);

    if (target.is(".author")) {
      var selettore = target.attr("id");
      selett = selettore.replace("#", "").trim(); // Rimuovo l'#
      var desc = $(`#desc_${selett}`).text(); // Ottengo la stringa descrittiva
    }

    $(f.target).attr("title", desc);

    $(document).tooltip({
      tooltipClass: "tooltip-styling-place",
    }); // A questo punto faccio apparire il tooltip
});


/******************************************** */

$(document).on('mouseover', '.numeroRiga', function() {
  id = $(this).attr("id");
  const target = $(this);
  const lineEls = target.nextUntil('.numeroRiga').add(target);
  rid = "P10_R"+id;

  lineEls.css('background', 'antiquewhite');
  $("#P10_R"+id).css("background", "antiquewhite");
})
.on('mouseout', '.numeroRiga', function() {
  $('.testoorig').children().css('background', '');
  $("#P10_R"+id).css("background", '');
});