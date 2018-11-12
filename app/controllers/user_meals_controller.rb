class UserMealsController < ApplicationController
  before_action :set_user_meal, only: [:show, :edit, :update, :destroy]

  # GET /user_meals
  # GET /user_meals.json
  def index
    @user_meals = UserMeal.all
    @my_meals = current_user.user_meals.all
  end

  # GET /user_meals/1
  # GET /user_meals/1.json
  def show
  end

  # GET /user_meals/new
  def new
    @user_meal = UserMeal.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /user_meals
  # POST /user_meals.json
  def create
    @user_meal = UserMeal.new
    @user_meal.user_id = params[:user_id]
    @user_meal.meal_id = params[:meal_id]
    @user_meal.save

    respond_to do |format|
      if @user_meal.save
        format.html { redirect_to meal_path(@user_meal.meal), notice: 'user_meal was successfully created.' }
        format.json { render :show, status: :created, location: @user_meal }
      else
        format.html { render :new }
        format.json { render json: @user_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_meals/1
  # PATCH/PUT /user_meals/1.json
  def update
    respond_to do |format|
      if @user_meal.update(user_meal_params)
        format.html { redirect_to @user_meal, notice: 'user_meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_meal }
      else
        format.html { render :edit }
        format.json { render json: @user_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_meals/1
  # DELETE /user_meals/1.json
  def destroy
    @user_meal.destroy
    respond_to do |format|
      format.html { redirect_to user_meals_url, notice: 'user_meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_meal
      @user_meal = UserMeal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_meal_params
      params.require(:user_meal).permit(:user_id, :name, :description)
    end
end
