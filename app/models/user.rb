class User < ApplicationRecord
  validates :name, presence: true
  validates :mail, presence: true, uniqueness: true, length: { minimum: 3 }

  def user_info_in_oneline
    if self.name
      if self.mail
        "#{self.name} - #{self.mail}"
      else
        "#{self.name}"
      end
    else
      if self.mail
        "#{self.mail}"
      else
        false
      end
    end
  end
end
