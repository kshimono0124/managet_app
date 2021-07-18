class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader       
  validates :name,  presence: true
  validates :email, presence: true
  has_many :reviews, dependent: :destroy
  
  def self.guest
    find_or_create_by!(name: 'guest', email: 'guest@guest.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
