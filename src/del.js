$(document).ready(function(){

    clicked = 0;

    $("del").hide();

    $("#del").on("click", function () {

        clicked += 1;

        if(clicked % 2 == 1) {
        
        $("del").fadeIn();

        }
        if(clicked % 2 == 0) {
            $("del").fadeOut();
        }
    });

});