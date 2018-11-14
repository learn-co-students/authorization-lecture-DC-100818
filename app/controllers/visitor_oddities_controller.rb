class VisitorOdditiesController < ApplicationController
  def index
    @v_os = VisitorOddity.all
    render json: @v_os , include: [:user, :oddity]
  end

  def push_path
    redirect_to visitor_oddities_path
  end
end
