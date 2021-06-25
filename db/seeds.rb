# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts "\n\n\nCreating Seed users \n\n\n"
alex1 = User.create(
  email: "alexander.finnarn@cu.edu",
  password: "admin123!",
  password_confirmation: "admin123!",
)
alex2 = User.create(
  email: "alex.finnarn@gmail.com",
  password: "admin123!",
  password_confirmation: "admin123!",
)

puts "\n\n\nCreating Spaces \n\n\n"
ce_space = Space.create(
  name: 'Content Editor',
  description: 'For content editors'
)
ce_space.users << alex1
fe_space = Space.create(
  name: 'Fund Manager',
  description: 'For fund managers'
)
fe_space.users << alex2

puts "\n\n\nCreating Fund pages \n\n\n"
CSV.foreach(Rails.root.join('db/seeds/funds-seed.csv'), headers: true) do |row|
  # Deal with the three fund types.
  if 'Write-in Fund' == row['title']
    fund_type = "write_in"
    #  @todo Fix this for CU Boulder...I think splitting the text might be an issue since Denver and Anschutz
    # do have the proper fund_type after seeding.
  elsif ['CU Anschutz Alumni License Plate Fund', 'CU Denver Alumni License Plate Program',
         'CU Scholarship License Plate Fund'].include?(row['title'])
    fund_type = 'license_plate'
  else
    fund_type = "default"
  end

  Fund.create({
                title: row['title'],
                slug: row['path'].present? ? row['path'].gsub!('/fund/', '') : row['title'],
                fund_owners: row['fund_owners'],
                description: row['description'],
                marketing_content: row['marketing_content'],
                marketing_content_expiration: row['marketing_content_expiration'],
                # Using a fake allocation code for write-in so it can be targeted elsewhere. The allocation
                # code is the closest thing a fund has to a unique ID.
                allocation_code: 'Write-in Fund' == row['title'] ? '9921871' : row['allocation_code'],
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
faqs_seed_path = "#{Rails.root}/db/seeds/faqs-seed.json"
faqs = JSON.parse(File.read(faqs_seed_path))
faqs.each do |faq|
  Faq.create({
               title: faq['title'],
               slug: faq['path'],
               content: faq['content'],
               category: faq['category'].to_i
             })
  puts faq['title']
end

puts "\n\n\nCreating Pages...\n\n\n"
CSV.foreach(Rails.root.join('db/seeds/pages-seed.csv'), headers: true) do |row|
  Page.create({
                title: row['title'],
                slug: row['path'],
                content: row['body'],
                published: true
              })
  puts row['title']
end
