class UserRecodrsController < ApplicationController

  def index
    @user_recodrs = UserRecodr.includes(:user)
    @user_recodr = UserRecodr.new
    @foods = Food.search(params[:keyword])
  end

  def search
    @foods = Food.search(params[:keyword])
  end

end
