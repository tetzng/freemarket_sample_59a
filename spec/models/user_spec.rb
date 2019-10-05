require 'rails_helper'

describe User do
  describe '#create' do

# 文字が入っているかどうかのテスト

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end


    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end


    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end


    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a birth_yyyy_id" do
      user = build(:user, birth_yyyy_id: "")
      user.valid?
      expect(user.errors[:birth_yyyy_id]).to include("を入力してください")
    end

    it "is invalid without a birth_mm_id" do
      user = build(:user, birth_mm_id: "")
      user.valid?
      expect(user.errors[:birth_mm_id]).to include("を入力してください")
    end

    it "is invalid without a birth_dd_id" do
      user = build(:user, birth_dd_id: "")
      user.valid?
      expect(user.errors[:birth_dd_id]).to include("を入力してください")
    end


    it "is invalid without a phone_num" do
      user = build(:user, phone_num: "")
      user.valid?
      expect(user.errors[:phone_num]).to include("を入力してください")
    end

    it "is invalid without a authentication_num" do
      user = build(:user, authentication_num: "")
      user.valid?
      expect(user.errors[:authentication_num]).to include("を入力してください")
    end

    it "is invalid without a zip_code1" do
      user = build(:user, zip_code1: "")
      user.valid?
      expect(user.errors[:zip_code1]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      user = build(:user, prefecture_id: "")
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a city" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a address1" do
      user = build(:user, address1: "")
      user.valid?
      expect(user.errors[:address1]).to include("を入力してください")
    end

    it "is invalid without a payment_card_no" do
      user = build(:user, payment_card_no: "")
      user.valid?
      expect(user.errors[:payment_card_no]).to include("を入力してください")
    end

    it "is invalid without a paymentmonth_id" do
      user = build(:user, paymentmonth_id: "")
      user.valid?
      expect(user.errors[:paymentmonth_id]).to include("を入力してください")
    end

    it "is invalid without a paymentyear_id" do
      user = build(:user, paymentyear_id: "")
      user.valid?
      expect(user.errors[:paymentyear_id]).to include("を入力してください")
    end

    it "is invalid without a payment_card_security_code" do
      user = build(:user, payment_card_security_code: "")
      user.valid?
      expect(user.errors[:payment_card_security_code]).to include("を入力してください")
    end

# ニックネームが20文字以下なら登録できる

    it "is valid with a nickname that has less than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa") #20文字
      expect(user).to be_valid
    end

    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa") #21文字
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

# emailのフォーマットが不適切でないか

    it 'is invalid with a email wrong format' do
      user = build(:user, email: '12345678')
      user.valid?
      expect(user.errors[:email]).to include("のフォーマットが不適切です")
    end

    it 'is invalid with a email wrong format' do
      user = build(:user, email: 'a1234567')
      user.valid?
      expect(user.errors[:email]).to include("のフォーマットが不適切です")
    end


# パスワードが7〜128文字であるか


    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "a2345", password_confirmation: "a2345")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "a234567", password_confirmation: "a234567")
      user.valid?
      expect(user).to be_valid
    end

    it "is valid with a password that has more than 128 characters " do
      user = build(:user, password: "aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa123", 
      password_confirmation: "aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa123") #128
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a password that has more than 129 characters " do
      user = build(:user, password: "aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa1234", 
      password_confirmation: "aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa1234") #129
      user.valid?
      expect(user.errors[:password][0]).to include("は128文字以内で入力してください")
    end

# パスワードに英字と数字が含まれているか

    it "is valid with a password that Contains letters and numbers " do
      user = build(:user, password: "a234567", password_confirmation: "a234567")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a password except for numbers" do
      user = build(:user, password: "1111111111", password_confirmation: "1111111111")
      user.valid?
      expect(user.errors[:password][0]).to include("")
    end

    it "is invalid with a password except for alphabets" do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      user.valid?
      expect(user.errors[:password][0]).to include("")
    end

# パスワードに記号を入れても登録できる

    it "is valid with a password that Contains letters and numbers and symbol " do
      user = build(:user, password: "a123456!@#$%^&*)(=_-", password_confirmation: "a123456!@#$%^&*)(=_-")
      user.valid?
      expect(user).to be_valid
    end

# 氏名が35文字以下で入力されているか　カナ入力になっているか

    it "is valid with a last_name that has less than 35 characters " do
      user = build(:user, last_name: "12345671234567123456712345671234567") # 35
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a last_name that has more than 36 characters " do
      user = build(:user, last_name: "123456712345671234567123456712345671") # 36
      user.valid?
      expect(user.errors[:last_name]).to include("は35文字以内で入力してください")
    end

    it "is valid with a first_name that has less than 35 characters " do
      user = build(:user, first_name: "12345671234567123456712345671234567")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a first_name that has more than 36 characters " do
      user = build(:user, first_name: "123456712345671234567123456712345671")
      user.valid?
      expect(user.errors[:first_name]).to include("は35文字以内で入力してください")
    end

    it "is valid with a last_name_kana that has less than 35 characters " do
      user = build(:user, last_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア") # 35
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a last_name_kana that has more than 36 characters " do
      user = build(:user, last_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア") # 36
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は35文字以内で入力してください")
    end

    it "is valid with a first_name_kana that has less than 35 characters " do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a first_name_kana that has more than 36 characters " do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は35文字以内で入力してください")
    end

    it "is valid with a last_name_kana that katakana " do
      user = build(:user, last_name_kana: "ア")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a last_name_kana that katakana " do
      user = build(:user, last_name_kana: "あ")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("はカタカナで入力して下さい")
    end

    it "is valid with a first_name_kana that katakana " do
      user = build(:user, first_name_kana: "ア")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a first_name_kana that katakana " do
      user = build(:user, first_name_kana: "あ")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("はカタカナで入力して下さい")
    end

# 電話番号の形式が不適切でないか

    it "is valid with a phone_num that Phone number format " do
      user = build(:user, phone_num: "08012345678")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a phone_num that Phone number format " do
      user = build(:user, phone_num: "a8012345678")
      user.valid?
      expect(user.errors[:phone_num][0]).to include("の入力が正しくありません")
    end

# 認証番号に数字以外が含まれていないか

    it "is valid with a authentication_num that Contains non-numeric characters " do
      user = build(:user, authentication_num: "0")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a authentication_num that Contains non-numeric characters " do
      user = build(:user, authentication_num: "a")
      user.valid?
      expect(user.errors[:authentication_num][0]).to include("は数値で入力してください")
    end

# 郵便番号が不適切な形式になっていないか

    it "is valid with a zip_code1 that Postal code format " do
      user = build(:user, zip_code1: "000-0000")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a zip_code1 that Postal code format " do
      user = build(:user, zip_code1: "a00-0000")
      user.valid?
      expect(user.errors[:zip_code1]).to include("のフォーマットが不適切です")
    end

# 市区町村が50文字以下であるか

    it "is valid with a city that has less than 50 characters " do
      user = build(:user, city: "12345678901234567890123456789012345678901234567890") #50文字
      expect(user).to be_valid
    end

    it "is invalid with a city that has more than 51 characters" do
      user = build(:user, city: "123456789012345678901234567890123456789012345678901") #51文字
      user.valid?
      expect(user.errors[:city]).to include("は50文字以内で入力してください")
    end

# 番地が100文字以下であるか

    it "is valid with a address1 that has less than 100 characters " do
      user = build(:user, address1: "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890") #100文字
      expect(user).to be_valid
    end

    it "is invalid with a address1 that has more than 101 characters" do
      user = build(:user, address1: "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901") #101文字
      user.valid?
      expect(user.errors[:address1]).to include("は100文字以内で入力してください")
    end

# クレジットカード番号が16文字以下で数字のみであるか

    it "is valid with a payment_card_no that has less than 16 characters " do
      user = build(:user, payment_card_no: "1234567890123456") #16文字
      expect(user).to be_valid
    end

    it "is invalid with a payment_card_no that has more than 17 characters" do
      user = build(:user, payment_card_no: "12345678901234567") #17文字
      user.valid?
      expect(user.errors[:payment_card_no]).to include("は16文字以内で入力してください")
    end
    
    it "is invalid with a payment_card_no except for numbers" do
      user = build(:user, payment_card_no: "a234567890123456")
      user.valid?
      expect(user.errors[:payment_card_no]).to include("は数値で入力してください")
    end

# クレジットカードのセキュリティコードが４文字以下で数字のみであるか

    it "is valid with a payment_card_security_code that has less than 4 characters " do
      user = build(:user, payment_card_security_code: "1234")
      expect(user).to be_valid
    end

    it "is invalid with a payment_card_security_code that has more than 5 characters" do
      user = build(:user, payment_card_security_code: "12345")
      user.valid?
      expect(user.errors[:payment_card_security_code]).to include("は4文字以内で入力してください")
    end

    it "is invalid with a payment_card_security_code except for numbers" do
      user = build(:user, payment_card_security_code: "a234")
      user.valid?
      expect(user.errors[:payment_card_security_code]).to include("は数値で入力してください")
    end
  end
end
