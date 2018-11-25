class SchoolClassesController < ApplicationController

  def index
    @school_classes = SchoolClass.all
  end

  def show
    @school_class = find_class(params)
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.create(params.require(:school_class).permit(:title, :room_number))
    redirect_to school_class_path(@school_class)
  end

  def edit
    @school_class = find_class(params)
  end

  def update
    @school_class = find_class(params)
    @school_class.update(params.require(:school_class).permit(:title, :room_number))
    redirect_to school_class_path(@school_class)
  end

  private

    def find_class(params)
      @school_class = SchoolClass.find(params[:id])
    end

end
