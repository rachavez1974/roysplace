# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




#lunch = Lunch.all? { |e|  }

#Consolidated all the tables I had before to one table.


items = MenuItem.all
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


  