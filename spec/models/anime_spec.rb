require 'rails_helper'

RSpec.describe Anime, type: :model do
  it 'has a name' do
    anime = Anime.create age:19, enjoys:'Fighting Sasuke', image:'https://cdn.vox-cdn.com/thumbor/UYGyZq6-eRl1gI_sZtFUDhVvois=/0x0:1280x721/1820x1213/filters:focal(544x281:748x485):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70124512/naruto.0.jpg'
    expect(anime.errors[:name]).to_not be_empty
  end
  it 'has an age' do
    anime = Anime.create name:'Naruto', enjoys:'Fighting Sasuke', image:'https://cdn.vox-cdn.com/thumbor/UYGyZq6-eRl1gI_sZtFUDhVvois=/0x0:1280x721/1820x1213/filters:focal(544x281:748x485):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70124512/naruto.0.jpg'
    expect(anime.errors[:age]).to_not be_empty
  end
  it 'has an enjoys' do
    anime = Anime.create name:'Naruto', age:19, image:'https://cdn.vox-cdn.com/thumbor/UYGyZq6-eRl1gI_sZtFUDhVvois=/0x0:1280x721/1820x1213/filters:focal(544x281:748x485):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70124512/naruto.0.jpg'
    expect(anime.errors[:enjoys]).to_not be_empty
  end
  it 'has an image' do
    anime = Anime.create name:'Naruto', age: 19, enjoys:'Fighting Sasuke'
    expect(anime.errors[:image]).to_not be_empty
  end
  it 'enjoys has a minimum length of 10' do
    anime = Anime.create name:'Naruto', age: 19, enjoys:'Fighting', image:'https://cdn.vox-cdn.com/thumbor/UYGyZq6-eRl1gI_sZtFUDhVvois=/0x0:1280x721/1820x1213/filters:focal(544x281:748x485):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70124512/naruto.0.jpg'
    expect(anime.errors[:enjoys]).to_not be_empty
  end
end
