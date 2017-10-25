class TasksController < ApplicationController
  respond_to :js, :only => :get_price
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :action => new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def get_price
    @task = Task.find(params[:id])
    @price = @task.price
    render :json => @price
  end

  private
  def task_params
    params.require(:task).permit(:name, :price)
  end
end
