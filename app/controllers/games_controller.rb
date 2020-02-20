class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :delete_image]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to root_path
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
      @game.update(game_params)
      redirect_to root_path
  end



  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    redirect_to root_path

  end

  def delete_image
 begin
 @image = ActiveStorage::Attachment.find(params[:image_id])
 @image.purge
 redirect_to game_path(@game), notice: 'Imagen eliminada con éxito'
 rescue ActiveRecord::RecordNotFound
 redirect_to game_path(@game), alert: 'Error al eliminar la imagen'
 end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
    params.require(:game).permit(:name, :content, :instruction, :image, images: [])
    end
end
