class Talk < ActiveRecord::Base
  belongs_to :user
  has_many :foods
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: {maximum: 50}
  validates :detail, presence: true
  validates :image, presence: true

end
