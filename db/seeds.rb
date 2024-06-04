# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
Share.destroy_all
Result.destroy_all
Team.destroy_all
Player.destroy_all
User.destroy_all

teams = [
  {name: "Germany", points: 0, group: "A"},
  {name: "Scotland", points: 0, group: "A"},
  {name: "Hungary", points: 0, group: "A"},
  {name: "Switzerland", points: 0, group: "A"},
  {name: "Spain", points: 0, group: "B"},
  {name: "Croatia", points: 0, group: "B"},
  {name: "Italy", points: 0, group: "B"},
  {name: "Albania", points: 0, group: "B"},
  {name: "Slovenia", points: 0, group: "C"},
  {name: "Denmark", points: 0, group: "C"},
  {name: "Serbia", points: 0, group: "C"},
  {name: "England", points: 0, group: "C"},
  {name: "Poland", points: 0, group: "D"},
  {name: "Netherlands", points: 0, group: "D"},
  {name: "Austria", points: 0, group: "D"},
  {name: "France", points: 0, group: "D"},
  {name: "Belgium", points: 0, group: "E"},
  {name: "Slovakia", points: 0, group: "E"},
  {name: "Romania", points: 0, group: "E"},
  {name: "Ukraine", points: 0, group: "E"},
  {name: "Turkey", points: 0, group: "F"},
  {name: "Georgia", points: 0, group: "F"},
  {name: "Portugal", points: 0, group: "F"},
  {name: "Czechia", points: 0, group: "F"},
]

users = [
  { email: 'haven@example.com', password: 'poopoo', admin: true },
  { email: 'atlee@example.com', password: 'peepee', admin: false },
  { email: 'dagan@example.com', password: 'poopee', admin: false },
]
puts "Created Users" if User.create(users)

players = [
  {name: "Atlee", points: 0, user_id: User.find_by(email: 'atlee@example.com').id},
  {name: "Dagan", points: 0, user_id: User.find_by(email: 'dagan@example.com').id},
  {name: "Haven", points: 0, user_id: User.find_by(email: 'haven@example.com').id},
]

puts "Added all teams." if Team.create(teams)
puts "Added all players." if Player.create(players).inspect
