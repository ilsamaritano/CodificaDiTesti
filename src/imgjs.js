$(document).ready(function(){

    clicked = 0;

    $("img[src='P2_10R.jpg']").hide();

    $("img[src='P2_10.jpg']").on("mouseover", function (e) {
        
        current = $(e.target);

        $(current).animate({

            opacity: '1',
            width: '90%',
            margin: '20px'
        },
        {
        duration: "slow"
        });
    });

    $("img[src='P2_11.jpg']").on("mouseover", function (e) {
        
        current = $(e.target);

        $(current).animate({

            opacity: '1',
            width: '90%',
            margin: '20px'
        },
        {
        duration: "slow"
        });
    });


    $("img[src='P2_10.jpg']").on("mouseleave", function (e) {
        
        current = $(e.target);

        $(current).animate({

            opacity: '1',
            width: "65%"
        },
        {
        duration: "slow"
        });
    });



    $("img[src='P2_11.jpg']").on("mouseleave", function (e) {
        
        current = $(e.target);

        $(current).animate({

            opacity: '1',
            width: '65%'
        },
        {
        duration: "slow"
        });
    });

    $("#ruotapag10").on("click", function (e) {
        e.preventDefault();

        clicked += 1;

        if(clicked % 2 == 1) {

        $("img[src='P2_10.jpg']").hide();
        $("img[src='P2_10R.jpg']").fadeIn();
        $("#ruotapag10").text("Mostra fronte");

        }

        if(clicked % 2 == 0){

        $("img[src='P2_10.jpg']").fadeIn();
        $("img[src='P2_10R.jpg']").hide();
        $("#ruotapag10").text("Mostra retro");

        }
          

    });

});