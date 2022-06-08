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

    $("#esling").on("click", (e) => {

            e.preventDefault();

            vect = $("mentioned");

            for (i = 0; i <= vect.length; i++) {

                if(vect[i].style.background != "#dfedff") {

                  vect[i].style.background = "#dfedff";
            }
        
       }

    });

});