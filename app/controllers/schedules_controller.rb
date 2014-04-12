class SchedulesController < ApplicationController
  def create
    #todo: check that start_date < end_date and give a message if it's not
    @schedule = Schedule.new(schedule_params)
    @schedule.start_date = Date.strptime(params[:start_date], "%m/%d/%Y")
    @schedule.end_date = Date.strptime(params[:end_date], "%m/%d/%Y")
    @schedule.save
    redirect_to @schedule
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path
  end

  def new
    @schedule = Schedule.new
    @statuses = Array.new(2)
    @status = ["draft", "published"]
  end

  def edit
    #todo: can only edit schedules that are in draft mode
    @schedule = Schedule.find(params[:id])
    @start_date = @schedule.start_date.to_date
    @end_date = @schedule.end_date.to_date
    @start_date_str = @start_date.strftime("%m/%d/%Y")
    @end_date_str = @end_date.strftime("%m/%d/%Y")
  end
  
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end    

  def update
    @schedule = Schedule.find(params[:id])
    #todo: find an more elegant solution for this
    @schedule.start_date = Date.strptime(params[:start_date], "%m/%d/%Y")
    @schedule.end_date = Date.strptime(params[:end_date], "%m/%d/%Y")
    
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
