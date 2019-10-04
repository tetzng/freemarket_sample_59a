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

    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa") #21文字
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "is valid with a nickname that has less than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa") #20文字
      expect(user).to be_valid
    end

    #email


    # it "is invalid with a duplicate email address" do
    #   user = create(:user)
    #   another_user = build(:user, email: user.email)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("はすでに存在します")

    # encrypted_passwordが７〜１２８文字であれば登録できる

  #   it "is invalid with a encrypted_password that has more than 128 characters " do
  #     user = build(:user, encrypted_password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
  #     aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
  #     aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  #     user.valid?
  #     expect(user.errors[:encrypted_password][0]).to include("is too long")
  #   end

  #   it "is valid with a encrypted_password that has less than 7 characters" do
  #     user = build(:user, encrypted_password: "aaaa")
  #     expect(user).to be_valid
  #   end

  #   it "is valid with a encrypted_password that has less than 7 characters " do
  #     user = build(:user, encrypted_password: "aaaaaaaaaaaaaa")
  #     expect(user).to be_valid
  #   end




  #   it "is invalid with a first_name that has more than 35 characters " do
  #     user = build(:user, first_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  #     user.valid?
  #     expect(user.errors[:first_name][0]).to include("is too long")
  #   end

  #   it "is valid with a first_name that has less than 35 characters" do
  #     user = build(:user, first_name: "aaaaaaaaaaaaaaaa")
  #     expect(user).to be_valid
  #   end

  #   # first_nameが３５文字以下であれば登録出来る

  #   it "is invalid with a last_name that has more than 35 characters " do
  #     user = build(:user, last_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  #     user.valid?
  #     expect(user.errors[:last_name][0]).to include("is too long")
  #   end

  #   it "is valid with a last_name that has less than 35 characters" do
  #     user = build(:user, last_name: "aaaaaaaaaaaaaaaa")
  #     expect(user).to be_valid
  #   end

  #   # last_nameが３５文字以下であれば登録出来る

  #   it "is invalid with a first_name_kana that has more than 35 characters " do
  #     user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
  #     user.valid?
  #     expect(user.errors[:first_name_kana][0]).to include("is too long")
  #   end

  #   it "is valid with a first_name_kana that has less than 35 characters" do
  #     user = build(:user, first_name_kana: "アアアアア")
  #     expect(user).to be_valid
  #   end


  #   it "is valid with a first_name_kana that has katakana?" do
  #     user = build(:user, first_name_kana: "ああ")
  #     expect(user).to be_valid
  #   end

  #   # first_name_kanaが３５字以下かつカタカナであるか


  # end
end
