# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'josafa@example.com', password: 'password123@', confirmed_at: Date.today, role: User.roles[:admin])
User.create(email: 'edgar@renet-ce.com', password: 'password123@', confirmed_at: Date.today, role: User.roles[:admin])
User.create(email: 'rene@renet-ce.com', password: 'password123@', confirmed_at: Date.today, role: User.roles[:admin])
User.create(email: 'raimundo@renet-ce.com', password: 'password123@', confirmed_at: Date.today, role: User.roles[:admin])

