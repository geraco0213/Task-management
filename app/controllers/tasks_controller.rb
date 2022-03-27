class TasksController < ApplicationController
  before_action :set_user
  
  def index
    @tasks=Task.where(user_id:@user.id)
  end
  
  def show 
  end
  
  def new
    @task=Task.new
    
  end
  
  def create
    @task=@user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
      
  
  
  private
  
    def user_params
      params.require(:task).permit(:name, :description, :user_id)
    end
  
    def set_user
      @user=User.find(params[:user_id])
    end
  
end


