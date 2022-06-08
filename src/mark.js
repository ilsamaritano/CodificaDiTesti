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

      clicked += 1;

       vect = $(".termini");
       

    });

    $("reg").hide();

    $("#reg").on("click", function(){

        clicked += 1;

        vect = $("reg");

        control(clicked, vect, "red");

        if (clicked % 2 == 1) {

            $("orig").hide();
            $("reg").fadeIn();

        }

        if (clicked % 2 == 0) {
                    
            $("orig").fadeIn();
            $("reg").hide();

            }

    });

    $("#gap").on("click", () => {

            clicked += 1;

            vect = $(".gap");

            control(clicked, vect, "green");

        });

    $("#esling").each(function() {

        $(this).on("click", function(e){

            clicked += 1;

            vect = $("mentioned");

            control(clicked, vect, "#dfedff");

            });

        });

    });