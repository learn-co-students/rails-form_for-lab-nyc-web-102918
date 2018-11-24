class SchoolClassesController < ApplicationController

  def index
    @classes=SchoolClass.all
  end

  def show
    @class=SchoolClass.find(params[:id])

  end

  def new
    @class=SchoolClass.new
  end

  def edit
    @class=find
  end

  def create
    @class=SchoolClass.new(post_params(:title, :room_number))
    @class.save
    redirect_to action: "show", id: @class.id
  end

  def update
    @class=find
    @class.update(post_params(:title, :room_number))
    redirect_to school_class_path(@class)
  end
  private

  def find
  SchoolClass.find(params[:id])
  end

  def post_params(*args)
    params.require(:school_class).permit(*args)
  end

end
