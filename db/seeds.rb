# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
CSV.foreach(Rails.root.join('db/funds-seed.csv'), headers: true) do |row|
  Fund.create({
    title: row['title'],
    description: row['description'],
    allocation_code: row['allocation_code'],
    priority_fund: row['priority_fund'],
    featured_fund: row['featured_fund'],
    active: row['active'],
    campus: row['campus'],
    keywords: row['keywords'],
    interest: row['interest'],
    fund_type: row['fund_type'],
    suggested_amount: row['suggested_amount'],
    marketing_content: row['marketing_content'],
  })
  puts row['title']
end