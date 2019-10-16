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
  function showSubCategory(data, dataSecond){
    let showSub = `<li class="second-category" data-category-id="" data-category-sub="${data.id}" data-category-sub-sub="${data.sub}">
                  <div>
                  ${data.name}
                   </div>
                   <ul class="third-category__wrapper">
                   <li class="third-category" data-category-id="" data-category-sub="" data-category-sub_sub="">
                   ${data.name}
                   </li>`;
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

  // 第二階層マウスオーバー表示
  $("li.first-category").hover(function () {

    let firstId = $(this).last().attr('data-category-id');
    let secondId = $(this).last().attr('data-category-sub');
    let thirdId = $(this).last().attr('data-category-sub-sub');
    let data = {id: firstId,
                sub: secondId,
                sub_sub: thirdId };

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
        showSubCategory(data)
        })
                  // ヘッダー「カテゴリーから探す」プルダウン 第三階層
      //             $(".second-category__wrapper").hover(function () {
      //               $(".third-category__wrapper").show()
      //               }, function () {
      //               $(".third-category__wrapper").hide()
      //             });
      // })
      .fail(function(){
        alert('カテゴリーがありません');
      });
  });
});

  // 第三階層マウスオーバー表示
  // $(document).on({
  //     'mouseenter': function() {
  //       let firstId = $(this).attr('data-category-id');
  //       let secondId = $(this).attr('data-category-sub');
  //       let thirdId = $(this).attr('data-category-sub-sub');
  //       let dataSecond = {  id: firstId, 
  //                           sub: secondId,
  //                           sub_sub: thirdId };
  //       console.log(dataSecond);
  //     },
  //     'mouseleave': function() {
  //       console.log('マウスが離れた！')}
  //     },
  //     "li.second-category")


    // $.ajax({
    //   url: '/sell',
    //   type: 'GET',
    //   data: dataSecond,
    //   dataType: 'json',
    // })

    //   .done(function(categories){
    //     $(thirdCategory).remove();
    //     $(".third-category__wrapper").show();
    //     categories.forEach(function(dataSecond){
    //     sshowSubSubCategory(dataSecond)
    //     })
    //   })
    //   .fail(function(){
    //     alert('カテゴリーがありません');
    //   });




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
