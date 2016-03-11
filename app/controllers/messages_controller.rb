class MessagesController < ApplicationController
  def index
    @talk_id = params[:id].to_i
    @talk = Talk.find @talk_id
    @messages = Message.where(talk_id: @talk_id)
    new_message = Message.new
    message = Message.new
  end

  def create
    message = Message.new(message_params)
    message.user_id = current_user.id
    if message.save
      redirect_to message_path
    else
      before_render
      render 'index'
    end
  end

  def destroy
    message = Message.find_by(id: params[:message][:id])
    unless message.nil?
      message.destroy
    end
    redirect_to message_path
  end

  def post
    message = params[:message]
    if message.length == 0
      return render :text => 'OK', :status => 200
    end
    message = Message.new(message: message, user_id: current_user.id, talk_id: params[:talk_id].to_i)
    message.save
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
    Pusher['messages' + params[:talk_id] + '_channel'].trigger('chat_event', data)
    render :text => 'OK', :status => 200
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end

  def before_render
    @messages = Message.all
    new_message = Message.new
  end
end
