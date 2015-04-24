# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'yoonsw12@gmail.com', password: '123', password_confirmation: '123')

marvel_exchange = Exchange.create(name:'marvelExchange', thumburl:'http://www.insidethemagic.net/wp-content/uploads/2013/02/marvel.jpg')
mario_exchange = Exchange.create(name:'marioExchange', thumburl:'http://screenshots.en.sftcdn.net/en/scrn/3334000/3334419/super-mario-galaxy-2-18-700x437.jpg')
gameOfThrones = Exchange.create(name:'gameOfThonesExchange', thumburl:'http://www.geekpeeks.com/wp-content/uploads/2011/12/gameofthrones-title-WIDE.jpg')