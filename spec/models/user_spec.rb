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
end
