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
places = [['The biggest adventure', 'Avenue Montaigne, Paris'], ['My place', 'Les Invalides, Paris'], ['School trip', 'Notre Dame, Paris'], ['Surf trip', 'Ipanema, Rio de Janeiro'], ['Amazing journey', 'Newlands, Capetown'], ['My first time abroad', 'Time Square, New York'], ['Honeymoon', 'Aoyama, Tokyo']]

count = 0
places.each do |element|
    location = Location.create!(name: element[0], address: element[1], user_id: first_user.id)
    puts "place id: #{location.id}- location: #{location.address}"
    count +=1
    puts "(#{count} of #{places.count} done)"
end

puts 'creating fakes albums'

images_montaigne = ['https://www.dreameratheart.org/wp-content/uploads/2019/12/dancing-in-rue-Mouffetard.jpg',
        'https://images.unsplash.com/photo-1503127241807-fdc42d3acb95?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218fHx8fHx8fHwxNjI0MDQyMzAz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
        'http://cdn.cnn.com/cnnnext/dam/assets/200225162446-04-african-american-writers-artists-in-paris-deux-magots.jpg',
        'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2018/04/avanue-de-champs-elysees.jpg',
        'https://images.unsplash.com/photo-1570118449326-1e20ac059784?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218fHx8fHx8fHwxNjI0MDQwNzUz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600'
        ]

images_invalide = ['https://cdn.north-westbrides.com/wp-content/uploads/2018/10/21165104/people-3755342_960_720.jpg',
        'https://res.cloudinary.com/dii4d3v8r/image/upload/v1624044579/w12ep5xijipebwd7wlz8ng2p79j6.jpg',
        'https://images.unsplash.com/photo-1607453998774-d533f65dac99?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218fHx8fHx8fHwxNjI0MDM3ODMy&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
        'https://images.unsplash.com/photo-1504151932400-72d4384f04b3?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218fHx8fHx8fHwxNjI0MDQyMTQz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
        'https://images.unsplash.com/photo-1582143565907-6b8c074be35e?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218fHx8fHx8fHwxNjI0MDM4MTYz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600'
        ]
        
images_notredame = ['https://www.thelocal.fr/wp-content/uploads/2019/04/f41445a26f231a896a5ea3d92808ce4b29a8c9089eb15c5f03e859f608a8b547.jpg',
        'https://viagemeturismo.abril.com.br/wp-content/uploads/2016/12/1134863761.jpg?quality=70&strip=info&w=680&h=453&crop=1',
        'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/6e/d1/90.jpg',
        'https://familytwistdev-images.s3.eu-west-3.amazonaws.com/activity/1546247204989Notre_Dame_Medieval_ParisFamilyTwist_Paris_Notre_Dame_Medieval_Paris_11x.jpg',
        'https://www.catholicregister.org/media/k2/items/cache/087381c44d8fe74529d92a4430f72e21_XL.jpg'
        ]

images = ['https://source.unsplash.com/800x450/?ipanema,rio',
        'https://source.unsplash.com/800x450/?newlands,capetown',
        'https://source.unsplash.com/800x450/?timesquare,newyork',
        'https://source.unsplash.com/800x450/?aoyama,tokyo'
        ]
sum = 0
index_of_array_montaigne = 0
index_of_array_invalide = 0
index_of_array_notredame = 0

5.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 0)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Montaigne, Paris"
    
    file = open(images_montaigne[index_of_array_montaigne])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    index_of_array_montaigne +=1
    puts "(#{sum} of 23 done)"
end


5.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 1)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Les Invalides, Paris"
    file = open(images_invalide[index_of_array_invalide])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    index_of_array_invalide +=1
    puts "(#{sum} of 23 done)"
end

5.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 2)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Notre Dame, Paris"
    file = open(images_notredame[index_of_array_notredame])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    index_of_array_notredame +=1
    puts "(#{sum} of 23 done)"
end

# ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

2.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 3)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Ipanema, Rio de Janeiro"
    file = open(images[0])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 23 done)"
end

2.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 4)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- New Lands, Cape Town"
    file = open(images[1])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 23 done)"
end

2.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 5)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Times Square, New York"
    file = open(images[2])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 23 done)"
end

2.times do
    album = Album.create!(date: rand(24).months.ago, location_id: Location.first.id + 6)
    puts "album id: #{album.id}- date: #{album.date}- location: #{album.location_id}- Aoyama, Tokyo"
    file = open(images[3])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of 23 done)"
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
'In love with the culture and the architecture, I need to organize this trip in the years to come.',
'The past beats inside me like a second heart.',
"What i like about photographs is that they capture a moment that's gone forever, impossible to reproduce.",
'No matter how much suffering you went through, you never wanted to let go of those memories.']

i = 0
verbis.each do |element|
    comment = Comment.create!(date: rand(24).months.ago, text: element, location_id: rand(Location.first.id..Location.third.id))
    puts "comment id: #{comment.id}- comment: #{comment.text}- date: #{comment.date}- location: #{comment.location_id}"
    i +=1
    puts "(#{i} of #{verbis.count} done)"
end
puts 'done'
