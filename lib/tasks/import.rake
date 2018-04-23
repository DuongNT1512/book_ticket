require 'csv'

namespace :import do
  desc "Import movies from csv"

  task movies: :environment do
    filename = File.join Rails.root, "movies.csv"
    genre_hash = {}
    CSV.foreach(filename) do |row|
      movie = Movie.new
      movie.name = row[0]
      movie.vietnamese = row[1]
      movie.release_date = row[2].to_date
      movie.length = row[3].to_i
      movie.language = row[4].to_sym
      movie.actors = row[5]
      movie.directors = row[6]
      movie.description = row[7]
      movie.status = row[8].to_sym
      movie.rate = row[9]
      movie.thumbnail = row[10]
      movie.carousel = row[11]
      genres = row[12].split "/"
      for genre_name in genres
        gen = Genre.find_by name: genre_name
        movie.genres.push(gen)
      end
      movie.save!
    end
  end

  task shows: :environment do
    for i in 1..10000
      show = Show.new
      show.movie = Movie.all[Random.new.rand(Movie.all.count)]
      show.screen = Screen.all[Random.new.rand(Screen.all.count)]
      show.ticket_price = 20
      show.date = Faker::Date.between(2.days.ago, 4.days.from_now)
      show.start_time = Faker::Time.between(show.date.to_date, show.date.to_date + 23.hours).getlocal
      show.end_time =(show.start_time + show.movie.length.minutes).getlocal

      if show.end_time < Date.today && :archived == show.movie.status
        show.disabled = true
      end
      show.save!
    end
  end
end

