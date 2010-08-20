# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_registrate_session',
  :secret      => '7a534d8b074b59b83587b5970c6056d46dbe347866df9190387bbcd8f86b74c10714bc106752c07d2a835484934c15fc0b6f8dbeccd66029118995e77fa95e70'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
