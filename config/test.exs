import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :patch_example, PatchExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "D1EnakU+4jkOnYFLcgSk5+7PXv4bfXPBsmSA8+8gos+xpiORXJAb8+H3dXxHvw2K",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
