$(function(){
  // クレカ裏面、関係ないところクリックでも消えるようにしたいけど保留
  // $(document).on('click',function(e){
  //   e.preventDefault();
  //   if($('#seqcode-tips-content').hasClass('is-show')){
  //     $('#seqcode-tips-content').removeClass('is-show');
  //     console.log('削除！');
  //   }else{
  //     console.log('何もおこらない');
  //   }
  // });
  $('#seqcode-tips-toggle').on('click',function(e){
    e.preventDefault();
    if($('#seqcode-tips-content').hasClass('is-show')){
      $('#seqcode-tips-content').removeClass('is-show');
      console.log('削除！');
    }else{
      $('#seqcode-tips-content').addClass('is-show');
      console.log('追加！');
    }
  });
});