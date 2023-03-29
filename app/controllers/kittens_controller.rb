class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten
    else
       render "new"
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update!(kitten_params)
    if @kitten.save
      redirect_to @kitten
    else
       render "edit"
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy
  end

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
