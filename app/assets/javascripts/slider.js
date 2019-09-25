// Slick(トップページスライダー)の設定
// [Slick](https://github.com/kenwheeler/slick/)

$(function() {
  $('.toppage-slider__wrapper').slick({
      // ドットにクラスを追加
      dotsClass: 'slide-dots',
      // ドットを追加する要素を指定
      appendDots: $('.toppage-slider'),
      // スライダー矢印の指定
      prevArrow:'<i class="fas fa-chevron-left", id="prev-arrow"></i>',
      nextArrow:'<i class="fas fa-chevron-right", id="next-arrow"></i>',
      // ドットの有無
      dots: true,
      // 自動再生
      autoplay: true,
      autoplaySpeed: 4000,
      speed: 800,
  });

  // ドットの操作
  $('.slide-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});
