$(document).on("turbolinks:load", function() {
// ヘッダー「カテゴリーから探す」プルダウン 第一階層
  // $(".toppage-header-top__footer-search-wrapper").hover(function () {
  //   $(".first-category__wrapper").show()
  //   }, function () {
  //   $(".first-category__wrapper").hide()
  // });


    // 第二階層カテゴリー表示テンプレ
    function showSubCategory(data){
      let showSub = `<li class="second-category" data-category-id="${data.id}" data-category-sub="${data.sub}" data-category-sub-sub="${data.sub_sub}">
                    <div>
                    ${data.name}
                      </div>
                      </li>`;
                    $(".second-category__wrapper").append(showSub);
    }

    // 第三階層カテゴリー表示テンプレ
    function showSubSubCategory(subData){      
      let showSubSub = `<li class="third-category" data-category-id="${subData.id}" data-category-sub="${subData.sub}" data-category-sub-sub="${subData.sub_sub}">
                    <div>
                    ${subData.name}
                      </div>
                      </li>`;
                    $(".third-category__wrapper").append(showSubSub);
                    $(".third-category__wrapper[data-category-sub-sub="0"]).remove()
    }
      

  // 第二階層プルダウン
  $("li.first-category").hover(function () {
    let mainId = $(this).attr('data-category-id');
    console.log(mainId)
    // $(this).addClass('active-list', function(){
    // }, function () {
    // $(this).removeClass('active-list');
    // });

      $.ajax({
      url: '/sell',
      type: 'GET',
      data: { sub: mainId },
      dataType: 'json',
    })

      .done(function(sub_categories){
        $('.second-category').remove();
        $('.third-category').remove();
        sub_categories.forEach(function(data){
        showSubCategory(data)
        })
        $(".second-category__wrapper").show();
      })

      .fail(function(){
        alert('カテゴリーがありません');
      });
    });



  // 第三階層プルダウン
  $(document).on({
    mouseenter: function() {
      let subId = $(this).attr('data-category-sub');
      let subSubId = $(this).attr('data-category-id');
      let subData = {sub: subId,
                    sub_sub: subSubId};
      console.log(this);
      console.log(subSubId);

      $.ajax({
        url: '/sell',
        type: 'GET',
        data: subData,
        dataType: 'json',
      })
  
        .done(function(sub_sub_categories){
          $('.third-category').remove();
          $('.third-category__wrapper').show()
          , function () {
          $('.third-category__wrapper').hide()
          };
          sub_sub_categories.forEach(function(subData){
          showSubSubCategory(subData)
          })
        })

        .fail(function(){
          alert('カテゴリーがありません');
        })

    },
    mouseleave: function() {
      let subSubId = $(this).attr('data-category-id');
      console.log(subSubId);
    }

    }, 'li.second-category')
  
  // 各カテゴリーとクラスの紐付け
  // const firstCategory = 'li.first-category';
  // const secondCategory = 'li.second-category';
  // const thirdCategory = 'li.third-category';



  // 第二階層マウスオーバー表示
  // $("li.first-category").hover(function () {

  // $(".first-category").hover(function () {
  //   $(this).children("li").show();
  //   let category = $(this).children("li")
  //   console.log(category)
  //   }, function () {
  //   $(".second-category").hide()
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
