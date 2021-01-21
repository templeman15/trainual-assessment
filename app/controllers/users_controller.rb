class UsersController < ApplicationController
  before_action :find_user, only: %w[destroy]
  include Pagy::Backend

  def index
    @search = User.ransack(params[:q])
    @pagy, @users = pagy(@search.result(distinct: true))
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
