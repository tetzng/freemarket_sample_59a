$('#btn-default.btn-gray').on('click',function(e){
  e.preventDefault();
  $(this).parents('ul').find('li').removeClass('mypage-content__tab--active');
  $(this).parents('li').addClass('mypage-content__tab--active');
  $('#mypage-content__item-list-transaction-old').removeClass('mypage-content__item-list--active');
  $('#mypage-content__item-list-transaction-now').addClass('mypage-content__item-list--active');
});