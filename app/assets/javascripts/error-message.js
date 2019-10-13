$(document).on('turbolinks:load',function(){
    
    // 商品出品エラーメッセージ表示
    $(".sell-main__form").validate({
        rules: {
            "product[images][]": { required: true },
            "product[name]": { required: true, max: true },
            "product[description]": { required: true, text_max: true },
            "product[category_id]": { required: true, category: true },
            "product[condition_id]": { required: true },
            "product[delivery_charge_id]": { required: true },
            "product[prefecture_id]": { required: true },
            "product[delivery_days_id]": { required: true },
            "product[price]": { price: true, required: true }
        }
    });
});