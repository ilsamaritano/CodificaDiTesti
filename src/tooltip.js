jQuery.fn.getParent = function (num) {
  var last = this[0];
  for (var i = 0; i < num; i++) {
    last = last.parentNode;
  }
  return jQuery(last);
};

var nextUntil = function (elem, selector) {
  // Setup siblings array
  var siblings = [];

  // Get the next sibling element
  elem = elem.nextElementSibling;

  // As long as a sibling exists
  while (elem) {
    // If we've reached our match, bail
    if (elem.matches(selector)) break;

    // Otherwise, push it to the siblings array
    siblings.push(elem);

    // Get the next sibling element
    elem = elem.nextElementSibling;
  }

  return siblings;
};

$(function () {
  $(".tooltipTermine").css("display", "none");
  $(".tooltipLuogo").css("display", "none");
  $(".tooltipPersona").css("display", "none");

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

  $(document)
    .on("mouseover", ".numeroRiga", function () {
      // Evidenzia la riga

      id = $(this).attr("id");

      $("#P10_R" + id).css("background", "#9c4837");
      $("#P10_R" + id).css("border", "2px solid #4c2f2f");

      target = $(this);

      target.css("background", "#9c4837");
      target.css("border", "2px solid #4c2f2f");
    })
    .on("mouseout", ".numeroRiga", function () {
      $("#P10_R" + id).css("background", "none");
      target = $(this);
      target.css("background", "none");
      target.css("border", '');
    });

  $(document)
    .on("mouseover", "area", function () {
      // Evidenzia la riga

      aid = $(this).attr("id");

      $(".numeroRiga #" + aid).css("background", "antiquewhite");
    })
    .on("mouseout", "area", function () {
      mid = $(this).attr("id");

      $(".numeroRiga #" + mid).css("background", "none");
    });
});
