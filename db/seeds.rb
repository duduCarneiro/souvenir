# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'


puts 'Cleaning database...'
Location.destroy_all
User.destroy_all
Album.destroy_all

puts 'creating fake user'
first_user = User.create(password: '123456', email: 'ze@ninguem.com')

puts 'creating fakes locations'
places = ['Ipanema, Rio de Janeiro', 'Avenue Montaigne, Paris', 'Les Invalides, Paris', 'Notre Dame, Paris', 'Newlands, Capetown', 'Time Square, New York', 'Aoyama, Tokyo']

count = 0
places.each do |element|
    location = Location.create!(address: element, user_id: first_user.id)
    puts "place id: #{location.id}- location: #{location.address}"
    count +=1
    puts "(#{count} of #{places.count} done)"
end

puts 'creating fakes albums'
images = ['https://source.unsplash.com/800x450/?ipanema,rio',
            'https://source.unsplash.com/800x450/?montaigne,paris',
            'https://source.unsplash.com/800x450/?lesinvalides,paris',
            'https://source.unsplash.com/800x450/?notredame,paris',
            'https://source.unsplash.com/800x450/?newlands,capetown',
            'https://source.unsplash.com/800x450/?timesquare,newyork',
            'https://source.unsplash.com/800x450/?aoyama,tokyo'
        ]

sum = 0
2.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 0)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Ipanema, Rio de Janeiro"
    file = open(images[0])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 38 done)"
end

10.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 1)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Montaigne, Paris"
    file = open(images[1])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 38 done)"
end

10.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 2)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Les Invalides, Paris"
    file = open(images[2])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 38 done)"
end

10.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 3)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Notre Dame, Paris"
    file = open(images[3])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 38 done)"
end

2.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 4)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- New Lands, Cape Town"
    file = open(images[4])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 38 done)"
end

2.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 5)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Times Square, New York"
    file = open(images[5])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 38 done)"
end

2.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 6)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Aoyama, Tokyo"
    file = open(images[6])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 38 done)"
end



# images.each do |element|
#     album = Album.create!(date: rand(2).years.ago, location_id: Location.first.id + sum)
#     puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}"
#     file = open(images[sum])
#     album.photos.attach(io: file, filename: 'some-image.jpg')
#     sum +=1
#     puts "(#{sum} of #{images.count} done)"
# end

verbis = ['This place is where I met Jorge for the first time, we drank a beer and enjoyed our day.',
'This day was a particular day, I received my exam result and got accepted in Harvard.',
'I met my idol Mastodon for the very first time on this street',
'I managed to do my first backflip with a stranger I met, called Matt and we became good friends.',
'Beautiful place, visiting for the 5th time and still amazes me',
'In love with the culture and the architecture, I need to organize this trip in the years to come.']

i = 0
verbis.each do |element|
    comment = Comment.create!(date: rand(24).months.ago, text: element, location_id: rand(Location.first.id..Location.last.id))
    puts "comment id: #{comment.id}- comment: #{comment.text}- date: #{comment.date}- location: #{comment.location_id}"
    i +=1
    puts "(#{i} of #{verbis.count} done)"
end
puts 'done'
