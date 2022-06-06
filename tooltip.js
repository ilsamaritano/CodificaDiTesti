$(document).on("mouseover", "abbr", function (e) {
  // Nomino la funzione per gestire il target corrente

  var attr = $(e.target).attr("title"); // Ottengo l'attributo title del tag <abbr> correntemente selezionato
  var fratello = $(e.target).next().text(); // Ottengo il fratello, seguendo la gerarchia DOM, in questo caso il testo contenuto in <expan>
  var insieme = $(e.target).text() + fratello; // Compongo quindi il testo dell'abbr corrente (abbreviato) con quello (espanso) in <expan>
  newStr = insieme.replace(".", "").trim(); // Tolgo il "." dalla stringa così ottenuta e trimmo per "unirla"

  if (typeof attr == "undefined" || attr == false) {
    // Controllo se il "title" non esiste già...se non esiste...

    $(e.target).attr("title", "Abbreviazione di: " + newStr + " "); // Allora lo aggiungo e ci inserisco la stringa

    $(document).tooltip(); // A questo punto faccio apparire il tooltip
  }
});