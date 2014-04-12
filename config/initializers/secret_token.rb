# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Scheduler::Application.config.secret_key_base = '3f235dccd30193a71c4f6fbbda480152dabfeb2f8f9e06f873988b7d11a23b689efe9a7154a6180a054e62366f41ed92a33ff56eacfbe1f2a54feaec46b1577f'
