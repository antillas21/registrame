Factory.define :user do |user|
  user.email { "user#{rand(10000)}@example.com" }
  user.password "password"
  user.password_confirmation "password"
end