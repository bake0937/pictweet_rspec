require 'rails_helper'
describe User do
  describe '#ユーザー登録' do

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空では登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailが空では登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordが空では登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationが空では登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "nicknameが7文字以上であれば登録できない" do
      user = build(:user, nickname: "aaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "nicknameが6文字以下では登録できる" do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end

    it "重複したemailが存在する場合登録できない" do
      user = create(:user, email: "suzuki@sample.com")
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email][0]).to include("has already been taken")
    end

    it "passwordが8文字以上であれば登録できる" do
      user = build(:user, password: "aaaaaaaa", password_confirmation: "aaaaaaaa")
      expect(user).to be_valid
    end

    it "passwordが7文字以下であれば登録できない" do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end
