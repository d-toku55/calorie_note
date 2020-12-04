class UserRecodrsController < ApplicationController

  def index
    @user_recodrs = UserRecodr.includes(:user)
    @user_recodr = UserRecodr.new
    @foods = Food.search(params[:keyword])
  end

  def search
    @foods = Food.search(params[:keyword])
  end

  def create
  end

  def show
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :kcal, :g)
  end

end
