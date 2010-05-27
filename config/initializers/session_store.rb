# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_major_app_session',
  :secret      => '95a7207f69a767fa803c9ec2f517fc7f947f2688773dfd3a1143a826655a80b0a3b53542d93fbbfdb668f74637ea773734da7ea7fd6f9e680ccefd7dba66ee5d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
