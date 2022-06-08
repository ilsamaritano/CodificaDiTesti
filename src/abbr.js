$(document).ready(function(){

clicked = 0;

$("#abbreviazioni").on("click", function(){

clicked += 1;

        if(clicked % 2 == 1) {

        $(".abbr").css("font-weight", "bold");

        }

        if(clicked % 2 == 0) {

        $(".abbr").css("font-weight", "none");

        }


    })


});