$(document).ready(function() {
  $('.likes-link').on('click', function(event) {
    event.preventDefault();
    debugger

    var likeCount = $(this).siblings('.likes_count');
    // click again uncount
    $.post(this.href, function(response) {
      likeCount.text(response.new_like_count);
    });

  });

});