$(document).ready(function(){
    $("img[src='P2_10.jpg']").on("mouseover", function (e) {
        
        current = $(e.target);

        $(current).animate({

            left: '250px',
            opacity: '1',
            height: '150px',
            width: '150px'
        },
        {
        duration: "slow"
        });
    });
});