require 'rails_helper'

RSpec.describe User, type: :model do
  it "nameがあれば有効な状態である" do
    # rails generate migration AddNameToUsers name:string
    user = User.new(name: "Alice", mail: "hello@gmail.com")
    expect(user).to be_valid
  end
  it "nameがなければ無効" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  it "mailがなければ無効" do
    user = User.new(name: "alice", mail: nil)
    user.valid?
    expect(user.errors[:mail]).to include("can't be blank")
  end
  it "mailが重複していれば無効" do
    user_01 = User.create(name: "alice", mail: "test@gmail.com")
    user = User.new(name: "alice", mail: "test@gmail.com")
    user.valid?
    expect(user.errors[:mail]).to include("has already been taken")
  end
  it "mailが3文字以下であれば無効" do
    user = User.new(name: "alice", mail: "12")
    user.valid?
    expect(user.errors[:mail]).to include("is too short (minimum is 3 characters)")
  end

  describe "#user_info_in_oneline" do
    it "メールアドレスと名前を連結させてくれる" do
      user = User.new(name: "Alice", mail: "hello@gmail.com")
      expect(user.user_info_in_oneline).to eq("Alice - hello@gmail.com")
    end
    context "nameがnilの場合" do
      it "mailだけ返してくれる" do
        user = User.new(name: nil, mail: "hello@gmail.com")
        expect(user.user_info_in_oneline).to eq("hello@gmail.com")
      end
    end
    context "mailがnilの場合" do
      it "nameだけ返してくれる" do
        user = User.new(name: "alice", mail: nil)
        expect(user.user_info_in_oneline).to eq("alice")
      end
    end
    context "name,mailがnilの場合" do
      it "falseを返却" do
        user = User.new(name: nil, mail: nil)
        expect(user.user_info_in_oneline).to eq(false)
      end
    end
  end
end
