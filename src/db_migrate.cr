require "micrate"
require "pg"
require "yaml"

CONFIG =
  if File.exists?("./repo_config.yaml")
    YAML.parse(File.read("./repo_config.yaml"))
  else
    {} of String => String
  end

Micrate::DB.connection_url = ENV["DATABASE_URL"]? || CONFIG["DATABASE_URL"].to_s
Micrate::Cli.run
