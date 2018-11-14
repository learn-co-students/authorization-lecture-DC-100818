class OdditiesController < ApplicationController
  before_action :find_oddity, only: [:show, :edit, :update, :destroy]
  def index
    @oddities = Oddity.all
  end

  def show
  end

  def new
    @oddity = Oddity.new
  end

  def create
    @oddity = Oddity.create(oddity_params)
    if @oddity
      redirect_to @oddity
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @oddity.update(oddity_params)
      redirect_to @oddity
    else
      render :edit
    end
  end

  def destroy
    @oddity.destroy
    redirect_to oddities_path
  end

  private

  def find_oddity
    @oddity = Oddity.find(params[:id])
  end

  def oddity_params
    params.require(:oddity).permit(:name, :description, :actual_description, :museum_id)
  end
end
