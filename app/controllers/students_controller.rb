class StudentsController < ApplicationController

  def index
    @students = Student.all

  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])

  end

  def create
    @student = Student.create(post_params(:first_name, :last_name))

    redirect_to students_path
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    @student.update(post_params(:first_name, :last_name))
    redirect_to students_path
  end

  def destroy

  end

  private

  def post_params(*args)
    params.require(:student).permit(*args)
  end

end
