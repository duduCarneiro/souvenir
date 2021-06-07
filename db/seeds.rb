# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Location.destroy_all
User.destroy_all

puts 'creating fake user'
first_user = User.create(password: '123456', email: 'ze@ninguem.com')

puts 'creating fakes locations'

places = ['Lagoa, Rio de Janeiro', 'Botafogo, Rio de Janeiro', 'Humaitá, Rio de Janeiro',
        'Ipanema, Rio de Janeiro', 'Tijuca, Rio de Janeiro']
count = 0
places.each do |element|
    location = Location.create!(address: element, user_id: first_user.id)
    puts "#{location.id}-#{location.address}"
    count +=1
    puts "#{count} of #{places.count} done"
end
puts 'done'