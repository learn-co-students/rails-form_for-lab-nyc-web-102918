class StudentsController < ApplicationController
    def index
      @students=Student.all
    end

    def show
      @student=Student.find(params[:id])
    end

    def new
      @student=Student.new
    end

    def edit
      @student=Student.find(params[:id])

    end

    def create
      @student=Student.new(post_params(:first_name,:last_name))
      @student.save
      redirect_to action: "show", id: @student.id
    end

    def update
      @student=find
      @student.update(params.require(:student))
      redirect_to student_path(@student)
    end
    private

    def find
    Student.find(params[:id])
    end

    def post_params(*args)
      params.require(:student).permit(*args)
    end

  end
