class Api::LyricsController < ApplicationController

  before_action :set_lyric, only: [:show, :update, :destroy]
  
  def index
    render json: Lyric.all
  end

  def create 
    lyric = Lyric.new(lyric_params)
    if lyric.save 
      render json:lyric
    else
      render json: {message: song.errors}, status: 400 
    end
  end

  def update 
    if @lyric.update(lyric_params)
      render json: @lyric
    else
      render json: {message: song.errors}, status: 400 
    end
  end

  def show
    render json: @lyric
  end

  def destroy 
    if @lyric.destroy 
      render json: @lyric.all
    else 
      render json: {message: "song not deleted"}, status: 400 
    end
  end
    
  private

    def set_song
      @lyric = Lyric.find_by(id: params[:id])
    end

    def song_params
      params.require(:lyric).permit(:words, :song_id)
    end

  
end
