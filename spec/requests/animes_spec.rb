require 'rails_helper'

RSpec.describe "Animes", type: :request do
  describe "GET /index" do
    it 'gets all the anime from the DB when endpoint GET /animes is requested' do 
      # create a new id so you can get it a request back 
      Anime.create name: 'Naruto', age: 19, enjoys: 'Fighting Sasuke', image:'https://cdn.vox-cdn.com/thumbor/UYGyZq6-eRl1gI_sZtFUDhVvois=/0x0:1280x721/1820x1213/filters:focal(544x281:748x485):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70124512/naruto.0.jpg'

      get '/animes'
            # this is the response 
      anime = JSON.parse(response.body)
            # need to make sure the status code is correct 
      expect(response).to have_http_status(200)

      expect(anime.length).to eq 1
    end
  end
    describe "POST /create" do
    it 'creates an anime personal' do 
      # send to app to have something loaded into db
      
      anime_params = {
        anime: {
          name:'Naruto',
           age: 19, 
           enjoys: 'Fighting Sasuke',
            image:'https://cdn.vox-cdn.com/thumbor/UYGyZq6-eRl1gI_sZtFUDhVvois=/0x0:1280x721/1820x1213/filters:focal(544x281:748x485):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70124512/naruto.0.jpg'
        }
      }

        post '/animes', params: anime_params

        expect(response).to have_http_status(200)

        anime = Anime.first

        expect(anime.name).to eq 'Naruto'
        expect(anime.age).to eq 19
        expect(anime.enjoys).to eq 'Fighting Sasuke'
        expect(anime.image).to eq 'https://cdn.vox-cdn.com/thumbor/UYGyZq6-eRl1gI_sZtFUDhVvois=/0x0:1280x721/1820x1213/filters:focal(544x281:748x485):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70124512/naruto.0.jpg'
        
      end
    end

    describe "PATCH /update" do
      it 'updates an anime personal' do

        Anime.create name: 'Naruto', age: 19, enjoys: 'Fighting Sasuke', image:'https://cdn.vox-cdn.com/thumbor/UYGyZq6-eRl1gI_sZtFUDhVvois=/0x0:1280x721/1820x1213/filters:focal(544x281:748x485):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70124512/naruto.0.jpg'
        
        anime= Anime.first

        updated_anime_params = {
        anime: {
          name:'Naruto',
           age: 20, 
           enjoys: 'Fighting Sasuke',
            image:'https://cdn.vox-cdn.com/thumbor/UYGyZq6-eRl1gI_sZtFUDhVvois=/0x0:1280x721/1820x1213/filters:focal(544x281:748x485):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70124512/naruto.0.jpg'
        }
      }


        patch "/animes/#{anime.id}", params: updated_anime_params
        
        expect(response).to have_http_status(200)
        
        updated_anime = Anime.find(anime.id)
        expect(anime.age).to eq 19
        expect(updated_anime.age).to eq 20
      end
    end

end
