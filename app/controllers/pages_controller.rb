class PagesController < ApplicationController
  def index
  end

  def home
    if params[:meal_plan].present?
      @my_meal_plan = current_user.meal_plans.find(params[:meal_plan])
    else
      @my_meal_plan = current_user.meal_plans.select {|x| x.start_date <= Date.today }.last
    end
    if @my_meal_plan.present?
      @week_days = @my_meal_plan.week_days
    end
    @my_meals = current_user.user_meals.all
    @meal_plan = MealPlan.new
  end
end
