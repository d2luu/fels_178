class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates :name, presence: :true
  validates :description, presence: :true

  scope :search_category, -> search_name {
    where "name LIKE :search_name",
    search_name: "%#{search_name}%"
  }
end
