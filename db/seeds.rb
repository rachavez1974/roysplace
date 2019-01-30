# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# lunch1=Lunch.first_name

# Lunch.all = [lunch1, lunch2,...]
# Breakfast.all = [breakfast1, breakfast, ...]
# Lunch.all + Breakfast.all = [lunch1, lunch2, ..., breakfast1, breakfast2,...]
# ...
# [].concat(["apple","orange"]) 
# ["apple", "orange"]
#[lunch1, lunch2,..., breakfast1, breakfast2, ..., dinner1, ....]

#lunch = Lunch.all? { |e|  }

# allofthem.contact([lunch1, lunch2,...]+[breakfast1, breakfast, ...]+...+[...])
# allofthem.contact([lunch1, lunch2,..., breakfast1, breakfast, ...])
# [lunch1, lunch2,..., breakfast1, breakfast, ...]

#Consolidated all the tables I had before to one table. 
items = Menu.all
ActiveRecord::Base.connection.reset_pk_sequence!('menus')
ActiveRecord::Base.transaction do 
  items.each do |item|
    MenuItem.create!(
      name: item.name,
      description: item.description,
      price: item.price,
      availability: item.availability,
      section: item.section,
      menu_type: item.menu_type,
      created_at: item.created_at,
      updated_at: item.updated_at
    )
  end
end



User.create!(first_name: "Razor", 
            last_name: "Ramon",
            password: "1",
            password_confirmation: "1", 
            phone_number: 2408675309,
            birth_day: Date.parse('January, 8'),
            email: "r@gmail.com",
            text_club: true,
            activated: true,
            email_club: true,
            terms: true,
            admin: true)


  