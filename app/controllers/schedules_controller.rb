class SchedulesController < ApplicationController
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.start_date = Date.strptime(params[:start_date], "%m/%d/%Y")
    @schedule.end_date = Date.strptime(params[:end_date], "%m/%d/%Y")
    @schedule.save
    redirect_to @schedule
  end

  def new
    @schedule = Schedule.new
    @statuses = Array.new(2)
    @status = ["draft", "published"]
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    
    if @schedule.update(schedule_params)
      redirect_to @schedule
    else
      render 'edit'
    end
  end
  
  private
    def schedule_params
      params.require(:schedule).permit(:name, :note, :start_date, :end_date, :status)
    end

end
