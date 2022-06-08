$(document).ready(function(){

    clicked = 0;


    function control(click, vettore, color) {

        if (click % 2 == 1) {

            for (i = 0; i <= vettore.length; i++) {

            vettore[i].style.background = color;

            }

        }

        if (clicked % 2 == 0) {

            for (i = 0; i <= vettore.length; i++) {
                    
            vettore[i].style.background = "none";

            }
        }
    }


    $("#mark").on("click", function(){

       el = $(".termini");
       
       for(i=0;i<=el.length;i++){

           el[i].style.background = "yellow";

       }

    });

    $("reg").hide();

    $("#reg").on("click", function(){

        $("orig").hide();
        $("reg").fadeIn();

        vect = $("reg");
        
        for(i=0;i<=vect.length;i++){

            vect[i].style.background = "red";


        }


        if($(".testoorig h3:contains('Testo con cancellazioni')").length > 0) {
             
            $(".testoorig h3").html("Testo con correzioni e cancellazioni");

        }

        $(".testoorig h3").html("Testo con correzioni");

    });

    $("#gap").on("click", function(){

        $("del").children().show();
        vect = $(".gap");
        
        for(i=0;i<=vect.length;i++){
            
            vect[i].style.background = "green";

        }

    });

    $("#esling").each(function () {

        $(this).on("click", function(e){

            clicked += 1;

            vect = $("mentioned");

            control(clicked, vect, "#dfedff");

            });

        });

    });