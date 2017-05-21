# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.destroy_all
['The Doors',
  'The Doors',
  'Pink Floyd',
  'Ozzy Osbourne',
  'DJ Dado',
  'The Killers',
  'The Who'].each do |name|
    Artist.create! name: name
  end

  Album.destroy_all
  ['The Best of the Doors',
    'Waiting for the Sun',
    'Hot Fuss',
    'Battle Born',
    'Live at Leeds',
    'The X Files'
  ].each do |name|
    Album.create! name: name
  end

  Label.destroy_all
  ['Universal',
    'Virgin',
    'Atlantic',
    'Geffen'].each do |name|
    Label.create! name: name
  end
