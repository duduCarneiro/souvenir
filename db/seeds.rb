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
places = ['Lagoa, Rio de Janeiro', 'Botafogo, Rio de Janeiro', 'Humaitá, Rio de Janeiro',
        'Ipanema, Rio de Janeiro', 'Tijuca, Rio de Janeiro']
count = 0
places.each do |element|
    location = Location.create!(address: element, user_id: first_user.id)
    puts "place id: #{location.id}- location: #{location.address}"
    count +=1
    puts "(#{count} of #{places.count} done)"
    puts '.'
end

puts 'creating fakes albums'
images = ['https://www.revistafullpower.com.br/wp-content/uploads/2020/11/ci01.jpg',
            'https://http2.mlstatic.com/D_NQ_NP_846954-MLB45640268040_042021-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_913422-MLB45779341320_052021-O.webp',
            'https://http2.mlstatic.com/D_NQ_NP_861510-MLB45704225506_042021-O.webp', 
            'https://http2.mlstatic.com/D_NQ_NP_927856-MLB45855074197_052021-O.webp']
sum = 0
images.each do |element|
    album = Album.create!(date: rand(10).years.ago, location_id: Location.first.id)
    puts "album id: #{album.id}- location: #{album.date}"
    file = open(images[sum])
    album.picture.attach(io: file, filename: 'some-image.jpg')
    count +=1
    puts "(#{sum} of #{Album.count} done)"
    puts '.'
end
puts 'done'