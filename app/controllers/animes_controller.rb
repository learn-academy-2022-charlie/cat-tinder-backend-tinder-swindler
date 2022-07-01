class AnimesController < ApplicationController
    def index
        animes = Anime.all 
        render json:animes
    end

    def create 
        anime = Anime.create(anime_params)
        render json: anime
    end

    def update
        anime = Anime.find(params[:id])
        anime.update(anime_params)
        render json: anime 
    end

    def destroy 

    end

    private 
    def anime_params
        params.require(:anime).permit(:name, :age, :enjoys, :image)
    end
end
