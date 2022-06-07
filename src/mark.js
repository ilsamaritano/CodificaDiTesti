$(document).ready(function(){


/* function mark(elem, color, _id) {

    $(elem).wrapInner(`<mark id=${_id}></mark>`).contents();
    $("mark #"+_id+"").css("background-color", color);

} */

    $("#mark").on("click", function(){

       el = $(".termini");

       $(el).wrapInner("<span id='termi'></span>").contents();
       $("#termi").css("background-color", "yellow");

    });

    $("reg").hide();

});


$(document).ready(function(){

    $("#reg").on("click", function(){

        $("orig").hide();
        $("reg").fadeIn();

        $("reg").wrapInner("<mark id='regu'></mark>").contents();
        $("#regu").css("background-color", "red");

        if($(".testoorig h3:contains('Testo con cancellazioni')").length > 0) {
             
            $(".testoorig h3").html("Testo con correzioni e cancellazioni");
        } else {

        $(".testoorig h3").html("Testo con correzioni");
        }

    });

});