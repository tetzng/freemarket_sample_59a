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
    let showSub = `<li class="second-category" data-category-id="${data.id}">
                  <div>
                  ${data.name}
                   </div>`;
                  $("ul.second-category__wrapper").append(showSub);
  }

  // 第三階層カテゴリー表示テンプレ
  // function showSubSubCategory(data){
  //   let showSubSub = `<li class="third-category" data-category-id="${data.id}">
  //                 <div>
  //                 ${data.name}
  //                  </div>`;
  //                 $("ul.third-category__wrapper").append(showSubSub);
  // }

  // <ul class="third-category__wrapper">
  // <li class="third-category" data-category-id="${data.id}">
  // ${data.name}
  // </li>

  // 第二階層マウスオーバー表示
  $("li.first-category").hover(function () {

    let firstId = $(this).attr('data-category-id');
    let secondId = "0";
    let data = {sub: firstId,
                sub_sub: secondId };

    $.ajax({
      url: '/sell',
      type: 'GET',
      data: data,
      dataType: 'json',
    })

      .done(function(categories){
        $(document).addClass(".first-category--active");

        $(secondCategory).remove();
        $(thirdCategory).remove();
        $(".second-category__wrapper").show();
        categories.forEach(function(data){
        showSubCategory(data)
        })
      })
      .fail(function(){
        alert('カテゴリーがありません');
      });
  });

  第三階層マウスオーバー表示
  $("li.second-category").hover(function () {
    console.log('ok');
    let secondId = $(this).attr('data-category-id');
    let thirdId = $(this).attr('id');
    let data = {sub: secondId,
                sub_sub: thirdId };
    console.log(secondId);
    console.log(thirdId);

    $.ajax({
      url: '/sell',
      type: 'GET',
      data: data,
      dataType: 'json',
    })

      .done(function(categories){
        $(thirdCategory).remove();
        $(".third-category__wrapper").show();
        categories.forEach(function(data){
        sshowSubSubCategory(data)
        })
      })
      .fail(function(){
        alert('カテゴリーがありません');
      });
  });

        // $("ul.second-category__wrapper").show();
        // $("li.second-category").show()
        // }, function () {
      //   $(".second-category__wrapper").hide();

        //   // ヘッダー「カテゴリーから探す」プルダウン 第三階層
      //   $(".second-category__wrapper").hover(function () {
      //     $(".third-category__wrapper").show()
      //     }, function () {
      //     $(".third-category__wrapper").hide()
      //   });
      // })

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
