$(document).ready(function(){


function mark(elem, color, _id) {

    $(elem).wrapInner(`<span id=${_id}></span>`).contents();
    $("#"+_id).css("background-color", color);

} 

    $("#mark").on("click", function(){

       el = $(".termini");

       $(el).wrapInner("<mark id='termi'></mark>").contents();

    });

    $("reg").hide();

$("#reg").on("click", function(){

        $("orig").hide();
        $("reg").fadeIn();

        vect = $("reg");

        //$("reg").wrapInner("<span id='regu'></span>").contents();
        
        for(i=0;i<=vect.length;i++){

            mark(vect[i], "red", "regu");

        }

        $("#regu").css("background-color", "red");

        if($(".testoorig h3:contains('Testo con cancellazioni')").length > 0) {
             
            $(".testoorig h3").html("Testo con correzioni e cancellazioni");
        } else {

        $(".testoorig h3").html("Testo con correzioni");
        }

    });

});