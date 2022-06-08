$(document).ready(function(){

clicked = 0;

$(".expan").hide();

$("#abbreviazioni").on("click", function(){

        clicked += 1;

        if(clicked % 2 == 1) {

        $(".abbr").css("font-weight", "bold");
        $(".expan").fadeIn();

        }

        if(clicked % 2 == 0) {

        $(".abbr").css("font-weight", "none");
        $(".expan").fadeOu();


        }


    })


});