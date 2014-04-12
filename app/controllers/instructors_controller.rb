class InstructorsController < ApplicationController

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.save
    redirect_to @instructor
  end
  
  def edit
    @instructor = Instructor.find(params[:id])
  end
  
  def index
    @instructors = Instructor.all
  end
  
  def new
    @instructor = Instructor.new
  end
  
  def show
    @instructor = Instructor.find(params[:id])
  end
  
  def update
    @instructor = Instructor.find(params[:id])
    
    if @instructor.update(instructor_params)
      redirect_to @instructor
    else
      render 'edit'
    end
  end
  
  
  private
    def instructor_params
      params.require(:instructor).permit(:first_name, :last_name, :email, :phone, :bio)
    end
  
end
