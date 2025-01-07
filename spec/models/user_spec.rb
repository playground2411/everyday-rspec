require 'rails_helper'

RSpec.describe User, type: :model do
  it "nameがあれば有効な状態である" do
    # rails generate migration AddNameToModels name:string
    user = User.new(name: "Alice")
    expect(user).to be_valid
  end
end
