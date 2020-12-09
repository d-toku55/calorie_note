class UsersController < ApplicationController
  def show
    get_week
    @users = User.includes(:user_recodr)
    @nickname = current_user.nickname
    @user_recodrs = current_user.user_recodrs.order(created_at: :desc)
    @foods = Food.search(params[:keyword])
  end

  def create
    @user_recodr = UserRecodr.new(user_recodr_params)
    if @user_recodr.valid?
      @user_recodr.save
      redirect_to user_recodr_user_path(id: current_user)
    else
      render 'users/show'
    end
  end

  private

  def user_recodr_params
    params.permit(:date, :food_name, :kcal, :g).merge(user_id: current_user.id)
  end

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    @todays_date = Date.today

    @week_days = []

    @user_recodrs = UserRecodr.where(date: @todays_date..@todays_date + 6)

    1.times do |x|
      @user_recodrs = []
      @user_recodrs.each do |user_recodr|
        @user_recodrs.push(user_recodr.user_recodr) if @user_recodrs.date == @todays_date + x
      end

      wday_num = Date.today.wday

      if 7 >= wday_num
        wday_num = wday_num - 7
      end

      days = { month: (@todays_date + x).month, date: (@todays_date + x).day, user_recodrs: @user_recodrs, wday: wdays[wday_num + x]}
      @week_days.push(days)
    end
  end
end
