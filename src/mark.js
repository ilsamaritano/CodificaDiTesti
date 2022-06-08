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

       click1 += 1;

       vect = $(".termini");
       
       control(click1, vect, "yellow");

    });

    $("reg").hide();

    $("#reg").on("click", function(){

        click2 += 1;

        $("orig").hide();
        $("reg").fadeIn();

        vect = $("reg");

        control(click2, vect, "red");

    });

    $("#gap").on("click", () => {

            click3 += 1;

            vect = $(".gap");

            control(click3, vect, "green");

        });

    $("#esling").each(function() {

        $(this).on("click", function(e){

            clicked += 1;

            vect = $("mentioned");

            control(clicked, vect, "#dfedff");

            });

        });

    });