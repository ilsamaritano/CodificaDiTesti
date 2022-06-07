$(document).ready(function(){


    $("#mark").on("click", function(){

       el = $(".termini");

       $(el).wrapInner("<mark id='termi'></mark>").contents();
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