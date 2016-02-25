class TalksController < ApplicationController
  def index
    @talks = Talk.all
  end

  def show
  end

  def new
    @talk = Talk.new
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy

  end
end
