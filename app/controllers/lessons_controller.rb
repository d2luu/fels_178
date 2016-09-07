class LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :find_lesson, only: [:show, :update]

  def show
  end

  def create
    @lesson = current_user.lessons.new lesson_params
    if @lesson.save
      flash[:success] = t "containt.start"
      redirect_to lesson_path @lesson
    else
      flash[:danger] = t "create_fail"
      redirect_to category_path
    end
  end

  def update
    if @lesson.update_attributes lesson_params
      flash[:success] = t "containt.finish"
    else
      flash[:danger] = t "containt.update_fails"
    end
    redirect_to lesson_path @lesson
  end

  private
  def lesson_params
    params.require(:lesson).permit :category_id, :user_id, :status,
      results_attribute: [:id, :word_id, :answer_id, :user_id]
  end

  def find_lesson
    @lesson = Lesson.find_by_id params[:id]
    if @lesson.nil?
      flash[:danger] = t "notice.not_lesson"
      redirect_to category_path
    end
  end
end
