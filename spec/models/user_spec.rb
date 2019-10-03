require 'rails_helper'

describe User do
  describe '#create' do

# 文字が入っているかどうかのテスト

    it "is invalid without a id" do
      user = build(:user, id: "")
      user.valid?
      expect(user.errors[:id]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a encrypted_password" do
      user = build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end


    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end


    it "is invalid without a birthday_year" do
      user = build(:user, birthday_year: "")
      user.valid?
      expect(user.errors[:birthday_year]).to include("can't be blank")
    end

    it "is invalid without a birthday_month" do
      user = build(:user, birthday_month: "")
      user.valid?
      expect(user.errors[:birthday_month]).to include("can't be blank")
    end

    it "is invalid without a birthday_day" do
      user = build(:user, birthday_day: "")
      user.valid?
      expect(user.errors[:birthday_day]).to include("can't be blank")
    end

    it "is invalid without a phone_num" do
      user = build(:user, phone_num: "")
      user.valid?
      expect(user.errors[:phone_num]).to include("can't be blank")
    end

    it "is invalid without a authentication_num" do
      user = build(:user, authentication_num: "")
      user.valid?
      expect(user.errors[:authentication_num]).to include("can't be blank")
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

        # IDが20文字以下なら登録できる

    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: "aaaaaaaaaasssssssssaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "is valid with a nickname that has less than 20 characters " do
      user = build(:user, nickname: "abe")
      expect(user).to be_valid
    end

    # encrypted_passwordが７〜１２８文字であれば登録できる

    it "is invalid with a encrypted_password that has more than 128 characters " do
      user = build(:user, encrypted_password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
      aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
      aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:encrypted_password][0]).to include("is too long")
    end

    it "is valid with a encrypted_password that has less than 7 characters" do
      user = build(:user, encrypted_password: "aaaa")
      expect(user).to be_valid
    end

    it "is valid with a encrypted_password that has less than 7 characters " do
      user = build(:user, encrypted_password: "aaaaaaaaaaaaaa")
      expect(user).to be_valid
    end




    it "is invalid with a first_name that has more than 35 characters " do
      user = build(:user, first_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:first_name][0]).to include("is too long")
    end

    it "is valid with a first_name that has less than 35 characters" do
      user = build(:user, first_name: "aaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    # first_nameが３５文字以下であれば登録出来る

    it "is invalid with a last_name that has more than 35 characters " do
      user = build(:user, last_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:last_name][0]).to include("is too long")
    end

    it "is valid with a last_name that has less than 35 characters" do
      user = build(:user, last_name: "aaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    # last_nameが３５文字以下であれば登録出来る
    # first_name_kanaが３５字以下かつカタカナであるか


    it "is invalid with a first_name_kana that has more than 35 characters " do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("is too long")
    end

    it "is valid with a first_name_kana that has less than 35 characters" do
      user = build(:user, first_name_kana: "アアアアア")
      expect(user).to be_valid
    end


    it "is valid with a first_name_kana that has katakana?" do
      user = build(:user, first_name_kana: "ああ")
      expect(user).to be_valid
    end

    # SNS認証経由の(providerがある)場合、uid、tokenが登録できるか

    it "is invalid without a provider" do
      user = build(:user, provider: "facebook")
      user.valid?
      expect(user.errors[:uid][0]).to include("can't be blank")
    end

    it "is invalid without a provider" do
      user = build(:user, provider: "facebook")
      user.valid?
      expect(user.errors[:token][0]).to include("can't be blank")
    end




  end
end