module SeedHelpers
  def self.text
    puts "In helpers.rb"
  end
  def self.gen_unique_name(other_name)
    puts "Other name: #{other_name}"
    name = Faker::Commerce.product_name
    puts "Name: #{name}"
    if name == other_name
      gen_unique_name(other_name)
    end
    name
  end
end