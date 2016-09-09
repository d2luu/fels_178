class Result < ApplicationRecord
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer, optional: true
  belongs_to :user

  scope :in_lesson, -> lesson {where lesson_id: lesson.id}
  delegate :content, to: :word, prefix: true, allow_nil: true
end
