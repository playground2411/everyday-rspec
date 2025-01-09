class User < ApplicationRecord
  validates :name, presence: true
  validates :mail, presence: true, uniqueness: true
end
