# Load the rails application
require File.expand_path('../application', __FILE__)

# Load configuration data
APP_CONFIG = YAML.load_file("#{Rails.root.to_s}/config/app_config.yml")[Rails.env]

# Initialize the rails application
Registrame02::Application.initialize!