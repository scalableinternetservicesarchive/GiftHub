# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do 
    unless Exchange.exists?(name: 'Marvel')
        # Past
        marvel_exchange = Exchange.create(name:'Marvel', thumburl:'http://www.insidethemagic.net/wp-content/uploads/2013/02/marvel.jpg', description: 'Marvel-related item exchange', registration_start: '2015-04-17 00:00:00', registration_end: '2015-04-25 00:00:00', gift_due_date: '2015-05-07 00:00:00')
        lol_exchange = Exchange.create(name:'League of Legends', thumburl:'http://n3rdbomber.com/wp-content/uploads/2015/01/league-of-legends.jpg', description: 'League of Legends-related item exchange', registration_start: '2015-04-12 00:00:00', registration_end: '2015-04-17 00:00:00', gift_due_date: '2015-04-27 00:00:00')

        # Current
        mario_exchange = Exchange.create(name:'Super Mario', thumburl:'http://screenshots.en.sftcdn.net/en/scrn/3334000/3334419/super-mario-galaxy-2-18-700x437.jpg', description: 'Mario-related item exchange', registration_start: '2015-05-13 00:00:00', registration_end: '2015-05-27 00:00:00', gift_due_date: '2015-06-05 00:00:00')
        thones_exchange = Exchange.create(name:'Game of Thrones', thumburl:'http://www.geekpeeks.com/wp-content/uploads/2011/12/gameofthrones-title-WIDE.jpg', description: 'Game of Thrones-related item exchange', registration_start: '2015-05-17 00:00:00', registration_end: '2015-05-27 00:00:00', gift_due_date: '2015-06-05 00:00:00')
        pokemon_exchange = Exchange.create(name: 'Pokemon', thumburl: 'http://beagamecharacter.com/wp-content/uploads/2013/01/Pokemon-Reveal.jpg', description: 'Pokemon-related item exchange', registration_start: '2015-05-17 00:00:00', registration_end: '2015-05-30 00:00:00', gift_due_date: '2015-06-12 00:00:00')
        dc_exchange = Exchange.create(name: 'DC', thumburl: 'http://cdn1.sciencefiction.com/wp-content/uploads/2014/04/DCSuperHeroes.jpg', description: 'DC Comics-related item exchange', registration_start: '2015-05-17 00:00:00', registration_end: '2015-05-30 00:00:00', gift_due_date: '2015-06-12 00:00:00')
        bunny_exchange = Exchange.create(name: 'Bunny', thumburl: 'http://www.clickreadshare.com/wp-content/uploads/bunny-on-a-bed-big.jpg', description: 'Bunny-related item exchange', registration_start: '2015-05-17 00:00:00', registration_end: '2015-05-30 00:00:00', gift_due_date: '2015-06-12 00:00:00')
        plane_exchange = Exchange.create(name: 'Plane', thumburl: 'http://www.latestpilotjobs.com/ckfiles/images/1(22).jpg', description: 'Plane-related item exchange', registration_start: '2015-05-30 00:00:00', registration_end: '2015-06-05 00:00:00', gift_due_date: '2015-06-12 00:00:00')
        nerf_exchange = Exchange.create(name: 'Nerf', thumburl: 'http://i296.photobucket.com/albums/mm199/ArR0ws0fLlfe/DSC00595.jpg', description: 'Nerf-related item exchange', registration_start: '2015-05-30 00:00:00', registration_end: '2015-06-05 00:00:00', gift_due_date: '2015-06-12 00:00:00')
        tom_hanks_exchange = Exchange.create(name: 'Tom Hanks', thumburl: 'http://assets-s3.mensjournal.com/img/article/tom-hanks-the-mj-interview/298_298_tom-hanks-the-mj-interview.jpg', description: 'Tom Hanks-related item exchange', registration_start: '2015-06-05 00:00:00', registration_end: '2015-06-12', gift_due_date: '2015-06-20 00:00:00')
        jewelry_exchange = Exchange.create(name: 'Jewelry', thumburl: 'http://www.qccrimestoppers.com/images/jewelry.jpg', description: 'Jewelry-related item exchange', registration_start: '2015-06-05 00:00:00', registration_end: '2015-06-17 00:00:00', gift_due_date: '2015-06-20 00:00:00')
        
        start = 0
        10000.times do |i|
            x = Exchange.create(
            name:'Exchange#{i}', 
            thumburl:'http://screenshots.en.sftcdn.net/en/scrn/3334000/3334419/super-mario-galaxy-2-18-700x437.jpg', 
            description: 'Exchange#{i}', 
            registration_start: '2015-05-13 00:00:00', 
            registration_end: '2015-05-27 00:00:00', 
            gift_due_date: '2015-06-05 00:00:00')
            x.save!
        end    
    end

    unless User.exists?(email: "admin@admin.com")
        #add a admin user
        User.create!(
            email: "admin@admin.com",
            password:              '11111111',
            encrypted_password: Devise.bcrypt(User, '11111111'),
            admin: true
        )
    end

    unless ExchangeProfile.exists?(exchange_id: 1)
        # Add exchange profiles
        ExchangeProfile.create(
            user_id: 2,
            exchange_id: 1,
            gift_received: false
        )

        ExchangeProfile.create(
            user_id: 2,
            exchange_id: 2,
            gift_received: false
        )

        ExchangeProfile.create(
            user_id: 3,
            exchange_id: 1,
            gift_received: false
        )

        ExchangeProfile.create(
            user_id: 3,
            exchange_id: 2,
            gift_received: false
        )

        ExchangeProfile.create(
            user_id: 4,
            exchange_id: 1,
            gift_received: false
        )

        ExchangeProfile.create(
            user_id: 4,
            exchange_id: 2,
            gift_received: false
        )

        ExchangeProfile.create(
            user_id: 5,
            exchange_id: 1,
            gift_received: false
        )

        ExchangeProfile.create(
            user_id: 5,
            exchange_id: 2,
            gift_received: false
        )

        ExchangeProfile.create(
            user_id: 6,
            exchange_id: 2,
            gift_received: false
        )    
    end

end