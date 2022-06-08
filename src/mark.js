$(document).ready(function(){


/* function mark(elem, color, _id) {

    $(elem).wrapInner(`<span id=${_id}></span>`).contents();
    $("#").css("background-color", color);

} */ 

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

    var clicked=0;

    $("#esling").each(function () {

        $(this).on("click", function(e){

            clicked += 1;

            vettore = $("mentioned");

                if (clicked % 2 == 1) {

                    for (i = 0; i <= vettore.length; i++) {

                    vettore[i].style.background = "#dfedff";

                    }

                }

                if (clicked % 2 == 0) {

                    for (i = 0; i <= vettore.length; i++) {
                            
                    vettore[i].style.background = "none";
    
                    }
                }

            });

        });

    });