class SchedulesController < ApplicationController
  layout 'index_footer_html.erb', only: :index
  
  def index
    @schedules = Schedule.all
    @schedule_count = Schedule.count
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_time, :finish_time,:all_day,:schedule_memo))
    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :schedules
    else
      flash[:error_notice] = "スケジュールを登録できませんでした"
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_time, :finish_time, :all_day, :schedule_memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      flash[:error_notice] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:destroy_notice] = "スケジュールを削除しました"
    redirect_to :schedules
  end
end
