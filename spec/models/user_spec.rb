require 'rails_helper'

RSpec.describe User, type: :model do
  it "nameがあれば有効な状態である" do
    # rails generate migration AddNameToModels name:string
    user = User.new(name: "Alice")
    expect(user).to be_valid
  end
  it "nameがなければ無効" do
    user = User.new(name: nil)
    user.valid?
    expect(user).to be_invalid
    expect(user.errors[:name]).to include("can't be blank")
  end
end
