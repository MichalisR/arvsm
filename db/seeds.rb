# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Request.destroy_all
User.destroy_all

User.create(name: "John Doe", email: 'johndoe@mycompany.com',
            position: 'Software Developer', password: 'myPassword',
            password_confirmation: 'myPassword', is_manager: 'false')

User.create(name: "Jane Doe", email: 'janedoe@mycompany.com',
            position: 'Manager', password: 'myPassword',
            password_confirmation: 'myPassword', is_manager: 'false')

User.create(name: "Foo Bar", email: 'foobar@mycompany.com',
            position: 'Manager', password: 'myPassword',
            password_confirmation: 'myPassword', is_manager: 'true')

p "Created #{User.count} users"