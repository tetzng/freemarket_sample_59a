$(document).on('turbolinks:load',function(){

    $('input:submit[id="btn_submit"]').click(function(){
        if(!input_check()){
            return false;
        }
    });
});

function input_check(){

    var result = true;

    //エラー文をリセット
    $('#')

}