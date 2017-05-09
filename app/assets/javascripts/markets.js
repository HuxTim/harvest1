$(document).ready(function(){
  $('#new_market_review').submit(function() {
    document.getElementById("market_review_rating").value= (document.getElementById("count").innerHTML);
    return true; // return false to cancel form action
  });

  $("#stores_next").on('click',function() {
    $.ajax({
      url: "/markets/"+ $("#market_id").val() +"/stores",
      dataType: "html",
      type: "GET",
      data: "current_store_page=" + $("#current_store_page").val(),
      success: function(data, success) {
        $('#market_stores').append(data);
        $('#current_store_page').val(parseInt($("#current_store_page").val()) + 1);
      },
      error: function(data, failure) {
        alert("Something wrong happened, Please try again later");
      }
    });
  });

  $("#reviews_next").on('click',function() {
    $.ajax({
      url: "/markets/"+ $("#market_id").val() +"/reviews",
      dataType: "html",
      type: "GET",
      data: "current_review_page=" + $("#current_review_page").val(),
      success: function(data, success) {
        $('#market_reviews').append(data);
        $('#current_review_page').val(parseInt($("#current_review_page").val()) + 1);
      },
      error: function(data, failure) {
        alert("Something wrong happened, Please try again later");
      }
    });
  });

  var clickEvent = false;
  $('#market_details').on('click', '.nav a', function() {
    clickEvent = true;
    $('.nav li').removeClass('active');
    $(this).parent().addClass('active');
  }).on('slid.bs.carousel', function(e) {
    if(!clickEvent) {
      var count = $('.nav').children().length -1;
      var current = $('.nav li.active');
      current.removeClass('active').next().addClass('active');
      var id = parseInt(current.data('slide-to'));
      if(count == id) {
        $('.nav li').first().addClass('active');
      }
    }
    clickEvent = false;
  });
});
