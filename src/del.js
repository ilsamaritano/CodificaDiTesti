$(document).ready(function(){

    $("del").hide();


    $("del").on("mouseover", function (e) {
        
        current = $(e.target);
        $("del").fadeIn();

    });


    $("img[src='P2_10.jpg']").on("mouseout", function (e) {
        
        current = $(e.target);
        $("del").fadeOut();
       
    });

});