require 'rails_helper'

RSpec.describe ProductController, type: :controller do

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to root_path
        else
            render '/sell/new'
        end
    end

end