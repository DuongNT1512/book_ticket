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
for i in 1..3
  Theater.create! name: Faker::Company.name, description:
    Faker::Lorem.paragraph(50), address: Faker::Address.street_address
end

# Screen seeds
for theater in Theater.all
  for i in 1..5
    Screen.create! name: "IMAX Screen #{i}", description:
      Faker::Lorem.paragraph(50), seat: 100, theater: theater
  end
end

# Show seeds
for i in 1..1000
  show = Show.new
  show.movie = Movie.all[Random.new.rand(Movie.all.count)]
  show.screen = Screen.all[Random.new.rand(Screen.all.count)]
  show.date = Faker::Date.between(10.days.ago, 10.days.from_now)
  show.start = Faker::Time.between(show.date.to_date, show.date.to_date +
                                   23.hours)
  show.end = show.start + show.movie.length.minutes

  if show.end < Date.today && :archived == show.movie.status
    show.disabled = true
  end
  show.save!
end
