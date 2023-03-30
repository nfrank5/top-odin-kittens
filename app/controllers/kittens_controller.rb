class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "You have successfully created a Kitten."
      redirect_to @kitten
    else
      flash.now[:notice] = "The Kitten was not created!"
      render "new", status: :unprocessable_entity
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    if @kitten.save
      flash[:notice] = "You have successfully updated the Kitten."
      redirect_to @kitten
    else
      flash.now[:notice] = "The Kitten was not updated!"
      render "edit", status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy
    Kitten.delete(params[:id])
    flash[:notice] = "You have successfully deleted the Kitten."
    redirect_to root_url
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
