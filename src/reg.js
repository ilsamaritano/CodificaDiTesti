$(document).ready(function(){

    $("reg").hide();

    $("#reg").on("click", function(){

        $("orig").hide();
        $("reg").animate({width: "60px"}, {duration: "slow"});

        if($(".testoorig h3:contains('Testo con cancellazioni')").length > 0) {
             
            $(".testoorig h3").html("Testo con correzioni e cancellazioni");
        } else {

        $(".testoorig h3").html("Testo con correzioni");
        }

    });

});