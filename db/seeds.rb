# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
Share.destroy_all
Result.destroy_all
Team.destroy_all
Team.create([
  {name: "Qatar", points: 0, group: "A"},
  {name: "Ecuador", points: 0, group: "A"},
  {name: "Senegal", points: 0, group: "A"},
  {name: "Netherlands", points: 0, group: "A"},
  {name: "England", points: 0, group: "B"},
  {name: "Iran", points: 0, group: "B"},
  {name: "United States", points: 0, group: "B"},
  {name: "Wales", points: 0, group: "B"},
  {name: "Argentina", points: 0, group: "C"},
  {name: "Saudi Arabia", points: 0, group: "C"},
  {name: "Mexico", points: 0, group: "C"},
  {name: "Poland", points: 0, group: "C"},
  {name: "France", points: 0, group: "D"},
  {name: "Australia", points: 0, group: "D"},
  {name: "Denmark", points: 0, group: "D"},
  {name: "Tunisia", points: 0, group: "D"},
  {name: "Spain", points: 0, group: "E"},
  {name: "Costa Rica", points: 0, group: "E"},
  {name: "Germany", points: 0, group: "E"},
  {name: "Japan", points: 0, group: "E"},
  {name: "Belgium", points: 0, group: "F"},
  {name: "Canada", points: 0, group: "F"},
  {name: "Morocco", points: 0, group: "F"},
  {name: "Croatia", points: 0, group: "F"},
  {name: "Brazil", points: 0, group: "G"},
  {name: "Serbia", points: 0, group: "G"},
  {name: "Switzerland", points: 0, group: "G"},
  {name: "Cameroon", points: 0, group: "G"},
  {name: "Portugal", points: 0, group: "H"},
  {name: "Ghana", points: 0, group: "H"},
  {name: "Uruguay", points: 0, group: "H"},
  {name: "South Korea", points: 0, group: "H"},
])

Player.destroy_all
Player.create([
  {name: "Alex", points: 0},
  {name: "Andre", points: 0},
  {name: "Andy", points: 0},
  {name: "Atlee", points: 0},
  {name: "Beth", points: 0},
  {name: "Dagan", points: 0},
  {name: "Haven", points: 0},
  {name: "Isaac", points: 0},
  {name: "JSB", points: 0},
  {name: "Katie", points: 0},
  {name: "Loewen", points: 0},
  {name: "Ned", points: 0},
])

puts "Added all teams. Added all players"