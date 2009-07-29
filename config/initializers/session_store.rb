# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sunset_pta_session',
  :secret      => 'a61407b2397eadfa14318f1ee0162c838ab3d7eac188efc4bf3a82a176e22d1b2fbc498425829057a3627000a8331843843722a1c85afa42871a0c9ffafc82be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
