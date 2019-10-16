$(document).on('turbolinks:load', function(){
  const uploadItems = '#sell-main__upload-items ul';
  const uploadDropBox = '#sell-main__upload-drop-box';

  // 画像アップロード時プレビュー表示
  $('#product_images').on('change', function(e){
    //ファイルオブジェクトを取得する
    let files = e.target.files;
    $.each(files, function(index, file) {
      let reader = new FileReader();
      //画像でない場合は処理終了
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      }
      //アップロードした画像を設定する
      reader.onload = (function(file){
        return function(e){
          let itemLength = $(uploadItems).children('li').length;
          if (itemLength == 10) {
            return false;
          } else {
          $(uploadItems).children('label').before(`<li class="sell-main__upload-item">
                                  <figure class="sell-main__upload-figure sell-main__upload-figure--square">
                                    <img src='${e.target.result}' title='${file.name}'>
                                  </figure>
                                  <div class="sell-main__upload-button">
                                    <a class="sell-main__upload-edit" href="">編集
                                    </a><a class="sell-main__delete-image">削除
                                    </a>
                                  </div>
                                </li>`);
          $(uploadItems).removeClass().addClass(`sell-main__upload-items sell-main__upload-items--have-item-${itemLength % 5 + 1}`);
          if (itemLength == 9){
            $(uploadDropBox).removeClass().addClass(`sell-main__upload-drop-box sell-main__upload-drop-box--have-item-10`);
          } else{
          $(uploadDropBox).removeClass().addClass(`sell-main__upload-drop-box sell-main__upload-drop-box--have-item-${(itemLength + 1) % 5}`);
          }
        }};
      })(file);
      reader.readAsDataURL(file);
    });
  });

  $(document).on('click', '.sell-main__delete-image', function(){
    $(this).parents('.sell-main__upload-item').remove();
    let uploadItemLength = $(uploadItems).children('li').length;
    $(uploadItems).removeClass().addClass(`sell-main__upload-items sell-main__upload-items--have-item-${uploadItemLength % 5}`);
    $(uploadDropBox).removeClass().addClass(`sell-main__upload-drop-box sell-main__upload-drop-box--have-item-${uploadItemLength % 5}`);
  });

  // カテゴリーの選択欄追加
  function appendCategory(){
    let subHTML = `<div class="sell-main__select-wrap">
                  <i class="fas fa-chevron-down"></i>
                  <select class="sell-main__select-default" name="product[category_id]">
                    <option value="">--</option>
                  </select>
                  </div>`;
    $(categoryWrapper).append(subHTML);
  }

  // カテゴリーの選択内容追加
  function appendOption(category, appendWrap){
    let subOptionHTML =`<option value="${category.id}", data-size-id="${category.size}", data-brand-id="${category.brand}">${category.name}</option>`;
    $(appendWrap).children('select').append(subOptionHTML);
  }
  function attrCustomData(category, appendWrap, index){
    $(appendWrap).children('select').children(`option:nth-child(${index + 2})`).attr({
      'data-size-id': category.size,
      'data-brand-id': category.brand,
    });
  }

  const categoryWrapper = '#sell-main__select-category--wrapper';
  const mainCategory = '#sell-main__select-category--main';
  const subCategory = '#sell-main__select-category--wrapper div:nth-child(2)';
  const subSubCategory = '#sell-main__select-category--wrapper div:nth-child(3)';
  const sizeWrap = '#sell-main__form-group--size';
  const brandWrap = '#sell-main__form-group--brand';

  // メインカテゴリー選択時、サブカテゴリー追加
  $(mainCategory).on('change', function(){
    let sub = $(this).val();
    let sub_sub = "0";

    $.ajax({
      type: "GET",
      url: '/sell/new',
      data: { sub: sub, sub_sub: sub_sub },
      dataType: 'json'
    })

    .done(function(categories){
      $(subSubCategory).remove();
      $(subCategory).remove();
      $(sizeWrap).remove();
      appendSizeNull();
      $(brandWrap).remove();
      if(sub != ''){
        appendCategory();
        categories.forEach(function(category){
          appendOption(category, subCategory);
        });
      }
    })
    .fail(function(){
      alert('カテゴリー検索に失敗しました');
    });
  });

  // サブカテゴリー選択時、サブサブカテゴリー追加
  $(document).on('change', subCategory, function(){
    let sub = $(mainCategory).val();
    let sub_sub = $(this).children('select').val();
    $.ajax({
      type: "GET",
      url: '/sell/new',
      data: { sub: sub, sub_sub: sub_sub },
      dataType: 'json'
    })

    .done(function(categories){
      $(subSubCategory).remove();
      $(sizeWrap).remove();
      appendSizeNull();
      $(brandWrap).remove();
      if(sub_sub != '' && categories[0]){
        appendCategory();
        categories.forEach(function(category){
          appendOption(category, subSubCategory);
        });
      }
    })
    .fail(function(){
      alert('カテゴリー検索に失敗しました');
    });
  })

  // 編集時、カテゴリー追加
  if(document.URL.match(/sell/) && document.URL.match(/edit/)) {
    $(document).ready(function(){
      let sub = $(mainCategory).val();
      let sub_sub = $(subCategory).children('select').val();

      $.ajax({
        type: "GET",
        url: '/sell/new',
        data: { sub: sub, sub_sub: sub_sub },
        dataType: 'json'
      })

      .done(function(categories){
        if(sub != ''){
          categories.forEach(function(category, index){
            attrCustomData(category, subSubCategory, index);
          });
        }
      })
      .fail(function(){
        alert('カテゴリー編集に失敗しました');
      });
    });
  }


  const priceInput = '#sell-main__price-input';
  const feeFeild = '#sell-main__fee';
  const profitFeild = '#sell-main__profit';

  // 価格入力時に手数料、利益計算
  $(priceInput).on('keyup', function(){
    let input = $(this).val();
    if (input >= 300 && input <= 9999999){
      let fee = Math.floor(input * 0.1);
      let profit = "¥" + (input - fee).toLocaleString();
      $(feeFeild).html("¥" + fee.toLocaleString());
      $(profitFeild).html(profit);
    } else {
      let fee = '-';
      let profit = '-';
      $(feeFeild).html(fee);
      $(profitFeild).html(profit);
    }
  });

   // 編集時の手数料、利益計算
   $(priceInput).ready(function(){
    let input = $(priceInput).val();
    if (input >= 300 && input <= 9999999){
      let fee = Math.floor(input * 0.1);
      let profit = "¥" + (input - fee).toLocaleString();
      $(feeFeild).html("¥" + fee.toLocaleString());
      $(profitFeild).html(profit);
    } else {
      let fee = '-';
      let profit = '-';
      $(feeFeild).html(fee);
      $(profitFeild).html(profit);
    }
  });

  // サイズ選択欄追加
  function appendSize(){
    const sizeHTML = `<div class="sell-main__form-group" id="sell-main__form-group--size">
                      <label for="product_size">サイズ
                        <span class="sell-main__form-require">必須</span>
                      </label>
                      <div class="sell-main__select-wrap">
                        <i class="fas fa-chevron-down"></i>
                        <select class="sell-main__select-default" name="product[size_id]" id="product_size_id">
                          <option value="">--</option>
                        </select>
                      </div>
                      <ul class="sell-main__has-error-text"></ul>
                    </div>`;
    $(categoryWrapper).parent().after(sizeHTML);
  }

  // サイズは必須項目のため、選択欄がないとき用に空のvalueを追加
  function appendSizeNull(){
    const sizeNullHTML = `<div id="sell-main__form-group--size">
                            <input type="hidden" name="product[size_id]" value="99"></input>
                          </div>`;
    $(categoryWrapper).parent().after(sizeNullHTML);
  }

  // サイズ選択内容追加
  function appendSizeOption(size, appendWrap){
    let sizeOptionHTML =`<option value="${size.id}">${size.value}</option>`;
    $(appendWrap).find('select').append(sizeOptionHTML);
  }
  const formBoxDetail = '#sell-main__form-box--detail';

  // ブランド入力欄追加
  function appendBrand(){
    const brandHTML = `<div class="sell-main__form-group sell-main__form-suggest-container" id="sell-main__form-group--brand">
                      <label for="product_brand">ブランド
                        <span class="sell-main__form-arbitrary">任意</span>
                      </label>
                      <div>
                        <input class="sell-main__input-default" placeholder="例）シャネル" type="text" name="product[brand]" id="product_brand">
                      </div>
                      <div></div>
                      <ul class="sell-main__has-error-text"></ul>
                    </div>`;
    $(formBoxDetail).children('div:last-child').before(brandHTML);
  }

  // 任意のカテゴリー選択でサイズとブランドの追加
  $(document).on('change', subSubCategory, function(){
    let selectedCategory = $(this).children('select');
    let selectedValue = selectedCategory.val();
    let selectedOption = selectedCategory.children(`[value="${selectedValue}"]`);
    let sizeId = selectedOption.data('size-id');
    let brandId = selectedOption.data('brand-id');

    $.ajax({
      type: "GET",
      url: '/api/sell/new',
      data: { group: sizeId },
      dataType: 'json'
    })

    .done(function(sizes){
      $(sizeWrap).remove();
      if(sizeId != '' && sizes[0]){
        appendSize();
        sizes.forEach(function(size){
          appendSizeOption(size, sizeWrap);
        });
      } else {
        appendSizeNull();
      }
    })
    .fail(function(){
      alert('カテゴリー検索に失敗しました');
    });

    $(brandWrap).remove();
    if (brandId == '1'){
      appendBrand();
    }
  });

  const deliveryChargeWrap = '#sell-main__form-group--delivery-charge';
  const deliveryCharge = '#product_delivery_charge_id';
  const deliveryWayWrap = '#sell-main__form-group--delivery-way';

  // 配送方法選択欄の追加
  function appendDeliveryWay(){
    const deliveryWayHTML = `<div class="sell-main__form-group" id="sell-main__form-group--delivery-way">
                              <label for="product_delivery_way">配送の方法
                                <span class="sell-main__form-require">必須</span>
                              </label>
                              <div class="sell-main__select-wrap">
                                <i class="fas fa-chevron-down"></i>
                                <select class="sell-main__select-default" name="product[delivery_way_id]" id="product_delivery_way_id">
                                  <option value="">--</option>
                              </div>
                              <ul class="sell-main__has-error-text">
                              </ul>
                            </div>`;
    $(deliveryChargeWrap).after(deliveryWayHTML);
  }

  // 配送方法選択内容の追加
  function appendDeliveryWayOption(deliveryWay, appendWrap){
    let deliveryWayOptionHTML =`<option value="${deliveryWay.id}">${deliveryWay.value}</option>`;
    $(appendWrap).find('select').append(deliveryWayOptionHTML);
  }

  // 配送料選択時、配送方法表示
  $(document).on('change', deliveryCharge, function(){
    let deliveryChargeId = $(this).val();

    $.ajax({
      type: "GET",
      url: '/api/sell/new_delivery',
      data: { charge: deliveryChargeId },
      dataType: 'json'
    })

    .done(function(deliveryWays){
      $(deliveryWayWrap).remove();
      if(deliveryChargeId != '' && deliveryWays[0]){
        appendDeliveryWay();
        deliveryWays.forEach(function(deliveryWay){
          appendDeliveryWayOption(deliveryWay, deliveryWayWrap);
        });
      }
    })
    .fail(function(){
      alert('カテゴリー検索に失敗しました');
    });
  });
});


// // ドラッグアンドドロップの処理、書いてる途中
// document.addEventListener('DOMContentLoaded', function () {
//   var
//     dropArea = document.getElementById('dropArea'),
//     output = document.getElementById('output'),

//     // 画像の最大ファイルサイズ（20MB）
//     maxSize = 20 * 1024 * 1024;

//   // ドロップされたファイルの整理
//   function organizeFiles(files) {
//     var
//       length = files.length,
//       i = 0, file;

//     for (; i < length; i++) {
//       // file には Fileオブジェクト というローカルのファイル情報を含むオブジェクトが入る
//       file = files[i];

//       // 画像以外は無視
//       if (!file || file.type.indexOf('image/') < 0) {
//         continue;
//       }

//       // 指定したサイズを超える画像は無視
//       if (file.size > maxSize) {
//         continue;
//       }

//       // 画像出力処理へ進む
//       outputImage(file);
//     }
//   }

//   // 画像の出力
//   function outputImage(blob) {
//     var
//       // 画像要素の生成
//       image = new Image(),

//       // File/BlobオブジェクトにアクセスできるURLを生成
//       blobURL = URL.createObjectURL(blob);

//     // src にURLを入れる
//     image.src = blobURL;

//     // 画像読み込み完了後
//     image.addEventListener('load', function () {
//       // File/BlobオブジェクトにアクセスできるURLを開放
//       URL.revokeObjectURL(blobURL);
//       var imageHTML = `<li class='sell-main__upload-item'><figure class='sell-main__upload-figure sell-main__upload-figure--square'></figure><div class='sell-main__upload-button'><a class='sell-main__upload-edit' href=''>編集</a><a class='sell-main__delete-image'>削除</a></div></li>`;
//       console.log(typeof imageHTML);
//       console.log(typeof image);
//       // #output へ出力
//       // var itemList = document.createElement("li");
//       // itemList.setAttribute("class", "sell-main__upload-item");
//       // itemList.innerHTML = "<figure class='sell-main__upload-figure sell-main__upload-figure--square'></figure><div class='sell-main__upload-button'><a class='sell-main__upload-edit' href=''>編集</a><a class='sell-main__delete-image'>削除</a></div>";
//       // itemList.innerHTML = imageHTML
//       output.appendChild(imageHTML);
//       var imageWrapper = output.lastChild.firstChild;
//       imageWrapper.appendChild(image);
//     });
//   }

//   // ドラッグ中の要素がドロップ要素に重なった時
//   dropArea.addEventListener('dragover', function (ev) {
//     ev.preventDefault();

//     // ファイルのコピーを渡すようにする
//     ev.dataTransfer.dropEffect = 'copy';

//     dropArea.classList.add('dragover');
//   });

//   // ドラッグ中の要素がドロップ要素から外れた時
//   dropArea.addEventListener('dragleave', function () {
//     dropArea.classList.remove('dragover');
//   });

//   // ドロップ要素にドロップされた時
//   dropArea.addEventListener('drop', function (ev) {
//     ev.preventDefault();

//     dropArea.classList.remove('dragover');
//     output.textContent = '';
//     // ev.dataTransfer.files に複数のファイルのリストが入っている
//     organizeFiles(ev.dataTransfer.files);
//   });

//   // // #dropArea がクリックされた時
//   // dropArea.addEventListener('click', function () {
//   //   fileInput.click();
//   // });

//   // ファイル参照で画像を追加した場合
//   // product_images.addEventListener('change', function (ev) {
//   //   output.textContent = '';

//   //   // ev.target.files に複数のファイルのリストが入っている
//   //   organizeFiles(ev.target.files);

//   //   // 値のリセット
//   //   fileInput.value = '';
//   // });
// });
