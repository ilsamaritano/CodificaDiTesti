$(document).ready(function(){

    $("img[src='P2_10R.jpg']").hide();

    $("img[src='P2_10.jpg']").on("mouseover", function (e) {
        
        current = $(e.target);

        $(current).animate({

            opacity: '1',
            height: '400px',
            width: '300px'
        },
        {
        duration: "slow"
        });
    });


    $("img[src='P2_10.jpg']").on("mouseout", function (e) {
        
        current = $(e.target);

        $(current).animate({

            opacity: '1',
            height: '200px',
            width: '150px'
        },
        {
        duration: "slow"
        });
    });

    $("#ruotapag10").on("click", function (e) {

        $("img[src='P2_10.jpg']").hide();
        $("img[src='P2_10R.jpg']").fadeIn();
        $(this).html("Mostra fronte");


    });

    
});