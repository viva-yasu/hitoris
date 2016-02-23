class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  VALID_DU_EMAIL_REGEX =  /\A[\w+\-.]+@mail\d{1,2}.doshisha.ac.jp\z/

  validates :name, presence: true
  validates :nearest_station, presence: true
  validates :email, format: { with: VALID_DU_EMAIL_REGEX }
end
