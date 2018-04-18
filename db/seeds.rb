genres = %w(Action Adventure Animation Biography Comedy Crime Documentary Drama
Family Fantasy Film Noir History Horror Music Musical Mystery Romance Sci-Fi
Short Sport Superhero Thriller War Western)

for genre in genres
  Genre.create! name: genre, description: Faker::Lorem.paragraph(50)
end

# Movie seeds
movie_names = ["The Wizard of Oz", "Citizen Kane", "Get Out", "The Third Man",
          "Mad Max: Fury Road", "The Cabinet of Dr. Caligari", "Inside Out",
          "All About Eve", "Moonlight", "Metropolis",
          "E.T. The Extra-Terrestrial", "Spotlight", "It Happened One Night",
          "Casablanca", "Modern Times", "Singin' in the Rain", "The Godfather",
          "Laura", "The Big Sick", "Psycho", "12 Years a Slave",
          "A Hard Day's Night", "Wonder Woman", "La Grande illusion",
          "North by Northwest", "Nosferatu, a Symphony of Horror",
          "The Maltese Falcon", "Boyhood", "Gravity", "The Battle of Algiers",
          "Snow White and the Seven Dwarfs", "King Kong", "Argo", "Logan",
          "Repulsion", "Sunset Boulevard", "Zootopia",
          "The Adventures of Robin Hood",
          "Star Wars: Episode VII - The Force Awakens", "Arrival"]

for movie_name in movie_names
  movie = Movie.new
  movie.name = movie_name
  movie.release_date = Faker::Date.backward(60)
  movie.length = Random.new.rand(60..180)
  movie.description = Faker::Lorem.paragraph(50)
  movie.actors = Faker::Name.name
  movie.directors = Faker::Name.name
  movie.genres = [Genre.all[Random.new.rand(Genre.all.count)],
                  Genre.all[Random.new.rand(Genre.all.count)],
                  Genre.all[Random.new.rand(Genre.all.count)]]
  movie.language = Settings.movie.languages[Random.new.rand(6)]
  movie.status = Settings.movie.status[Random.new.rand(3)]
  movie.rate = Settings.movie.rates[Random.new.rand(5)]
  movie.save!
end

# Theater seeds
for i in 1..20
  Theater.create! name: Faker::Company.name, description:
    Faker::Lorem.paragraph(50), address: Faker::Address.street_address
end

# Screen seeds
for theater in Theater.all
  for i in 1..5
    screen = Screen.new
    screen.name = "IMAX Screen #{i}"
    screen.description = Faker::Lorem.paragraph(50)
    screen.seat_rows = 10
    screen.seat_columns = 16
    screen.layout = [
      [0,0,1,1,0,1,1,1,1,1,1,0,1,1,0,0],
      [0,0,1,1,0,1,1,1,1,1,1,0,1,1,0,0],
      [0,0,1,1,0,1,1,1,1,1,1,0,1,1,0,0],
      [0,0,1,1,0,1,1,1,1,1,1,0,1,1,0,0],
      [0,0,1,1,0,1,1,1,1,1,1,0,1,1,0,0],
      [0,0,1,1,0,1,1,1,1,1,1,0,1,1,0,0],
      [1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1],
      [1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1],
      [1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1],
      [1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1]
    ]
    screen.theater = theater
    screen.save!
  end
end

# Show seeds
for i in 1..10000
  show = Show.new
  show.movie = Movie.all[Random.new.rand(Movie.all.count)]
  show.screen = Screen.all[Random.new.rand(Screen.all.count)]
  show.ticket_price = 20
  show.date = Faker::Date.between(10.days.ago, 10.days.from_now)
  show.start_time = Faker::Time.between(show.date.to_date, show.date.to_date + 23.hours).getlocal
  show.end_time =(show.start_time + show.movie.length.minutes).getlocal

  if show.end_time < Date.today && :archived == show.movie.status
    show.disabled = true
  end
  show.save!
end

# Admin seed
User.create! email: "root@awesome.com", password: "123456789",
  password_confirmation: "123456789", first_name: "admin", last_name: "admin",
  gender: :other, role: :admin, confirmed_at: Time.zone.now
