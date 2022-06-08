$(document).ready(function(){

    clicked = 0;
    click1 = 0;
    click2 = 0;
    click3 = 0;

    function control(click, vettore, color) {

        if (click % 2 == 1) {

            for (i = 0; i <= vettore.length; i++) {

            vettore[i].style.background = color;

            }

        }

        if (click % 2 == 0) {

            for (i = 0; i <= vettore.length; i++) {
                    
            vettore[i].style.background = "none";

            }
        }
    }


    $("#mark").on("click", function(){

      clicked += 1;

       vect = $(".termini");
       
       control(clicked, vect, "yellow");

    });

    $("reg").hide();

    $("#reg").on("click", function(){

        click1 += 1;

        $("reg").fadeIn();

        vect = $("reg");

        if (click1 % 2 == 1) {

            $("orig").hide();
            $("reg").fadeIn();

        }

        if (click1 % 2 == 0) {
                    
            $("orig").fadeIn();
            $("reg").hide();

        }

    });

    $("#gap").on("click", () => {

            click2 += 1;

            vect = $(".gap");

            control(click2, vect, "green");

        });

    $("#esling").each(function() {

        $(this).on("click", function(e){

            click3 += 1;

            vect = $("mentioned");

            control(click3, vect, "#dfedff");

            });

        });

    });