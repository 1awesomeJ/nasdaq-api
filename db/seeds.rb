# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

data = File.read(Rails.root.join("nasdaq_screener_1676118927498.csv"))

entries = CSV.parse(data, headers: true)

entries.each do |row|
    Company.create(
    ticker: row['Symbol'],
    name: row['Name'],
    price: row['Last Sale'],
    market_cap: row['Market Cap'],
    IPO_year: row['IPO Year'],
    sector: row['Industry']
    )
    end
