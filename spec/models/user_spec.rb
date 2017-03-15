require 'rails_helper'
describe User do
  describe '#ユーザー作成' do
    it "is invalid without a nickname" do
      user = User.new(
        nickname: "",
        email: "aaaa@sample.com",
        password: "12345678",
        password_confirmation: "12345678"
      )
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = User.new(
        nickname: "Michael",
        email: "",
        password: "12345678",
        password_confirmation: "12345678"
      )
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

  end
end
