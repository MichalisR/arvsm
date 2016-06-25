# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

User.create(name: "Michalis Rodios", email: 'michalis.rodios@gmail.com',
            position: 'Software Developer', password: 'myPassword',
            password_confirmation: 'myPassword', manager: 'false')

p "Created #{User.count} users"