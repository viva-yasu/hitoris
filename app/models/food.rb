class Food < ActiveRecord::Base
  belongs_to :user

  validates :message, presence: true, length: { maximum: 140 }
end
