class UserRecodrsController < ApplicationController

  def index
    get_week
    @user_recodr = UserRecodr.new
    @foods = Food.search(params[:keyword])
  end

  def search
    @foods = Food.search(params[:keyword])
    #@foods = Food.find(food_params)
  end
  
  private

  def food_params
    params.require(:food).permit(:food_name, :kcal, :g)
  end

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    @todays_date = Date.today

    @week_days = []

    user_recodrs = UserRecodr.where(date: @todays_date..@todays_date + 6)

    1.times do |x|
      today_user_recodrs = []
      user_recodr = user_recodrs.map do |user_recodr|
        today_user_recodrs.push(user_recodr.user_recodr) if user_recodr.date == @todays_date + x
      end

      wday_num = Date.today.wday

      if 7 >= wday_num
        wday_num = wday_num - 7
      end

      days = { month: (@todays_date + x).month, date: (@todays_date + x).day, user_recodrs: today_user_recodrs, wday: wdays[wday_num + x]}
      @week_days.push(days)
    end
  end
end
