$(function() {
  function buildHTML(message) {
    var html = (`<div class="chat-main__body">
                  <P class=chat-main__body__name>${ message.user.name }</p>
                  <p class=chat-main__body__date>${ message.created_at }</p>
                  <p class=chat-main__body__message>${ message.body }</p>
                  </div>`);
    return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var fd = new FormData($(this).get(0));
    $.ajax({
      type: 'POST',
      url: form.attr('action'),
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
