# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[].tap do |array|
  100.times do |i|
    created_at = Time.current

    array << {
      title: "This is #{i+1} Article",
      text: "Hello This is #{i+1} Text",
      created_at: created_at,
      updated_at: created_at
    }
  end

  result = Article.insert_all array
  puts result.inspect
end
