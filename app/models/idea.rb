class Idea < ApplicationRecord
  validates  :description, presence: true
  validates :title, presence: true, length: {maximum: 55}
  belongs_to :user
  has_many :reviews, dependent: :destroy


end
