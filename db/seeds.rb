# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create admin user
User.find_or_create_by_username("admin") do |user|
  user.username = "admin"
  user.email = "admin@example.com"
  user.password = "password"
  user.password_confirmation = "password"
end

User.find_by_username("admin").update_attribute(:admin, true)
puts "\nCreated admin user, login info is\nusername: admin\npassword: password"
puts "It is VERY IMPORTANT TO CHANGE THIS VALUES."

# Create demo event
Event.create!(
  :name => "My Demo Event", :venue => "Some Important Venue",
  :website => "http://demoevent.com", :date => (Date.today + 3.months),
  :info => "Enter your description here, please no more than 300 characters."
)
puts "\nCreated a demo event. You may edit this info from the Admin Dashboard by following"
puts "Config > Event Info."

# Create demo namebadge
NameBadge.create!(
  :name => "Default", :width => 4, :height => 4,
  :left => 0.2, :right => 0.2, :top => 0.2, :bottom => 0.2, :font_size => 16
)
puts "\nCreated default name badge size. You may edit it from the Admin Dashboard by following"
puts "Config > Name Badge."