$(document).ready(function(){

    click5 = 0;

    $("del").hide();

    $("#del").on("click", function () {

        click5 += 1;

        if(click5 % 2 == 1) {
        
        $("del").fadeIn();
        $(".gaps").fadeIn();

        }
        if(click5 % 2 == 0) {
            $("del").fadeOut();
            $(".gaps").fadeOut();
        }
    });

});