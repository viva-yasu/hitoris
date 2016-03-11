class Talk < ActiveRecord::Base
  extend Enumerize
  enumerize :tag, :in => ['分ける', '集まる', '知る']

  belongs_to :user
  has_many :messages

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: {maximum: 50}
  validates :detail, presence: true
  validates :image, presence: true

end
