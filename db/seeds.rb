# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#dMb TODO: Before this hits Prod, disable this seed data!
User.where(email: 'admin@example.com').destroy_all
User.create(email: 'admin@example.com', roles_mask: 1, 
  password: "password", password_confirmation: "password")


User.where(email: 'contributor@example.com').destroy_all
User.create(email: 'contributor@example.com', roles_mask: 2,
  password:"password", password_confirmation:"password")


User.where(email: 'reader@example.com').destroy_all
User.create(email: 'reader@example.com', roles_mask: 4,
  password:"password", password_confirmation:"password")
