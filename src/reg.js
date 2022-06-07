$(document).ready(function(){

    $("reg").hide();

    $("#reg").on("click", function(){

        $("orig").fadeOut();
        $("reg").animate({width: "10px"}, {duration: "slow"});

        $(".testoorig h3").html("Testo con correzioni")

    });

});