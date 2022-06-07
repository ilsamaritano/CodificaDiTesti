$(document).ready(function(){

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
        $("img[src='P2_10.jpg']").hide();
        $("img[src='P2_10R.jpg']").fadeIn();
        $("#ruotapag10").html("<a href='#' id='ruotafronte'>Mostra fronte</a>");
          

    });

});


$(document).on('click', '#ruotafronte', function(e) {
        e.preventDefault();

        $("img[src='P2_10R.jpg']").hide();
        $("img[src='P2_10.jpg']").fadeIn();
        $("#ruotafronte").replaceWith("<a href='#' id='ruotapag10'>Mostra retro</a>");
          

});