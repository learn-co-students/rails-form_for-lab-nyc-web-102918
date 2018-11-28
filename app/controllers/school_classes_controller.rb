class SchoolClassController < ApplicationController
  
#I looked at solutions after building what I have and still can't tell
# where I went wrong but I'm getting 2 weird errors unrelated to the tests...

  def index
    @school_classes = SchoolClass.all
  end

  def show
    find_school_class
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new(school_class_params)
    @school_class.save
    redirect_to school_class_path(@school_class)
  end

  def edit
    find_school_class
    #code
  end

  def update
    find_school_class
    @school_class.update(school_class_params)
    #code
    redirect_to school_class_path(@school_class)
  end

  private

  def find_school_class
    @school_class = SchoolClass.find(params[:id])
  end

  def school_class_params
    params.require(:school_class).permit(:title, :room_number)
  end

  end
