class Word < ApplicationRecord
  belongs_to :category
  delegate :name, to: :category, prefix: true, allow_nil: true
  has_many :answers, dependent: :destroy
  has_many :lessons, through: :results

end
