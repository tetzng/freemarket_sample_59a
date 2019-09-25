$(function () {
  $(".first-category__wrapper").hide();
  $(".second-category__wrapper").hide();
  $(".third-category__wrapper").hide();
  $(".brand__wrapper").hide();

  $(".toppage-header-top__footer-search-wrapper").hover(function () {
    $(".first-category__wrapper").show()
  }, function () {
    $(".first-category__wrapper").hide()
  });

  $(".first-category__wrapper").hover(function () {
    $(".second-category__wrapper").show()
  }, function () {
    $(".second-category__wrapper").hide()
  });

  $(".second-category__wrapper").hover(function () {
    $(".third-category__wrapper").show()
  }, function () {
    $(".third-category__wrapper").hide()
  });

  $(".toppage-header-top__footer-search-brand").hover(function () {
    $(".brand__wrapper").show()
  }, function () {
    $(".brand__wrapper").hide()
  });

});
