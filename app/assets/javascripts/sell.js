$(function(){
  let uploadItemsFirst = '#sell-main__upload-items--first ul';
  let uploadItemsSecond = '#sell-main__upload-items--second ul';
  let uploadDropBox = '#sell-main__upload-drop-box';
  function appendItem (uploadItems) {
    $(uploadItems).append(`<li class="sell-main__upload-item">
        <figure class="sell-main__upload-figure sell-main__upload-figure--square">
        <img src='${e.target.result}' title='${file.name}'>
        </figure>
        <div class="sell-main__upload-button">
        <a class="sell-main__upload-edit" href="">編集
        </a><a href="">削除
        </a></div>
        </li>
        `);
  }
  $('#product_images').on('change', function(e){
    //ファイルオブジェクトを取得する
    var files = e.target.files;
    $.each(files, function(index, file) {
      var reader = new FileReader();
      //画像でない場合は処理終了
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      }
      //アップロードした画像を設定する
      reader.onload = (function(file){
        return function(e){
          let uploadItems = $(uploadItemsFirst).children('li').length < 5 ? uploadItemsFirst : uploadItemsSecond;
          let itemLength = $(uploadItems).children('li').length;
          if (itemLength == 5) {
            return false;
          } else {
          $(uploadItems).append(`<li class="sell-main__upload-item">
          <figure class="sell-main__upload-figure sell-main__upload-figure--square">
          <img src='${e.target.result}' title='${file.name}'>
          </figure>
          <div class="sell-main__upload-button">
          <a class="sell-main__upload-edit" href="">編集
          </a><a href="">削除
          </a></div>
          </li>
          `);
          $(uploadItems).removeClass().addClass(`sell-main__upload-items sell-main__upload-items--have-item-${itemLength + 1}`);
          if (uploadItems == uploadItemsSecond && itemLength == 4){
            $(uploadDropBox).removeClass().addClass(`sell-main__upload-drop-box sell-main__upload-drop-box--have-item-10`);
          } else {
          $(uploadDropBox).removeClass().addClass(`sell-main__upload-drop-box sell-main__upload-drop-box--have-item-${itemLength + 1}`);
          }
        }};
      })(file);
      reader.readAsDataURL(file);
    });
  });
});

// ドラッグアンドドロップの処理、書いてる途中
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
//     var imageHTML = "<li class='sell-main__upload-item'><figure class='sell-main__upload-figure sell-main__upload-figure--square'>" + image + "</figure><div class='sell-main__upload-button'><a class='sell-main__upload-edit' href=''>編集</a><a href=''>削除</a></div></li>";
//       // #output へ出力
//     var itemList = document.createElement("li");
//     itemList.setAttribute("class", "sell-main__upload-item");
//     itemList.innerHTML     = "<figure class='sell-main__upload-figure sell-main__upload-figure--square'></figure><div class='sell-main__upload-button'><a class='sell-main__upload-edit' href=''>編集</a><a href=''>削除</a></div>";
//     console.log(itemList);
//       output.appendChild(itemList);
//       var imageWrapper = output.lastChild.firstChild;
//       console.log(output.lastChild.firstChild);
//       console.log(image);
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
//   product_images.addEventListener('change', function (ev) {
//     output.textContent = '';

//     // ev.target.files に複数のファイルのリストが入っている
//     organizeFiles(ev.target.files);

//     // 値のリセット
//     fileInput.value = '';
//   });
// });

$(function(){
  function appendCategory(){
    let subHTML = `<div class="sell-main__select-wrap">
                  <i class="fas fa-chevron-down"></i>
                  <select class="sell-main__select-default" name="product[category_id]">
                    <option value="">--</option>
                  </select>
                  </div>`;
    $(categoryWrapper).append(subHTML);
  }
  function appendOption(category, appendWrap){
    let subOptionHTML =`<option value="${category.id}">${category.name}</option>`;
    $(appendWrap).children('select').append(subOptionHTML);
  }
  const categoryWrapper = '#sell-main__select-category--wrapper';
  const mainCategory = '#sell-main__select-category--main';
  const subCategory = '#sell-main__select-category--wrapper div:nth-child(2)';
  const subSubCategory = '#sell-main__select-category--wrapper div:nth-child(3)';

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
  });
  const priceInput = '#sell-main__price-input';
  const feeFeild = '#sell-main__fee';
  const profitFeild = '#sell-main__profit';
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
  });
});


let sizeHTML = `<div class="sell-main__form-group">
                  <label for="product_size">サイズ
                    <span class="sell-main__form-require">必須</span>
                  </label>
                  <div class="sell-main__select-wrap">
                    <i class="fas fa-chevron-down"></i>
                    <select class="sell-main__select-default" name="product[size_id]" id="product_size_id">
                      <option value="">--</option>
                      <option value="1">XXS以下</option>
                      <option value="2">XS(SS)</option>
                      <option value="3">S</option>
                      <option value="4">M</option>
                      <option value="5">L</option>
                      <option value="6">XL(LL)</option>
                      <option value="7">2XL(3L)</option>
                      <option value="8">3XL(4L)</option>
                      <option value="9">4XL(5L)以上</option>
                      <option value="10">FREE SIZE</option>
                    </select>
                  </div>
                  <ul class="sell-main__has-error-text"></ul>
                </div>`;

let brandHTML = `<div class="sell-main__form-group sell-main__form-suggest-container">
                  <label for="product_brand">ブランド
                    <span class="sell-main__form-arbitrary">任意</span>
                  </label>
                  <div>
                    <input class="sell-main__input-default" placeholder="例）シャネル" type="text" name="product[brand]" id="product_brand">
                  </div>
                  <div></div>
                  <ul class="sell-main__has-error-text"></ul>
                </div>`;

let deliveryWayHTML = `<div class="sell-main__form-group">
                        <label for="product_delivery_way">配送の方法
                          <span class="sell-main__form-require">必須</span>
                        </label>
                        <div class="sell-main__select-wrap">
                          <i class="fas fa-chevron-down"></i>
                          <select class="sell-main__select-default" name="product[delivery_way_id]" id="product_delivery_way_id">
                            <option value="">--</option>
                            <option value="1">未定</option>
                            <option value="2">らくらくメルカリ便</option>
                            <option value="3">ゆうメール</option>
                            <option value="4">レターパック</option>
                            <option value="5">普通郵便(定形、定形外)</option>
                            <option value="6">クロネコヤマト</option>
                            <option value="7">ゆうパック</option>
                            <option value="8">クリックポスト</option>
                            <option value="9">ゆうパケット</option></select>
                        </div>
                        <ul class="sell-main__has-error-text">
                        </ul>
                      </div>`