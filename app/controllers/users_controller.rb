class UsersController < ApplicationController
  before_action :find_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    if @current_user == User.find(params[:id])
      @user = User.find(params[:id])
    end
  end

  def update
    if @current_user == User.find(params[:id])
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user
      else
        render :eidt, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def find_user
    @current_user = User.find_by_id(session[:user_id])
  end
  
end
