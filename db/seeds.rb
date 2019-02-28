# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




#lunch = Lunch.all? { |e|  }

#Consolidated all the tables I had before to one table.


# items = MenuItem.all
# ActiveRecord::Base.connection.reset_pk_sequence!('menus')
# ActiveRecord::Base.transaction do 
#   items.each do |item|
#     MenuItem.create!(
#       name: item.name,
#       description: item.description,
#       price: item.price,
#       availability: item.availability,
#       section: item.section,
#       menu_type: item.menu_type,
#       created_at: item.created_at,
#       updated_at: item.updated_at
#     puts item.name
#   end
# end



#read from local databse all items first, open a new file a save to lib directory, and write to that file
# items = MenuItem.all
# open('lib/seeds/menu_items.txt', 'wb') do |txt|
#   items.each do |item|  
#     txt << [item.name,item.description,item.price,item.availability,item.section,
#     item.menu_type]
#   end
# end

  
  menu_item_file = File.open('lib/seeds/menu_items.txt')
  lines = IO.readlines(menu_item_file)

  lines.each do |line|
   item_parts = line.split(',')
    item_parts.each do |part|
      MenuItem.create!(
        name: part[0],
        description: part[1],
        price: part[2],
        availability: part[3],
        section: part[4],
        menu_type: part[5]
        )
    end     
  end

#********************************

# ActiveRecord::Base.connection.reset_pk_sequence!('menus')
# ActiveRecord::Base.transaction do 
#   items.each do |item|
#     MenuItem.create!(
#       name: item.name,
#       description: item.description,
#       price: item.price,
#       availability: item.availability,
#       section: item.section,
#       menu_type: item.menu_type,
#       created_at: item.created_at,
#       updated_at: item.updated_at
#     puts item.name
#   end
# end


# User.create!(first_name: "Razor", 
#             last_name: "Ramon",
#             password: "1",
#             password_confirmation: "1", 
#             phone_number: 2408675309,
#             birth_day: Date.parse('January, 8'),
#             email: "r@gmail.com",
#             text_club: true,
#             activated: true,
#             email_club: true,
#             terms: true,
#             admin: true)


  