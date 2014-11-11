// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require gmaps4rails/bing.js
//= require gmaps4rails/googlemaps.js
//= require gmaps4rails/mapquest.js
//= require gmaps4rails/openlayers.js
//= require gmaps4rails/all_apis.js
//= require jquery
//= require jquery.timers-1.2
//= require jquery.easing.1.3
//= require jquery_ujs
//= require jquery.galleryview-3.0-dev
//= require ckeditor/init
//= require ckeditor/override
//= require_tree .

$(function() {
  $('#myGallery').galleryView({
    panel_width: 550,
    panel_height: 330,
    autoplay: true
  });

  $(".more").click(function(e){
    e.preventDefault();

    $(this).parent().parent().parent().find(".entry").find(".hidden").slideToggle();
    if ($(this).html() == "Mniej")
      $(this).html("Więcej");
    else
      $(this).html("Mniej");
  });
});
