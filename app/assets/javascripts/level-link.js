$(document).on("turbolinks:load", function() {
// ヘッダー「カテゴリーから探す」プルダウン 第一階層
  $(".toppage-header-top__footer-search-wrapper").hover(function () {
    $(".first-category__wrapper").show()
    }, function () {
    $(".first-category__wrapper").hide()
  });

  // 各カテゴリーとクラスの紐付け
  const firstCategory = 'li.first-category';
  const secondCategory = 'li.second-category';
  const thirdCategory = 'li.third-category';

  // 第二階層カテゴリー表示テンプレ
  function showSubCategory(data){
    let showSub = `<li class="second-category" data-category-id="" data-category-sub="${data.id}" data-category-sub-sub="${data.sub_sub}">
                  <div>
                  ${data.name}
                   </div>
                   <ul class="third-category__wrapper">
                   <li class="third-category" data-category-id="" data-category-sub="" data-category-sub_sub="">
                   ${data.name}
                   </li>`;
                  $(".second-category__wrapper").append(showSub);
  }

  // 第二階層マウスオーバー表示
  $("li.first-category").hover(function () {

    let firstId = $(this).last().attr('data-category-id');
    let secondId = $(this).last().attr('data-category-sub');
    let thirdId = $(this).last().attr('data-category-sub-sub');
    let data = {id: firstId,
                sub: secondId,
                sub_sub: thirdId };
    console.log(data);

    $.ajax({
      url: '/sell',
      type: 'GET',
      data: data,
      dataType: 'json',
    })

      .done(function(categories){
        $(secondCategory).remove();
        $(thirdCategory).remove();
        $(".second-category__wrapper").show()
        , function () {
        $(".second-category__wrapper").hide()
        };
        categories.forEach(function(data){
        showSubCategory(data);
        })
      })
      .fail(function(){
        alert('カテゴリーがありません');
      });
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
