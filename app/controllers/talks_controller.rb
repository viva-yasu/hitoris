class TalksController < ApplicationController
  def index
    @talks = Talk.order("id DESC")
  end

  def show
    # render text: params[:id]
    @talk = Talk.find(get_id_params)
    if @talk.nil?
      redirect_to main_path
    end
  end

  def new
    @talk = Talk.new
  end

  def edit
    @talk = Talk.find(get_id_params)
    @talk.image.cache! unless @talk.image.blank?

    if @talk.nil? || current_user.id != @talk.user_id
      redirect_to main_path
    end
  end

  def update
    @talk = Talk.find params[:talk][:id].to_i
    @talk.title = params[:talk][:title]
    @talk.detail = params[:talk][:detail]
    @talk.image = params[:talk][:image].nil? ? params[:talk][:image_cache].split('/')[1] : params[:talk][:image]
    @talk.tag = params[:talk][:tag]
    if @talk.save
      redirect_to action: 'show', id: @talk.id
    else
      render :edit
    end
  end

  def create
    @talk = Talk.new(talk_params)
    @talk.user_id = current_user.id

    if @talk.save
      redirect_to main_path, notice: '作成しました.'
    else
      render :new
    end
  end

  def destroy
    @talk = Talk.find(get_id_params)

    if @talk.nil? || current_user.id != @talk.user_id
      redirect_to main_path
    end
    @talk.destroy
    redirect_to main_path
  end

  private
  def talk_params
    params.require(:talk).permit(:title, :detail, :image, :image_cache, :tag)
  end

  def get_id_params
    params[:id].to_i
  end
end
