$(function(){
  let uploadItemsFirst = '#sell-main__upload-items--first ul';
  let uploadItemsSecond = '#sell-main__upload-items--second ul';
  let uploadDropBox = '#sell-main__upload-drop-box';
  function appendItem (uploadItems) {
    console.log('アペンド');
    console.log(uploadItems);
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

  $('#product_images').change(function(e){
    //ファイルオブジェクトを取得する
    var files = e.target.files;
    console.log(files);
    $.each(files, function(index, file) {
      console.log(index, file);
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