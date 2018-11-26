class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    @student = find_student(params)
  end

  def create
    @student = Student.create(params.require(:student).permit(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  def edit
    @student = find_student(params)
  end

  def update
    @student = find_student(params)
    @student.update(params.require(:student).permit(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  private
  def find_student(params)
    @student = Student.find(params[:id])
  end
end
