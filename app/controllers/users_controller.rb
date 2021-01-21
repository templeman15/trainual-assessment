class UsersController < ApplicationController
  include Pagy::Backend

  def index
    @search = User.ransack(params[:q])
    @pagy, @users = pagy(@search.result(distinct: true))
  end
end
