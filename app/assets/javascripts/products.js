$(document).ready(function() {
  $('#finish_upload').addClass('disabled');
  // $('#store_image_upload').addClass('disabled');
  // $('#store_image_upload').removeClass('dz-clickable"');

  $("#product_new_next_step").click(function() {
    var valuesToSubmit = $("#new_store").serialize();
    $.ajax({
      url: "/stores",
      dataType: "json",
      type: "POST",
      data: valuesToSubmit,
      success: function(data, success) {
        document.getElementById("store_id").value = data['store_id']
        $('#finish_upload').removeClass('disabled');
        jQuery('#add_product_image').css({ opacity: 1});
      },
      error: function(data, failure) {
        alert("Something Wrong Happen, Please try it later");
      }
    });
  });
});

$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = false;

  // grap our upload form by its id
  $("#product_image_upload").dropzone({
    // restrict image size to a maximum 1MB
    maxFilesize: 5,
    // changed the passed param to one accepted by
    // our rails app
    paramName: "product_image[image]",
    // show remove links on each image upload
    addRemoveLinks: true
  });
});

$(document).ready(function() {
  $('#product_tags').multiselect();
});
