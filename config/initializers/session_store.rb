# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sportent_session',
  :secret      => '8ce47287f41b1de7b94c15c80bbc57df685d3dd44e78ba1b9effa5b738ce14477f90b4d3a339ddb0406246da6f96a8d14d367f78bb37a8cee5a17b8a6b092925'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
