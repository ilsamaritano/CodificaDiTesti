$(document).ready(function(){

    $("del").hide();

    $("#del").on("click", function () {
        
        $("del").fadeIn();

        if($(".testoorig h3:contains('Testo con correzioni')").length > 0) {
             
            $(".testoorig h3").html("Testo con correzioni e cancellazioni");
        } else {

        $(".testoorig h3").html("Testo con cancellazioni");
        }
    });

});