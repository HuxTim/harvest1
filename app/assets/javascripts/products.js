$(document).ready(function() {
  $('.check-product').click(function(){
    var id = $(this).attr('id')
    $.ajax({
      url: "/products/" + id,
      dataType: "html",
      type: "GET",
      success: function(data, success) {
        $('#checkProductPanel .modal-body').empty()
        $('#checkProductPanel .modal-body').append(data);
      },
      error: function(data, failure) {
        alert("Something wrong happened, Please try again later");
      }
    });
  });
});
