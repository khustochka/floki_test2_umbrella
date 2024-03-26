import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :floki_test2_web, FlokiTest2Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "w7lr91lCbGmaELVJR1ffA2spHcIJj1mZ1IcoELS+4I4JxqcO4+WiGq9+pbM6uXDz",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails.
config :floki_test2, FlokiTest2.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
