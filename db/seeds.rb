# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

faq_cats = {'Common Giving Terms': 0, 'Ways to Give': 1, 'General Questions About Giving at CU': 2}

Page.create({
  title: "About Us",
  slug: "about-us",
})

puts "Created About Us Page..."

puts "\n\n\nCreating FAQ pages \n\n\n"
faqs_seed_path = "#{Rails.root}/db/faqs-seed.json"
faqs = JSON.parse(File.read(faqs_seed_path))
faqs.each do |faq|
  Faq.create({
    title: faq['title'],
    content: faq['content'],
    category: faq['category'].to_i
  })
  puts faq['title']
end

puts "\n\n\nCreating Fund pages \n\n\n"
CSV.foreach(Rails.root.join('db/funds-seed.csv'), headers: true) do |row|
  Fund.create({
    title: row['title'],
    fund_owners: row['fund_owners'],
    description: row['description'],
    marketing_content: row['marketing_content'],
    marketing_content_expiration: row['marketing_content_expiration'],
    allocation_code: row['allocation_code'],
    suggested_amount: row['suggested_amount'],
    featured_fund: row['featured_fund'],
    active: row['active'],
    campus: row['campus'],
    keywords: row['keywords'],
    interest: row['interest']
  })
  puts row['title']
end
