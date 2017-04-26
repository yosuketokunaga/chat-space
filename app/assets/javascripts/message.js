$(function() {
  function buildHTML(data) {
    var html =
    '<div class="chat-main__body__name">' +
        message.user.name +
    '</div>' +
    '<div class="chat-main__body__date">' +
        message.created_at +
    '</div>' +
    '<div class="chat-message__body">' +
        message.body +
    '</div>'
    return html;
  }
  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    var group_id = $('.group_id').attr('value');
    var url = '/groups/' + group_id + '/messages.json'
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
      $('.messages').append(html);
    })
    .fail(function() {
      alert('error');
    });
  });
});
