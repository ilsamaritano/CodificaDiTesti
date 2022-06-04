$(document).on('mouseover', 'abbr', function(e) {

            var attr = $(e.target).attr('title');
            var fratello = $(e.target).next().text();
            var insieme = $(e.target).text() + fratello;
            newStr = insieme.replace(".", '').trim();

            if(typeof attr == 'undefined' || attr == false) {

            $(e.target).attr('title', "Abbreviazione di: " + newStr + " ");

            $(document).tooltip();

            }

         });