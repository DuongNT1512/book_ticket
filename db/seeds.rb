genres = %w(Action Adventure Animation Biography Comedy Crime Documentary Drama
Family Fantasy Film Noir History Horror Music Musical Mystery Romance Sci-Fi
Short Sport Superhero Thriller War Western)

for genre in genres
  Genre.create! name: genre, description: Faker::Lorem.paragraph(50)
end

# Theater seeds
for i in 1..10
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

# Admin seed
User.create! email: "root@awesome.com", password: "123456789",
  password_confirmation: "123456789", first_name: "admin", last_name: "admin",
  gender: :other, role: :admin, confirmed_at: Time.zone.now

# User seed
User.create! email: "h.nam94@gmail.com", password: "123456789",
  password_confirmation: "123456789", first_name: "Nam", last_name: "Chu",
  gender: :male, role: :user, confirmed_at: Time.zone.now
