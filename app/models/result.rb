class Result < ApplicationRecord
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer, optional: true
  belongs_to :user

  delegate :content, to: :word, prefix: true, allow_nil: true
  delegate :answers, to: :word, prefix: true, allow_nil: true
end
