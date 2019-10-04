$(document).on('turbolinks:load', function(){
  $('#seqcode-tips-toggle').on('click',function(e){
    e.preventDefault();
    if($('#seqcode-tips-content').hasClass('is-show')){
      $('#seqcode-tips-content').removeClass('is-show');
    }else{
      $('#seqcode-tips-content').addClass('is-show');
    }
  });
});