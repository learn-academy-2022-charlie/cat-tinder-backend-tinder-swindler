# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
anime = [
    {
        name: "Revy",
        age: 28,
        enjoys: "Likes shooting guns",
        image: "https://imgix.ranker.com/user_node_img/50087/1001738585/original/whether-we-live-or-die-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650"
      },
      {
        name: "Obito",
        age: 25,
        enjoys: "Likes taking over the world",
        image: "https://otakukart.com/wp-content/uploads/2021/11/140034.jpg"
      },
      {
        name: "Esdeath",
        age: 33,
        enjoys: "Likes to freeze things she doesn't like",
        image: "http://pm1.narvii.com/6861/2582827e135640017caafdf1940b85cc4535c299r1-1920-1080v2_00.jpg"
      }
  ]
  
  animes.each do |each_anime|
    Anime.create each_anime
    puts "creating anime #{each_anime}"
  end