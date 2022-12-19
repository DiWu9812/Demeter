// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
    $("#addNewIng").click(function(){
      $("#recipeSet").append($("#new_ingredient_form").html());
    });
    $("div#recipeSet").on('click', '.removeNewFormation', function(){
        $(this).closest('.ingredientForm').remove();
    });
  });

$(document).ready(function() {
    var step_text = $("#steps");
    var counter     = $("#counter");
    var max_length  = counter.data("maximum-length");

    step_text.keyup(function() {
        counter.text(max_length - $(this).val().length);
    });
});
