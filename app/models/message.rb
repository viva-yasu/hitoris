class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :talk
  validates :message, presence: true, length: { maximum: 140 }
end
