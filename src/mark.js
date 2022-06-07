$(document).ready(function(){


function mark(elem, color, _id) {

    $(elem).wrapInner(`<mark id=${_id}></mark>`).contents();
    $(_id).css("background-color", color);

}

    $("#mark").on("click", function(){

       el = $(".termini");

       mark(el, "yellow", "termi");

    });

    $("reg").hide();

    $("#reg").on("click", function(){

        $("orig").hide();
        $("reg").fadeIn();

        mark($("reg"), "red", "regu");

        if($(".testoorig h3:contains('Testo con cancellazioni')").length > 0) {
             
            $(".testoorig h3").html("Testo con correzioni e cancellazioni");
        } else {

        $(".testoorig h3").html("Testo con correzioni");
        }

    });

});