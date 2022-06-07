$(document).ready(function(){

    $("reg").hide();

    $("#reg").on("click", function(){

        $("orig").fadeOut();
        $("reg").fadeIn();

        $(".testorig h3").html("Testo corretto")

    });

});