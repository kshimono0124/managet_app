class Client < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :company, presence: true
  validates :name,  presence: true
  validates :phonenumber,  presence: true
  validates :email,  presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      (reviews.average(:score).round(1).to_f*100/5) / 2
    else
      0.0
    end
  end
end
