# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_paradise_session',
  :secret      => '489c496bd34d3e3540e118fcf9537b8a4979bca2b5895cdd5eb9e4ac45624faacc4360a95a586a78850ba04f7d852551c4564d566ce001045e818670ef6694c6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
