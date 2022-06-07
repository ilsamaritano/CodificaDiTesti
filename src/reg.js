$(document).ready(function(){

    $("reg").hide();

    $("#reg").on("click", function(){

        $("orig").fadeOut();
        $("reg").fadeIn();

        $(".testoorig h3").html("Testo con correzioni")

    });

});