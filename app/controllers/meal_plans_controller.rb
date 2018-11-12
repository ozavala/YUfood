class MealPlansController < ApplicationController
  before_action :set_meal_plan, only: [:show, :edit, :update, :destroy]

  # GET /meal_plans
  # GET /meal_plans.json
  def index
    @meal_plans = current_user.meal_plans
  end

  # GET /meal_plans/1
  # GET /meal_plans/1.json
  def show
  end

  # GET /meal_plans/new
  def new
    @meal_plan = MealPlan.new
  end

  # GET /meal_plans/1/edit
  def edit
  end

  # POST /meal_plans
  # POST /meal_plans.json
  def create
    @meal_plan = MealPlan.new(meal_plan_params)

    respond_to do |format|
      if @meal_plan.save
        week_day_creation(@meal_plan)
        format.html { redirect_to @meal_plan, notice: 'Meal plan was successfully created.' }
        format.json { render :show, status: :created, location: @meal_plan }
      else
        format.html { render :new }
        format.json { render json: @meal_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_plans/1
  # PATCH/PUT /meal_plans/1.json
  def update
    respond_to do |format|
      if @meal_plan.update(meal_plan_params)
        format.html { redirect_to @meal_plan, notice: 'Meal plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal_plan }
      else
        format.html { render :edit }
        format.json { render json: @meal_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_plans/1
  # DELETE /meal_plans/1.json
  def destroy
    @meal_plan.destroy
    respond_to do |format|
      format.html { redirect_to meal_plans_url, notice: 'Meal plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shopping_list
    @meal_plan = MealPlan.finf(params[:meal_plan_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_plan
      @meal_plan = MealPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_plan_params
      params.fetch(:meal_plan, {})
      # params.require(:meal_plan).permit(:budget, :week_day_id, :user_id, :number_of_weeks, :start_date)
    end

    def week_day_creation(meal_plan)
      total_days = meal_plan.number_of_weeks
      date_holder = meal_plan.start_date
      total_days.times do
        WeekDay.create!(date: date_holder , eaten: false, meal_plan_id: meal_plan.id)
        date_holder = date_holder + 1
      end
    end
end
