class User < ActiveRecord::Base
  has_many :foods

  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  VALID_DU_EMAIL_REGEX =  /\A[\w+\-.]+@mail\d{1,2}.doshisha.ac.jp\z/

  validates :name, presence: true, length: { maximum: 50 }
  validates :nearest_station, presence: true
  # TODO:: コメントアウトを外す
  # validates :email, format: { with: VALID_DU_EMAIL_REGEX }
end
