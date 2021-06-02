# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'



puts "\n\n\nCreating Fund pages \n\n\n"
CSV.foreach(Rails.root.join('db/funds-seed.csv'), headers: true) do |row|
  # Deal with the three fund types.
  if 'Write-in Fund' == row['title']
    fund_type = "write_in"
  elsif ['CU Anschutz Alumni License Plate Fund', 'CU Denver Alumni License Plate Program', 'CU Scholarship
 License Plate Fund'].include?(row['title'])
    fund_type = 'license_plate'
  else
    fund_type = "default"
  end

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
                interest: row['interest'],
                fund_type: fund_type
              })
  puts row['title']
end

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

Page.create({
              title: "About Us",
              slug: "about-us",
            })
puts "\n\n\nCreated About Us Page...\n\n\n"
