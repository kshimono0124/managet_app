class Client < ApplicationRecord
  belongs_to :user
  validates :company, presence: true
  validates :name,  presence: true
  validates :phonenumber,  presence: true
  validates :email,  presence: true
end
