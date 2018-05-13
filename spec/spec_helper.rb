require 'yaml'
require 'active_record'
require 'database_cleaner'
require 'support/factory_bot'
require 'pry'

# Connect to test DB
env = 'test'
db_conf = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(db_conf[env])

# Load Necessary Files
Dir.glob('./models/**/*.rb') { |f| require f }

RSpec.configure do |config|
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
