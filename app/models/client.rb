class Client < ApplicationRecord
  validates :company, presence: true
  validates :name,  presence: true
  validates :phonenumber,  presence: true
  validates :email,  presence: true
end
