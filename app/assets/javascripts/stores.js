$(document).ready(function() {
  $('#finish_upload').addClass('disabled');
  // $('#store_image_upload').addClass('disabled');
  // $('#store_image_upload').removeClass('dz-clickable"');

  $("#store_new_next_step").click(function() {
    var valuesToSubmit = $("#new_store").serialize();
    $.ajax({
      url: "/stores",
      dataType: "json",
      type: "POST",
      data: valuesToSubmit,
      success: function(data, success) {
        document.getElementById("store_id").value = data['store_id']
        $('#finish_upload').removeClass('disabled');
        jQuery('#add_store_image').css({ opacity: 1});
      },
      error: function(data, failure) {
        alert(data);
      }
    });
  });
});

$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = false;

  // grap our upload form by its id
  $("#store_image_upload").dropzone({
    // restrict image size to a maximum 1MB
    maxFilesize: 5,
    // changed the passed param to one accepted by
    // our rails app
    paramName: "store_image[image]",
    // show remove links on each image upload
    addRemoveLinks: true
  });
});

$(function() {
  $.rails.allowAction = function(link) {
    if (!link.attr('data-confirm')) {
      return true;
    }
    $.rails.showConfirmDialog(link);
    return false;
  };
  $.rails.confirmed = function(link) {
    link.removeAttr('data-confirm');
    return link.trigger('click.rails');
  };
  return $.rails.showConfirmDialog = function(link) {
    var html, message;
    message = link.attr('data-confirm');
    html = "<div class=\"modal\" id=\"confirmationDialog\">\n  <div class=\"modal-dialog\">\n    <div class=\"modal-content\">\n      <div class=\"modal-header\">\n        <a class=\"close\" data-dismiss=\"modal\">×</a>\n        <h4>Message<h4>\n      </div><div class = \"well\">\n      " + message + "</div>\n      <div class=\"modal-footer\">\n        <a data-dismiss=\"modal\" class=\"btn btn-default\">" + (link.data('cancel')) + "</a>\n        <a data-dismiss=\"modal\" class=\"btn btn-primary confirm\">" + (link.data('ok')) + "</a>\n      </div>\n    </div>\n  </div>\n</div>";
    $(html).modal();
    return $('#confirmationDialog .confirm').on('click', function() {
      return $.rails.confirmed(link);
    });
  };
});
