require "kemal"
require "krout"
require "kilt/slang"
require "pg"
require "crecto"

require "./lunch/repo.cr"
require "./lunch/controllers/base_controller.cr"
require "./lunch/**"

add_handler SessionHandler.new
add_handler FeatureFlagHandler.new

Kemal.run
