
class FlowersController < ApplicationController
  before_action :set_flower, only: %i[show edit update destroy]

  def index
    @flowers = Flower.all

    if params[:category].present?
      @flowers = @flowers.where(category: params[:category])
    end
  end

  def show
  end

  def new
    @flower = Flower.new
  end

  def edit
  end

  def create
  @flower = current_user.flowers.new(flower_params)

  if @flower.save
    redirect_to flowers_path, notice: "Квітку успішно додано!"
  else
    render :new, status: :unprocessable_entity
  end
end

  def update
    if @flower.update(flower_params)
      redirect_to flowers_path, notice: "Інформацію оновлено!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flower.destroy
    redirect_to flowers_path, notice: "Квітку видалено!"
  end

  def destroy_all
    Flower.destroy_all
    redirect_to flowers_path, notice: "Усі квіти видалено!"
  end

  private

  def set_flower
    @flower = Flower.find(params[:id])
  end

  def flower_params
    params.require(:flower).permit(
      :name, :description, :price, :category, :image
    )
  end
end
