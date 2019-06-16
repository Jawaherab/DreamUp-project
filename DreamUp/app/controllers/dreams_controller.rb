class DreamsController < ApplicationController
  before_action :set_dream, only: [:show, :edit, :update, :destroy]
  
  def index
    @dreams = current_user.dreams
  end

  def show
  end

  def new
    @dream = current_user.dreams.new
  end

  def create
    @dream = current_user.dreams.new(dream_params)

    respond_to do |format|
      if @dream.save
        format.html { redirect_to @dream, notice: 'Dream was successfully created.' }
        format.json { render :show, status: :created, location: @dream }
      else
        format.html { render :new }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dreams/1
  # PATCH/PUT /dreams/1.json
  def update
    respond_to do |format|
      if @dream.update(dream_params)
        format.html { redirect_to @dream, notice: 'Dream was successfully updated.' }
        format.json { render :show, status: :ok, location: @dream }
      else
        format.html { render :edit }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dreams/1
  # DELETE /dreams/1.json
  def destroy
    @dream.destroy
    respond_to do |format|
      format.html { redirect_to dreams_url, notice: 'Dream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def edit
  end

  def set_dream
    @dream = current_user.dreams.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dream_params
    params.require(:dream).permit(:post, :date, :location)
  end

end
