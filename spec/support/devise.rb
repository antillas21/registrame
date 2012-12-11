RSpec.configure do |config|
  # include Devise test helpers
  config.include Devise::TestHelpers, :type => :controller
end