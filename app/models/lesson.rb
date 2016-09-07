class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :results, dependent: :destroy, inverse_of: :lesson
  has_many :words, through: :results

  delegate :name, to: :category, prefix: true, allow_nil: true
  after_create :create_result_for_lesson
  enum status: [:init, :finished]
  accepts_nested_attributes_for :results, allow_destroy: true

  def count_answer
    results.select{|result| result.answer && result.answer.is_correct?}.size
  end

  private
  def create_result_for_lesson
    Result.transaction do
      begin
        if results
          category.words.random.limit(Settings.number_of_word).each do |word|
            word.results.create! lesson_id: id, user_id: user.id
          end
        end
      rescue
        raise ActiveRecord::Rollback
      end
    end
  end
end
