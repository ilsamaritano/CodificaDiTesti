$(function() {

 $("#map").one("click", function () {

    $("del").fadeOut();
    $(".gaps").fadeOut();

    immagini10 = $("img[src='P2_10.jpg']");

    distance10 = immagini10[0].offsetTop;

    immagini11 = $("img[src='P2_11.jpg']");

    distance11 = immagini11[0].offsetTop;

    if ($(this).prop("checked") == true) {

        $("area").each(function (index, element) {

            init_top = parseFloat($(element).css("top"));

            if (index < 34) {

                add = parseFloat(init_top) + parseFloat(distance10);

                $(element).css("top", add);


                } else {

                $(element).css("top", init_top + distance11);
                 }

           });
    
        } else {

            if ($(this).prop("checked") == false) {

                $("area").each(function (index, element) {

                    init_top = parseFloat($(element).css("top"));
        
                    if (index < 34) {
        
                        sottr = parseFloat(init_top) - parseFloat(distance10);
        
                        $(element).css("top", sottr);
        
        
                        } else {
        
                        $(element).css("top", init_top - distance11);
                         }
        
                   });
        
             }

        }

    });
});