$(document).ready(function(){

    $("reg").hide();

    $("#reg").on("click", function(){

        $("orig").hide();
        $("reg").animate({width: "60px"}, {duration: "slow"});

        $(".testoorig h3").html("Testo con correzioni")

    });

});