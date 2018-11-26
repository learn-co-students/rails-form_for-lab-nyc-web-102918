class SchoolClassesController < ApplicationController
  #Create controller files for school_classes and students. Build out the
  #new, create, show, edit, and update actions in each of the controllers.

 def index
 end

 def show
   @school_class = SchoolClass.find(params[:id])
 end

 def new
   @school_class = SchoolClass.new
 end

 def create
   @school_class = SchoolClass.create(school_class_params)
   redirect_to school_class_path(@school_class)
 end

 def edit
   @school_class = SchoolClass.find(params[:id])
 end

 def update
   @school_class = SchoolClass.find(params[:id])
   @school_class.update(school_class_params)
   redirect_to school_class_path(@school_class)
 end

 private
 def school_class_params
   params.require(:school_class).permit(:title, :room_number)
 end


end
