class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates :name, presence: :true
  validates :description, presence: :true
end
