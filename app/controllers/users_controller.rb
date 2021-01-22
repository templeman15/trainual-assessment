class UsersController < ApplicationController
  before_action :find_user, only: %w[destroy]
  include Pagy::Backend

  def index
    @search = User.ransack(params[:q])
    @pagy, @users = pagy(@search.result(distinct: true))
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :title, :phone)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
