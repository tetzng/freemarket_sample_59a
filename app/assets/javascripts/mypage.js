$(document).on('turbolinks:load', function(){
  $('#mypage-content__tab-notification').on('click',function(e){
    e.preventDefault();
    $(this).parents('ul').find('li').removeClass('mypage-content__tab--active');
    $(this).parents('li').addClass('mypage-content__tab--active');
    $('#mypage-content__item-list-todo').removeClass('mypage-content__item-list--active');
    $('#mypage-content__item-list-notification').addClass('mypage-content__item-list--active');
  });

  $('#mypage-content__tab-todo').on('click',function(e){
    e.preventDefault();
    $(this).parents('ul').find('li').removeClass('mypage-content__tab--active');
    $(this).parents('li').addClass('mypage-content__tab--active');
    $('#mypage-content__item-list-notification').removeClass('mypage-content__item-list--active');
    $('#mypage-content__item-list-todo').addClass('mypage-content__item-list--active');
  });

  $('#mypage-content__tab-transaction-now').on('click',function(e){
    e.preventDefault();
    $(this).parents('ul').find('li').removeClass('mypage-content__tab--active');
    $(this).parents('li').addClass('mypage-content__tab--active');
    $('#mypage-content__item-list-transaction-old').removeClass('mypage-content__item-list--active');
    $('#mypage-content__item-list-transaction-now').addClass('mypage-content__item-list--active');
  });

  $('#mypage-content__tab-transaction-old').on('click',function(e){
    e.preventDefault();
    $(this).parents('ul').find('li').removeClass('mypage-content__tab--active');
    $(this).parents('li').addClass('mypage-content__tab--active');
    $('#mypage-content__item-list-transaction-now').removeClass('mypage-content__item-list--active');
    $('#mypage-content__item-list-transaction-old').addClass('mypage-content__item-list--active');
  });
});