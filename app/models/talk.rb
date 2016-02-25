class Talk < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: {maximum: 50}
  validates :detail, presence: true

end
