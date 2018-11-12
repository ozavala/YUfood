class WeekDayMealsController < ApplicationController

  def new
    @week_day = WeekDay.find(params[:week_day_id])
    @meal = UserMeal.find(params[:meal_id]).meal
    @week_day_meal = WeekDayMeal.create!(week_day_id: @week_day.id , meal_id: @meal.id)
    redirect_to pages_home_path, notice: "Meal added to day"
  end

  def edit
    @week_day_meal = WeekDayMeal.find(params[:id])
    if params[:eaten].present?
      @week_day_meal.update_attributes(eaten: params[:eaten])
      redirect_to pages_home_path
    end
  end

  def destroy
    @week_day = WeekDay.find(params[:id])
    @week_day_meal = WeekDayMeal.find(params[:week_day_meal_id])
    @week_day_meal.destroy
    respond_to do |format|
      format.html { redirect_to @week_day , notice: 'Meal was removed.' }
      format.json { head :no_content }
    end
  end

end
