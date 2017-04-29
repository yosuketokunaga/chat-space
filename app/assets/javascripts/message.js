$(function() {
  function buildHTML(message) {
    return (`<div class="chat-main__body">
            <div class=chat-main__body__name>${ message.user.name }</div>
            <div class=chat-main__body__date>${ message.created_at }</div>
            <div class=chat-main__body__message>${ message.body }</div>
            </div>`);
  }

  $('.chat-main__footer__block__right').on('submit', function(e) {
    e.preventDefault();
    var fd = new FormData($(this).get(0));
    var current_url = location.pathname;

    $.ajax({
      type: 'POST',
      url: current_url,
      data: fd,
      contentType : false,
      processData : false,
      dataType: 'json'
    })
    
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-main__body').append(html);
    })
    .fail(function() {
      alert('メッセージの送信に失敗しました。');
    });
    return false;
  });
  $('.chat-main__body').animate({
    scrollTop: $(document).height()
  },1500);
});
