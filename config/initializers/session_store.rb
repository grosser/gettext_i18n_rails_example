# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gettext_example_rails_session',
  :secret      => 'b1d59d88ac0e3adc5128b5e7f7b22d2b496d9a4c06c7e0142b3e82efd9fe846c81ed056f610d8da6e536f60ade9d833d6fabd4cbd8a53921fb9e6af8f98588ed'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
