# frozen_string_literal: true

require 'active_record'
require 'yaml'
require 'erb'
require 'logger'

task default: :migrate

desc 'Migrate database'
task migrate: :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV['VERSION'] ? ENV['VERSION'].to_i : nil )
end
