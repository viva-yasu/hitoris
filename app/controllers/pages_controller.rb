class PagesController < ApplicationController
  before_action :sign_in_required, only: [:main]

  # TODO:: ログイン前の静的ページ
  def index
  end


  def main
  end
end
