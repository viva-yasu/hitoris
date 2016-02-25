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

  def post
    message = params[:message]
    food = Food.new(message: message, user_id: current_user.id)
    food.save
    if current_user.image?
      img = current_user.image.thumb.url
    else
      img = '/assets/thumb_default.png'
    end
    data = {
        message: message,
        name: current_user.name,
        image_path: img
    }
    Pusher['food_channel'].trigger('chat_event', data)
    render :text => 'OK', :status => 200
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
