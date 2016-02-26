class FoodController < ApplicationController
  def index
    @talk_id = params[:id].to_i
    @talk = Talk.find @talk_id
    @foods = Food.where(talk_id: @talk_id)
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
    if message.length == 0
      return render :text => 'OK', :status => 200
    end
    food = Food.new(message: message, user_id: current_user.id, talk_id: params[:talk_id].to_i)
    food.save
    if current_user.image?
      img = current_user.image.thumb.url
    else
      img = '/assets/thumb_default.png'
    end
    data = {
        message: message,
        name: current_user.name,
        image_path: img,
        user_id: current_user.id
    }
    Pusher['food' + params[:talk_id] + '_channel'].trigger('chat_event', data)
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
