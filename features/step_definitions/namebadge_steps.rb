Given /^there is the following name badge:$/ do |table|
  table.hashes.each do |attributes|
    NameBadge.create!(attributes)
  end
end