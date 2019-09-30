$(document).on('turbolinks:load', function () {
  var slideWidth = $('.owl-carousel').outerWidth(); // .slideの幅を取得して代入
  var slideNum = $('.owl-carousel').length; // .slideの数を取得して代入
  var slideSetWidth = slideWidth * slideNum * 1.1; // .slideの幅×数で求めた値を代入
  $('#main').css('width', slideSetWidth); // .slideSetのスタイルシートにwidth: slideSetWidthを指定

  // スライド機能
  $('.owl-carousel-sub').mouseover(function(){
    var index = $('.owl-carousel-sub').index(this);
    setTimeout(function(){
      $('#main').animate({
        left: slideWidth * -index
      },350);
    },350);
  })
  // 透明度の設定
    $("#thumbs").children('img').css("opacity", '0.4');
    $("#thumbs").children('img').eq(0).css("opacity", '1.0');
    $("#thumbs").children('img').on('mouseover', function(){
    $("#thumbs").children('img').css("opacity", '0.4');
    $(this).css('opacity', '1');
  });
});
