$(document).on("turbolinks:load", function() {
// ヘッダー「カテゴリーから探す」プルダウン 第一階層
  $(".toppage-header-top__footer-search-wrapper").hover(function () {
    $(".first-category__wrapper").show()
    }, function () {
    $(".first-category__wrapper").hide()
  });
// ヘッダー「カテゴリーから探す」プルダウン 第二階層
  $(".first-category__wrapper").hover(function () {
    $(".second-category__wrapper").show()
    }, function () {
    $(".second-category__wrapper").hide()
  });
// ヘッダー「カテゴリーから探す」プルダウン 第三階層
  $(".second-category__wrapper").hover(function () {
    $(".third-category__wrapper").show()
    }, function () {
    $(".third-category__wrapper").hide()
  });

// ヘッダー「ブランドから探す」プルダウン
  $(".toppage-header-top__footer-search-brand").hover(function () {
    $(".brand__wrapper").show()
    }, function () {
    $(".brand__wrapper").hide()
  });

  // ヘッダー「お知らせ」プルダウン
  $("li.toppage-header-top__footer-login-content--notice").hover(function () {
    $("ul.toppage-header-top__footer-login-content--notice-lists").show()
    }, function () {
    $("ul.toppage-header-top__footer-login-content--notice-lists").hide()
  });
  // ヘッダー「やることリスト」プルダウン
  $("li.toppage-header-top__footer-login-content--todo").hover(function () {
    $(".toppage-header-top__footer-login-content--todo-list").show()
    }, function () {
    $(".toppage-header-top__footer-login-content--todo-list").hide()
  });
  // ヘッダー「マイページ」プルダウン
  $(".toppage-header-top__footer-login-content--mypage").hover(function () {
    $(".toppage-header-top__footer-login-content--mypage-box").show()
    }, function () {
    $(".toppage-header-top__footer-login-content--mypage-box").hide()
  });

});
