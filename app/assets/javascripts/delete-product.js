$(document).on('turbolinks:load', function(){
  $(function() {
    // ボタンをクリックしたら発動
    $('#delete-button').on('click', function() {
      $('#item-edit-content__delete-confirm').addClass('item-edit-content__deleteon');
    });
    $('#delete-button-cancel').on('click', function() {
      $('#item-edit-content__delete-confirm').removeClass('item-edit-content__deleteon');
    });
  });
});