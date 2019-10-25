$(document).on("turbolinks:load", function() {
// ヘッダー「カテゴリーから探す」プルダウン 第一階層
  // $(".toppage-header-top__footer-search-wrapper").hover(function () {
  //   $(".first-category__wrapper").show()
  //   }, function () {
  //   $(".first-category__wrapper").hide()
  // });

  // 第二階層プルダウン
  // $(".first-category__wrapper").hover(function () {
  //   $(".second-category__wrapper").show()
  //   }, function () {
  //   $(".second-category__wrapper").hide()
  // });
  $("li.first-category").hover(function () {
    $(this).addClass('active-list')
    }, function () {
    $(this).removeClass('active-list')
    let firstId = $(this).attr('data-category-id')

 
      $.ajax({
      url: '/sell',
      type: 'GET',
      data: { sub: firstId },
      dataType: 'json',
    })

      .done(function(){
      $(this).addClass('active-list')
      //   console.log(this)
      // }, function () {
      // $(this).removeClass('active-list')
      // }, function () {
      // $(".second-category__wrapper").show()
      // }, function () {
      // $(".second-category__wrapper").hide()
      })

      .fail(function(){
        alert('カテゴリーがありません');
      });
    });



  //   $(this).children("li").show();
  //   let category = $(this).children("li")
  //   }, function () {
  //   $(".second-category").hide()
  // });



  // 第三階層プルダウン
  // $(".second-category__wrapper").hover(function () {

  //   $(".third-category").show()
  //   }, function () {
  //   $(".third-category").hide()
  // });
  
  // 各カテゴリーとクラスの紐付け
  // const firstCategory = 'li.first-category';
  // const secondCategory = 'li.second-category';
  // const thirdCategory = 'li.third-category';

  // 第二階層カテゴリー表示テンプレ
  // function showSubCategory(data){
  //   let showSub = `<li class="second-category" data-category-id="" data-category-sub="${data.id}" data-category-sub-sub="${data.sub_sub}">
  //                 <div>
  //                 ${data.name}
  //                  </div>
  //                  <ul class="third-category__wrapper">
  //                  <li class="third-category" data-category-id="" data-category-sub="" data-category-sub_sub="">
  //                  ${data.name}
  //                  </li>`;
  //                 $(".second-category__wrapper").append(showSub);
  // }

  // 第二階層マウスオーバー表示
  // $("li.first-category").hover(function () {

  // $(".first-category").hover(function () {
  //   $(this).children("li").show();
  //   let category = $(this).children("li")
  //   console.log(category)
  //   }, function () {
  //   $(".second-category").hide()
  // });


  
    // let firstId = $(this).attr('data-category-id');
    // console.log(this);
    // $(this).addClass('active-list')
    // , function () {
    // $(this).removeClass('active-list')
    // }

  // $("ul.first-category__wrapper").hover(function () {

    // let firstId = $(this).attr('data-category-id');
    // let secondId = $(this).attr('data-category-sub');
    // let thirdId = $(this).attr('data-category-sub-sub');
    // let data = {id: firstId,
    //             sub: secondId,
    //             sub_sub: thirdId };

    // $.ajax({
    //   url: '/sell',
    //   type: 'GET',
    //   data: { sub: firstId },
    //   dataType: 'json',
    // })

    //   .done(function(categories){
    //     // $('.li.first-category').removeClass('active-list');
    //     $(".second-category__wrapper").show()
    //     , function () {
    //     $(".second-category__wrapper").hide()
    //     };
    //     categories.forEach(function(data){
    //     showSubCategory(data)
    //     })
    //   })

    //   .fail(function(){
    //     alert('カテゴリーがありません');
    //   });
    // });

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
