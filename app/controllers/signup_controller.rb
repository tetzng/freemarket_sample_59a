class SignupController < ApplicationController
  require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

  def index
  end

  def registration
    @user = User.new
  end

  def sms_confirmation
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_yyyy_id] = user_params[:birth_yyyy_id]
    session[:birth_mm_id] = user_params[:birth_mm_id]
    session[:birth_dd_id] = user_params[:birth_dd_id]
    @user = User.new( # 新規インスタンス作成
    # sessionに保存された値をインスタンスに渡す
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_yyyy_id: session[:birth_yyyy_id],
      birth_mm_id: session[:birth_mm_id],
      birth_dd_id: session[:birth_dd_id],
      # 入力前の情報は、バリデーションに通る値を仮で入れる
      phone_num: "08000000000",
      authentication_num: "1234",
      zip_code1: "000-0000",
      # { id: 1, name: '北海道' } で北海道を呼び出している
      prefecture_id: "1",
      city: "福岡市",
      address1: "南区",
      address2: "",
      telephone: "",
    )
    render '/signup/registration' unless @user.valid?
  end

  def sms_confirmation_sms
    session[:phone_num] = user_params[:phone_num]
    @user = User.new( # 新規インスタンス作成
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_yyyy_id: session[:birth_yyyy_id],
      birth_mm_id: session[:birth_mm_id],
      birth_dd_id: session[:birth_dd_id],
      phone_num: session[:phone_num],
      authentication_num: "1234",
      zip_code1: "000-0000",
      prefecture_id: "1",
      city: "福岡市",
      address1: "南区",
      address2: "",
      telephone: "",
    )
    render '/signup/sms_confirmation' unless @user.valid?
  end

  def address
    session[:authentication_num] = user_params[:authentication_num]
    @user = User.new( # 新規インスタンス作成
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    last_name: session[:last_name],
    first_name: session[:first_name],
    last_name_kana: session[:last_name_kana],
    first_name_kana: session[:first_name_kana],
    birth_yyyy_id: session[:birth_yyyy_id],
    birth_mm_id: session[:birth_mm_id],
    birth_dd_id: session[:birth_dd_id],
    phone_num: session[:phone_num],
    authentication_num: session[:authentication_num],
    zip_code1: "000-0000",
    prefecture_id: "1",
    city: "福岡市",
    address1: "南区",
    address2: "",
    telephone: "",
    )
    render '/signup/address' unless @user.valid?
  end

  def create
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:zip_code1] = user_params[:zip_code1]
    session[:prefecture_id] = user_params[:prefecture_id]
    session[:city] = user_params[:city]
    session[:address1] = user_params[:address1]
    session[:address2] = user_params[:address2]
    session[:telephone] = user_params[:telephone]
    @user = User.new( # 新規インスタンス作成

    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    last_name: session[:last_name],
    first_name: session[:first_name],
    last_name_kana: session[:last_name_kana],
    first_name_kana: session[:first_name_kana],
    birth_yyyy_id: session[:birth_yyyy_id],
    birth_mm_id: session[:birth_mm_id],
    birth_dd_id: session[:birth_dd_id],
    phone_num: session[:phone_num],
    authentication_num: session[:authentication_num],
    zip_code1: user_params[:zip_code1],
    prefecture_id: user_params[:prefecture_id],
    city: user_params[:city],
    address1: user_params[:address1],
    address2: user_params[:address2],
    telephone: user_params[:telephone],
    )
    render '/signup/prefecture' unless @user.valid?
    if @user.save
      session[:id] = @user.id
      redirect_to signup_credit_card_path
    else
      render '/signup/prefecture'
    end
  end

  def credit_card
  end
  
  def pay #payjpとCardのデータベース作成を実施します。
    if params['payjp-token'].blank?
      redirect_to action: 'new'
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      )
      @card = Card.new(user_id: session[:id], customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: 'done'
      else
        redirect_to action: 'pay'
      end
    end
  end

  

  def done
    # render '/signup/credit_card' unless @user.valid?
    sign_in User.find(session[:id]) unless user_signed_in?
  end

private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birth_yyyy_id,
      :birth_mm_id,
      :birth_dd_id,
      :phone_num,
      :authentication_num,
      :zip_code1,
      :prefecture_id,
      :city,
      :address1,
      :address2,#任意
      :telephone,#任意
    )
  end
end
