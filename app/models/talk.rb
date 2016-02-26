class Talk < ActiveRecord::Base
  include Enumerize
  enumerize :tag, :in => ['分ける', '集まる', '知る']

  belongs_to :user
  has_many :foods

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: {maximum: 50}
  validates :detail, presence: true
  validates :image, presence: true

end
