$(function() {

  function scrollToBottom() {
    $('.chat-main__body').scrollTop( $('.chat-main__body__messages').height() );
  }

  function buildHTML(message) {

    if (message.image_url) {
      var imageEle = '<img src = "' + message.image_url + '">';
    } else {
      var imageEle = '';
    }

    var html =
      '<div class="chat-main__body__messages>' +
      '<div class="chat-main__body__name">' +
      message.name +
      '</div>' +
      '<div class="chat-main__body__date">' +
      message.created_at +
      '</div>' +
      '<div class="chat-main__body__message">' +
      message.body +
      '</div>'  +
      '<div class = "chat-main__body__image">' +
      imageEle +
      '</div>' +
      '</div>' ;
    return html
  }

  scrollToBottom();

  $('#message_image').on('change', function(){
    $(this).parents('#new_message').submit();
  });

// フォーム送信の非同期化
  $('form#new_message').submit(function(e) {
    var $form = $(this);
    e.preventDefault();
    var fd = new FormData($(this)[0]);

    $.ajax(document.location.href + '.json', {
      type: 'POST',
      processData: false,
      contentType: false,
      data: fd,
      dataType: 'json',
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-main__body').append(html);

      $form.get(0).reset();
      scrollToBottom();
    })
    .fail(function() {
      alert("エラーが発生しました");
    });
    return false;
  });

  // メッセージページでのみ実行
  // 10秒に1回チャット部分の更新
  if (document.location.href.match(/\/groups\/\d+\/messages/)) {
    setInterval(function(){
      $.ajax(document.location.href + '.json', {
        type: 'GET',
        dataType: 'json',
        success: function(json) {

          var html = '';
          json.forEach(function(message){
            html += buildHTML(message);
          });

          $('.chat-main__body').html(html);

        },
        error: function(json) {
          alert('エラーが発生しました');
        }
      });
    }, 10 * 1000);
  }
});
