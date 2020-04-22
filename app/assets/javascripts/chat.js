
$(function(){
  function buildHTML(chat){
    if (chat.image){
      var html =
      `<div class="content1">
        <div class="content1__contents">
          <div class="content1__contents__font">
            ${chat.content}
            <img src=${chat.image}>
          </div>
        </div>
      </div>`
    return html;
    } else{
      var html =
        `<div class="content1">
          <div class="content1__contents">
            <div class="content1__contents__font">
              ${chat.content}
            </div>
          </div>
        </div>`
      return html;
    };
    }
$('.form__forms').on('submit', function(e){
    e.preventDefault();
    var formData =  new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
      .done (function(data){
        var html = buildHTML(data);
        $('.content1__contents__font').append(html);
        $('form')[0].reset();
        $('.content1__contents__font').animate({ scrollTop: $('.content1__contents__font')[0].scrollHeight});
        $('.form__send').prop('disabled',false);
      })
      .fail(function(){
        alert("メッセージ送信を入力してください");
        $('.form__send').prop('disabled',false);
      });
})
});