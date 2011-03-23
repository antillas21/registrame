Given /^there are the following companies$/ do |table|
  table.hashes.each do |attributes|
    Company.create!(attributes)
  end
end

