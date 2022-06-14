
$(window).load(function() {

immagini10 = $("img[src='P2_10.jpg']");

distance10 = immagini10[0].offsetTop;
alert(distance10);

immagini11 = $("img[src='P2_11.jpg']");

distance11 = immagini11[0].offsetTop;


$("area").each(function(index, element) {
  
 init_top = parseFloat($(element).css("top"));
 
 if(index<34) {

  add = parseFloat(init_top)+parseFloat(distance10);

 $(element).css("top", add);


 } else {

  $(element).css("top", init_top+distance11);
  }

 });

});