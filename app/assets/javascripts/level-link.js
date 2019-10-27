$(document).on("turbolinks:load", function() {
// ヘッダー「カテゴリーから探す」プルダウン 第一階層
  $(".toppage-header-top__footer-search-wrapper").hover(function () {
    $(".first-category__wrapper").show()
    }, function () {
    $(".first-category__wrapper").hide()
  });

  // プルダウン 第二階層
  $(".first-category__wrapper").hover(function () {
    $(".first-category__wrapper").show()
    $(".second-category__wrapper").show()
    }, function () {
    $(".first-category__wrapper").hide()
    $(".second-category__wrapper").hide()
  });

  // プルダウン 第三階層
  $(".second-category__wrapper").hover(function () {
    $(".first-category__wrapper").show()
    $(".second-category__wrapper").show()
    $(".third-category__wrapper").show()
    }, function () {
    $(".first-category__wrapper").hide()
    $(".second-category__wrapper").hide()
    $(".third-category__wrapper").hide()
  });

  // プルダウン 第三階層
  $(".third-category__wrapper").hover(function () {
    $(".first-category__wrapper").show()
    $(".second-category__wrapper").show()
    $(".third-category__wrapper").show()
    }, function () {
    $(".first-category__wrapper").hide()
    $(".second-category__wrapper").hide()
    $(".third-category__wrapper").hide()
  });

    // 第二階層カテゴリー表示テンプレ
    function showSubCategory(data){
      let showSub = `<li class="second-category" data-category-id="${data.id}" data-category-sub="${data.sub}" data-category-sub_sub="${data.sub_sub}">
                    <div>
                    ${data.name}
                      </div>
                      </li>`;
                    $(".second-category__wrapper").append(showSub);
    }

    // 第三階層カテゴリー表示テンプレ
    function showSubSubCategory(subData){
      let showSubSub = `<li class="third-category" data-category-id="${subData.id}" data-category-sub="${subData.sub}"
                        data-category-sub-sub="${subData.sub_sub}">
                      <div>
                      ${subData.name}
                      </div>
                      </li>`;
                    $(".third-category__wrapper").append(showSubSub);
    }
      

  // 第二階層プルダウン
  $("li.first-category").hover(function () {
    let mainId = $(this).attr('data-category-id');
  
      $.ajax({
      url: '/sell',
      type: 'GET',
      data: { parent: mainId },
      dataType: 'json',
    })

      .done(function(sub_categories){
        $('.second-category').remove();
        $('.third-category').remove();

        let highlight = $('li.first-category').mouseover(function(e) {
        $(this).addClass("active-list");
          })
          
        sub_categories.forEach(function(data){
        showSubCategory(data)
        })
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
      let subData = {child: subId,
                    grandChild: subSubId};

      $.ajax({
        url: '/sell',
        type: 'GET',
        data: subData,
        dataType: 'json',
      })
  
        .done(function(sub_sub_categories){
          highlight(subId);
          $("[data-category-id="3"]").addClass('active-list');
          $('.third-category').remove();
          // $('.third-category[data-category-sub-sub="0"]').remove();
          // $("ul[class='third-category'][data-category-sub-sub=0]").remove();

          sub_sub_categories.forEach(function(subData){
          showSubSubCategory(subData)
          })
        })

        .fail(function(){
          alert('カテゴリーがありません');
        })
    },
    // mouseleave: function() {
    //   let subSubId = $(this).attr('data-category-id');
    // }
  }, 'li.second-category')
  
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
