class FoodController < ApplicationController
  def index
    @foods = Food.all
    @new_food = Food.new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to food_path
    else
      before_render
      render 'index'
    end
  end

  def destroy
    food = Food.find_by(id: params[:food][:id])
    unless food.nil?
      food.destroy
    end
    redirect_to food_path
  end

  private
  def food_params
    params.require(:food).permit(:message)
  end

  def before_render
    @foods = Food.all
    @new_food = Food.new
  end
end
