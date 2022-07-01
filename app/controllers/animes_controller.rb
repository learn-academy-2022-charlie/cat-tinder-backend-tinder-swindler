class AnimesController < ApplicationController
    def index
        animes = Anime.all 
        render json:animes
    end

    def create 
        anime = Anime.create(anime_params)
        if anime.valid?
            render json: anime
        else
            render json: anime.error, status:422
        end
    end
    def update 
        anime = Anime.find(params[:id])
        anime.update(anime_params)
        if anime.valid?
        render json: anime
        else
            render json: anime.error, status:422
        end
    end

    def destroy 

    end

    private 
    def anime_params
        params.require(:anime).permit(:name, :age, :enjoys, :image)
    end
end
