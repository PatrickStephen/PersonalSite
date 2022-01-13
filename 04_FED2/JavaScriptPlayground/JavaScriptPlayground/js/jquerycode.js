//Below is a fully-qualified ready function
//It waits for HTML and CSS to load before executing the code inside of the function

jQuery(document).ready(function () {
    console.log("jQuery is working!")
});


//We can also use the shortcut
$(function () {

    //Code in here executes AFTER HTML and CSS have loaded

    //SYNTAX:
    // $("css-selector").method(parameters);
    //$('main-content'); == document.getElementById('main-content'); 

    //Target the <li> tags inside of the <ul> for our highlights section,
    //the hide/fadeIn

    $("#highlights li").hide().fadeIn(3000);

    //Target the last <li> and add the custom 'important' class
    $('#highlights li:last-child').addClass('important');

    //.html() and . text() are similar to .innerHTML and .textContent from our vanilla JS
    //.html() will render any HTML characters
    //.text() will escape them and print as plain text
    //When assigning a jQuery selection to a variable, the name is typically preceded with a $

    let $writeless = $("#highlights li:last-child");
    $writeless.text("<em>Write Less, Do More with jQuery</em>"); //prints <em> tags as plain text
    $writeless.html("<em>Write Less, Do More with jQuery</em>"); //renders <em> tags as HTML


    //When the h2#slide is clicked, use slideToggle() on the next sibling
    $("#slide").on("click", function () {
        $(this).next().slideToggle();
    });

    //Make the h2#slide look clickable by changing the CSS
    $("#slide").css("cursor", "pointer");


    //MINI-LAB
    //fadeToggle() some ipsum
    //Change the font-style of the <p> after the h2 to italic
    $("#fade").on("click", function () {
        $(this).next().fadeToggle();
    });

    $("#fade").css("cursor", "pointer");

    $("#fade").next().css("font-style", "italic");


    ////// CUSTOM LIGHTBOX //////
    //When a user clicks on a thumbnail image, it will display this lightbox container and insert
    //an <img> tag

    $(".thumb").on("click", function () {

        //Find the src of the image that was clicked and stroe it as a variable (var)
        var imgSrc = $(this).attr("src");

        //Plug an <img> tag into the #lightbox-content -- we will use imgSrc as the src
        $("#lightbox-content").html('<img src="' + imgSrc + '" class="img-responsive" />');

        //Make the lightbox visible by fading it in
        $("#lightbox-container").fadeIn(500);

        //When the user clicks anywhere in the #lightbox-container, fadeOut()
        $("#lightbox-container").on("click", function () {
            $(this).fadeOut(500);          
        });

    });


});