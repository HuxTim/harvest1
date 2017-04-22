$(document).ready(function() {
  $('#finish_upload').addClass('disabled');

  $("#store_new_next_step").click(function() {
    var valuesToSubmit = $("#new_store").serialize();
    var market_ids = "";
    for (i = 0; i < $('.selected_tag').length; i++) {
      market_ids += $('.selected_tag').eq(i).attr('id') + ",";
    }
    var formdata = valuesToSubmit+"&market_ids="+market_ids;
    $.ajax({
      url: "/stores",
      dataType: "json",
      type: "POST",
      data: formdata,
      success: function(data, success) {
        $("#store_new_next_step").addClass('disabled')
        $("#new_store").addClass('disabled')
        $("#new_store input").prop("disabled", true);
        $('#add_description *').click(false);
        document.getElementById("store_id").value = data['store_id'];
        $('#finish_upload').removeClass('disabled');
        jQuery('#add_store_image').css({ opacity: 1});
        // Dropzone.storeImageUpload.options = {
        //   // restrict image size to a maximum 1MB
        //   clickable: true,
        //   maxFiles: 5,
        //   parallelUploads: 10,
        //   maxFilesize: 5,
        //   // changed the passed param to one accepted by
        //   // our rails app
        //   paramName: "store_image[image]",
        //   // show remove links on each image upload
        //   addRemoveLinks: false
        // };
      },
      error: function(data, failure) {
        alert(data);
      }
    });
  });

  $("#market_search_button").click(function() {
    var valuesToSubmit = $("#query_market").serialize();
    $.ajax({
      url: "/stores/new/markets",
      dataType: "json",
      type: "GET",
      data: valuesToSubmit,
      success: function(data, success) {
         document.getElementById("search_results").innerHTML = ""
         var arr = [];
         for (i = 0; i < $('.selected_tag').length; i++) {
           arr.push(Number($('.selected_tag').eq(i).attr('id')))
         }

        for (i = 0; i < data['markets'].length; i++) {
          if(!arr.includes(Number(data['markets'][i]['id'])))
          document.getElementById("search_results").innerHTML += ("<div class='btn btn-primary market_tag' name='market_tag' id='"+data['markets'][i]['id']+"'>" + data['markets'][i]['name']+"</div>");
         }
      },
      error: function(data, failure) {
        alert(data);
      }
    });
  });
});

$(document).on("click", '.market_tag', function(event) {
   document.getElementById("selected_results").innerHTML += ("<div class='btn btn-success selected_tag' name='selected_market' id='"+ $(this).attr('id') +"'>"+$(this).html()+"</div>");
   $(this).remove();
});

$(document).on("click", '.selected_tag', function(event) {
  document.getElementById("search_results").innerHTML += ("<div class='btn btn-primary market_tag' name='market_tag' id='"+$(this).attr('id')+"'>" + $(this).html()+"</div>");
  $(this).remove();
});

$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = false;
  // grap our upload form by its id
  $("#store_image_upload").dropzone({
    // restrict image size to a maximum 1MB
    clickable: false,
    maxFiles: 5,
    parallelUploads: 10,
    maxFilesize: 5,
    // changed the passed param to one accepted by
    // our rails app
    paramName: "store_image[image]",
    // show remove links on each image upload
    addRemoveLinks: false
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

$('#store_details').on('click', '.nav a', function() {
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

$("#products_next").click(function() {
  $.ajax({
    url: "/stores/"+ $("#store_id").val() +"/products",
    dataType: "html",
    type: "GET",
    data: "current_product_page=" + $("#current_product_page").val(),
    success: function(data, success) {
      $('#store_products').append(data);
      $('#current_product_page').val(parseInt($("#current_product_page").val()) + 1);
    },
    error: function(data, failure) {
      alert(success);
    }
  });
});

var __slice = [].slice;

(function($, window) {
  var Starrr;

  Starrr = (function() {
    Starrr.prototype.defaults = {
      rating: void 0,
      numStars: 5,
      change: function(e, value) {}
    };

    function Starrr($el, options) {
      var i, _, _ref,
      _this = this;

      this.options = $.extend({}, this.defaults, options);
      this.$el = $el;
      _ref = this.defaults;
      for (i in _ref) {
        _ = _ref[i];
        if (this.$el.data(i) != null) {
          this.options[i] = this.$el.data(i);
        }
      }
      this.createStars();
      this.syncRating();
      this.$el.on('mouseover.starrr', 'span', function(e) {
        return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('mouseout.starrr', function() {
        return _this.syncRating();
      });
      this.$el.on('click.starrr', 'span', function(e) {
        return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('starrr:change', this.options.change);
    }

    Starrr.prototype.createStars = function() {
      var _i, _ref, _results;

      _results = [];
      for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
        _results.push(this.$el.append("<span class='gi-2x glyphicon .glyphicon-star-empty'></span>"));
      }
      return _results;
    };

    Starrr.prototype.setRating = function(rating) {
      if (this.options.rating === rating) {
        rating = void 0;
      }
      this.options.rating = rating;
      this.syncRating();
      return this.$el.trigger('starrr:change', rating);
    };

    Starrr.prototype.syncRating = function(rating) {
      var i, _i, _j, _ref;

      rating || (rating = this.options.rating);
      if (rating) {
        for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
        }
      }
      if (rating && rating < 5) {
        for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
        }
      }
      if (!rating) {
        return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
      }
    };

    return Starrr;

  })();

  return $.fn.extend({
    starrr: function() {
      var args, option;

      option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return this.each(function() {
        var data;

        data = $(this).data('star-rating');
        if (!data) {
          $(this).data('star-rating', (data = new Starrr($(this), option)));
        }
        if (typeof option === 'string') {
          return data[option].apply(data, args);
        }
      });
    }
  });
})(window.jQuery, window);

$(function() {
  return $(".starrr").starrr();
});

$( document ).ready(function() {

  $('#ratings').on('starrr:change', function(e, value){
    $('#count').html(value);
  });

  $('#ratings-existing').on('starrr:change', function(e, value){
    $('#count-existing').html(value);
  });
});
