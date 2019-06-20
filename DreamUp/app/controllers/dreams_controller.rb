class DreamsController < ApplicationController
  before_action :set_dream, only: [ :edit, :update, :destroy]
  
  def index
    @dream = current_user.dreams.new
    @dreams = current_user.dreams
  end

  def show
    @dream = Dream.find(params[:id])

    @comment = Comment.new
    @comment.dream_id = @dream.id
  end

  def new
    @dream = current_user.dreams.new
    
  end

  def create
    @dream = current_user.dreams.new(dream_params)
    if @dream.save
      redirect_to dream_path(@dream)
  else
      render :new
  end
  end

  
  def update
    @dream.update(dream_params)
        redirect_to dreams_path(@dream)
  end


  def destroy
    @dream.destroy
    redirect_to dreams_path
  end
  
  def edit
  end

  def set_dream
    @dream = current_user.dreams.find(params[:id])
  end

  
  def dream_params
    params.require(:dream).permit(:avatar , :post, :date, :location)
    
  end

end
