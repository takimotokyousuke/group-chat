
$(function(){
  function build(message){
    if (message.image){
      var html =
      `<div class="content1__contents__font">
        <div class="content1__contents__font__fonts">
          <div class="content1__contents__font__fonts__user-name">
            ${chat.user_name}
          </div>
          <div class="content1__contents__font__fonts__date">
            ${chat.crated_at}
          </div>
          <div class="content1__contents__font__fonts__content">
            ${chat.content}
          </div>
          <img src=${message.content}>
        </div>
       </div>
      </div>`
    return html;
    } else{
      var html =
        `<div class="content1__contents__font">
          <div class="content1__contents__font__fonts">
            <div class="content1__contents__font__fonts__user-name">
              ${chat.user_name}
            </div>
            <div class="content1__contents__font__fonts__date">
              ${chat.crated_at}
            </div>
            <div class="content1__contents__font__fonts__content">
              ${chat.content}
            </div>
          </div>
        </div>`
      return html;
    };
    }
  $('#chat_content').on('submit', function(e){
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
      })
  })
});