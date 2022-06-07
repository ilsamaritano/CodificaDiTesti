$(document).ready(function(){


function mark(elem, color, _id) {

    $(elem).wrapInner(`<mark id=${_id}></mark>`).contents();
    $("mark #"+_id+"").css("background-color", color);

}

    $("#mark").on("click", function(){

       num = $(".termini").length;
       vect = $(".termini");

        for(i=0; i<=num; i++) {

        mark(vect[i], "yellow", term);

        }

    });

});